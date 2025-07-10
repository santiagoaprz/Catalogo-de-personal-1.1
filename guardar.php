<?php
if (session_status() === PHP_SESSION_NONE) session_start();

require 'session_config.php';
require 'database.php';
require 'auth_middleware.php';
requireAuth();
requireRole(['SISTEMAS', 'ADMIN', 'CAPTURISTA']);

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Verificación mejorada de sesión
if (!isset($_SESSION['user']['id'])) {
    die(json_encode(['error' => 'Sesión no válida', 'details' => 'ID de usuario no encontrado']));
}

// Validación robusta del formulario
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die(json_encode(['error' => 'Método no permitido']));
}

if (empty($_FILES['pdf_file']['tmp_name'])) {
    die(json_encode(['error' => 'Archivo PDF requerido']));
}

// Procesamiento seguro del número de empleado
$numero_empleado = preg_replace('/[^A-Za-z0-9\-]/', '', trim($_POST['numero_empleado']));
if (empty($numero_empleado)) {
    die(json_encode(['error' => 'Número de empleado inválido']));
}

// Configuración inicial
$conn->begin_transaction();
$personal_id = null;
$documento_id = null;
$pdf_path = null;

try {
    // 1. Generación de número de oficio (optimizado)
    mysqli_query($conn, "LOCK TABLES secuencia_oficios WRITE");
    $seq_result = mysqli_query($conn, "SELECT ultimo_numero FROM secuencia_oficios LIMIT 1 FOR UPDATE");
    $seq_row = mysqli_fetch_assoc($seq_result);
    $nuevo_numero = (int)$seq_row['ultimo_numero'] + 1;
    mysqli_query($conn, "UPDATE secuencia_oficios SET ultimo_numero = $nuevo_numero");
    mysqli_query($conn, "UNLOCK TABLES");
    
    $numero_oficio = "OF-".str_pad($nuevo_numero, 5, '0', STR_PAD_LEFT);

    // 2. Procesamiento de datos del formulario
    $remitente = trim($_POST['remitente']);
    $cargo_remitente = trim($_POST['cargo_remitente']);
    $depto_remitente = ($_POST['depto_remitente'] === 'OTRO') 
        ? trim($_POST['depto_remitente_otro'])
        : trim($_POST['depto_remitente']);

    // 3. Gestión del empleado (mejorada)
    $check_query = "SELECT id, departamento_jud FROM catalogo_personal WHERE numero_empleado = ? LIMIT 1";
    $stmt_check = $conn->prepare($check_query);
    $stmt_check->bind_param('s', $numero_empleado);
    $stmt_check->execute();
    $empleado = $stmt_check->get_result()->fetch_assoc();

    if ($empleado) {
        $personal_id = $empleado['id'];
        
        // Actualizar departamento si cambió
        if ($empleado['departamento_jud'] != $depto_remitente) {
            $historial_query = "INSERT INTO historial_departamentos 
                (personal_id, departamento_anterior, departamento_nuevo, usuario_id) 
                VALUES (?, ?, ?, ?)";
            $stmt_hist = $conn->prepare($historial_query);
            $stmt_hist->bind_param('issi', 
                $personal_id,
                $empleado['departamento_jud'],
                $depto_remitente,
                $_SESSION['user']['id']
            );
            $stmt_hist->execute();

            $update_query = "UPDATE catalogo_personal SET 
                departamento_jud = ?,
                ultima_actualizacion = CURRENT_TIMESTAMP
                WHERE id = ?";
            $stmt_update = $conn->prepare($update_query);
            $stmt_update->bind_param('si', $depto_remitente, $personal_id);
            $stmt_update->execute();
        }
    } else {
        // Insertar nuevo empleado con validación
        $insert_query = "INSERT INTO catalogo_personal 
            (numero_empleado, nombre, puesto, departamento_jud, dire_fisica, telefono) 
            VALUES (?, ?, ?, ?, ?, ?)";
        $stmt_insert = $conn->prepare($insert_query);
        $stmt_insert->bind_param('ssssss', 
            $numero_empleado,
            $remitente,
            $cargo_remitente,
            $depto_remitente,
            $_POST['dire_fisica'],
            $_POST['telefono']
        );
        
        if (!$stmt_insert->execute()) {
            throw new Exception("Error al crear empleado: ".$stmt_insert->error);
        }
        
        $personal_id = $conn->insert_id;
        
        // Registrar en historial
        $historial_query = "INSERT INTO historial_departamentos 
            (personal_id, departamento_nuevo, usuario_id) 
            VALUES (?, ?, ?)";
        $stmt_hist = $conn->prepare($historial_query);
        $stmt_hist->bind_param('isi', 
            $personal_id,
            $depto_remitente,
            $_SESSION['user']['id']
        );
        $stmt_hist->execute();
    }

    // 4. Procesamiento de PDF (seguro)
    if (!is_uploaded_file($_FILES['pdf_file']['tmp_name'])) {
        throw new Exception("Intento de subida no válido");
    }

    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mime_type = finfo_file($finfo, $_FILES['pdf_file']['tmp_name']);
    finfo_close($finfo);

    if ($mime_type != 'application/pdf') {
        throw new Exception("Solo se permiten archivos PDF (tipo detectado: $mime_type)");
    }

    $upload_dir = 'pdfs/';
    if (!file_exists($upload_dir)) {
        if (!mkdir($upload_dir, 0755, true)) {
            throw new Exception("No se pudo crear el directorio PDF");
        }
    }

    $pdf_name = 'doc_'.date('Ymd_His').'_'.bin2hex(random_bytes(4)).'.pdf';
    $pdf_path = $upload_dir.$pdf_name;

    if (!move_uploaded_file($_FILES['pdf_file']['tmp_name'], $pdf_path)) {
        throw new Exception("Error al mover el PDF. Verifique permisos.");
    }

    // 5. Validación de campos requeridos
    $required = ['fecha_entrega', 'asunto', 'tipo', 'estatus'];
    foreach ($required as $field) {
        if (empty($_POST[$field])) {
            throw new Exception("Campo requerido faltante: $field");
        }
    }

    // 6. Inserción del documento (optimizada)
    $jud_destino = ($_POST['jud_destino'] === 'OTRO')
        ? trim($_POST['jud_destino_otro'])
        : trim($_POST['jud_destino']);

    $insert_doc_query = "INSERT INTO documentos (
        fecha_entrega, numero_oficio, remitente, cargo_remitente, 
        depto_remitente, telefono, asunto, tipo, estatus, 
        pdf_url, destinatario, jud_destino, numero_empleado,
        dire_fisica, usuario_registra, etapa
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt_doc = $conn->prepare($insert_doc_query);
    $etapa = 'RECIBIDO';
    $destinatario = $_POST['trabajador_destino'] ?? '';
    $usuario_id = $_SESSION['user']['id'];

    $stmt_doc->bind_param('ssssssssssssssis',
        $_POST['fecha_entrega'],
        $numero_oficio,
        $remitente,
        $cargo_remitente,
        $depto_remitente,
        $_POST['telefono'],
        $_POST['asunto'],
        $_POST['tipo'],
        $_POST['estatus'],
        $pdf_path,
        $destinatario,
        $jud_destino,
        $numero_empleado,
        $_POST['dire_fisica'],
        $usuario_id,
        $etapa
    );
    
    if (!$stmt_doc->execute()) {
        throw new Exception("Error al guardar documento: ".$stmt_doc->error);
    }
    
    $documento_id = $conn->insert_id;

    // 7. Historial laboral (opcional)
    if ($personal_id) {
        $hist_lab_query = "INSERT INTO historial_laboral 
            (personal_id, accion, detalles, usuario_id, documento_id) 
            VALUES (?, ?, ?, ?, ?)";
        $stmt_hist_lab = $conn->prepare($hist_lab_query);

        $accion = 'REGISTRO_OFICIO';
        $detalles = "Oficio: $numero_oficio - Asunto: ".substr($_POST['asunto'], 0, 100);

        $stmt_hist_lab->bind_param('issii',
            $personal_id,
            $accion,
            $detalles,
            $usuario_id,
            $documento_id
        );
        $stmt_hist_lab->execute();
    }

    // Confirmar transacción
    $conn->commit();

    $_SESSION['success'] = "Documento $numero_oficio registrado correctamente";
    header("Location: index.php");
    exit;

} catch (Exception $e) {
    $conn->rollback();
    
    // Limpieza segura
    if ($pdf_path && file_exists($pdf_path)) {
        @unlink($pdf_path);
    }

    // Registro detallado del error
    error_log("ERROR en guardar.php: ".$e->getMessage()."\nTrace:\n".$e->getTraceAsString());
    
    $_SESSION['error'] = "Error al procesar el documento: ".$e->getMessage();
    header("Location: index.php");
    exit;
}

