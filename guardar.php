<?php
// Inicio de sesión seguro
if (session_status() === PHP_SESSION_NONE) session_start();

require 'session_config.php';
require 'database.php';
require 'auth_middleware.php';
requireAuth();
requireRole(['SISTEMAS', 'ADMIN', 'CAPTURISTA']);

// Configuración de errores
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Verificación de sesión
if (!isset($_SESSION['user']['id'])) {
    die(json_encode(['error' => 'No hay sesión activa']));
}

// Validación del formulario
if ($_SERVER['REQUEST_METHOD'] !== 'POST' || empty($_FILES['pdf_file'])) {
    header('Location: index.php');
    exit;
}

// Antes de procesar el formulario
$numero_empleado = trim($_POST['numero_empleado']);
$numero_empleado = preg_replace('/[^A-Za-z0-9\-]/', '', $numero_empleado); // Solo letras, números y guiones

if (empty($numero_empleado)) {
    die("Número de empleado inválido");
}

// Inicio de transacción
$conn->begin_transaction();

try {
    // 1. Generar número de oficio
    mysqli_query($conn, "LOCK TABLES secuencia_oficios WRITE");
    $seq_result = mysqli_query($conn, "SELECT ultimo_numero FROM secuencia_oficios");
    $seq_row = mysqli_fetch_assoc($seq_result);
    $nuevo_numero = $seq_row['ultimo_numero'] + 1;
    mysqli_query($conn, "UPDATE secuencia_oficios SET ultimo_numero = $nuevo_numero");
    mysqli_query($conn, "UNLOCK TABLES");

    $numero_oficio = "OF-".str_pad($nuevo_numero, 5, '0', STR_PAD_LEFT);

    // 2. Procesar datos del formulario
    $remitente = trim($_POST['remitente']);
    $cargo_remitente = trim($_POST['cargo_remitente']);
    $depto_remitente = $_POST['depto_remitente'] === 'OTRO' 
        ? trim($_POST['depto_remitente_otro'])
        : trim($_POST['depto_remitente']);

    // 3. Gestionar empleado
    $check_query = "SELECT id, departamento_jud FROM catalogo_personal WHERE numero_empleado = ?";
    $stmt_check = mysqli_prepare($conn, $check_query);
    mysqli_stmt_bind_param($stmt_check, 's', $numero_empleado);
    mysqli_stmt_execute($stmt_check);
    $empleado = mysqli_fetch_assoc(mysqli_stmt_get_result($stmt_check));

    if ($empleado) {
        $personal_id = $empleado['id'];

        if ($empleado['departamento_jud'] != $depto_remitente) {
            $historial_query = "INSERT INTO historial_departamentos 
                (personal_id, departamento_anterior, departamento_nuevo, usuario_id) 
                VALUES (?, ?, ?, ?)";
            $stmt_hist = mysqli_prepare($conn, $historial_query);
            mysqli_stmt_bind_param($stmt_hist, 'issi', 
                $empleado['id'],
                $empleado['departamento_jud'],
                $depto_remitente,
                $_SESSION['user']['id']
            );
            mysqli_stmt_execute($stmt_hist);

            $update_query = "UPDATE catalogo_personal SET 
                            departamento_jud = ?,
                            ultima_actualizacion = CURRENT_TIMESTAMP
                            WHERE id = ?";
            $stmt_update = mysqli_prepare($conn, $update_query);
            mysqli_stmt_bind_param($stmt_update, 'si', $depto_remitente, $empleado['id']);
            mysqli_stmt_execute($stmt_update);
        }
    } else {
        $insert_query = "INSERT INTO catalogo_personal 
            (numero_empleado, nombre, puesto, departamento_jud, dire_fisica, telefono) 
            VALUES (?, ?, ?, ?, ?, ?)";
        $stmt_insert = mysqli_prepare($conn, $insert_query);
        mysqli_stmt_bind_param($stmt_insert, 'ssssss', 
            $numero_empleado,
            $remitente,
            $cargo_remitente,
            $depto_remitente,
            $_POST['dire_fisica'],
            $_POST['telefono']
        );
        mysqli_stmt_execute($stmt_insert);
        $personal_id = mysqli_insert_id($conn);

        $historial_query = "INSERT INTO historial_departamentos 
            (personal_id, departamento_nuevo, usuario_id) 
            VALUES (?, ?, ?)";
        $stmt_hist = mysqli_prepare($conn, $historial_query);
        mysqli_stmt_bind_param($stmt_hist, 'isi', 
            $personal_id,
            $depto_remitente,
            $_SESSION['user']['id']
        );
        mysqli_stmt_execute($stmt_hist);
    }

    // 4. Procesar PDF
    if ($_FILES['pdf_file']['error'] !== UPLOAD_ERR_OK) {
        throw new Exception("Error en archivo PDF: ".$_FILES['pdf_file']['error']);
    }

    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mime_type = finfo_file($finfo, $_FILES['pdf_file']['tmp_name']);
    finfo_close($finfo);

    if ($mime_type != 'application/pdf') {
        throw new Exception("Solo se permiten archivos PDF");
    }

    $upload_dir = 'pdfs/';
    if (!file_exists($upload_dir)) {
        mkdir($upload_dir, 0755, true);
    }

    $pdf_name = 'doc_'.date('Ymd_His').'_'.uniqid().'.pdf';
    $pdf_path = $upload_dir.$pdf_name;

    if (!move_uploaded_file($_FILES['pdf_file']['tmp_name'], $pdf_path)) {
        throw new Exception("Error al mover el PDF");
    }

    // 5. Validar campos requeridos
    $required = ['fecha_entrega', 'asunto', 'tipo', 'estatus'];
    foreach ($required as $field) {
        if (empty($_POST[$field])) {
            throw new Exception("Campo requerido: ".$field);
        }
    }

    // 6. Insertar documento
    $jud_destino = $_POST['jud_destino'] === 'OTRO'
        ? trim($_POST['jud_destino_otro'])
        : trim($_POST['jud_destino']);

    $insert_doc_query = "INSERT INTO documentos (
        fecha_entrega, numero_oficio, remitente, cargo_remitente, 
        depto_remitente, telefono, asunto, tipo, estatus, 
        pdf_url, destinatario, jud_destino, numero_empleado,
        dire_fisica, usuario_registra, etapa
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt_doc = mysqli_prepare($conn, $insert_doc_query);

    $etapa = 'RECIBIDO';
    $destinatario = $_POST['trabajador_destino'] ?? '';
    $usuario_id = $_SESSION['user']['id'];

    mysqli_stmt_bind_param($stmt_doc, 'ssssssssssssssis',
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
    mysqli_stmt_execute($stmt_doc);
    $documento_id = mysqli_insert_id($conn);

    // 7. Registrar en historial laboral
    $hist_lab_query = "INSERT INTO historial_laboral 
        (personal_id, accion, detalles, usuario_id, documento_id) 
        VALUES (?, ?, ?, ?, ?)";
    $stmt_hist_lab = mysqli_prepare($conn, $hist_lab_query);

    $accion = 'REGISTRO_OFICIO';
    $detalles = "Oficio: $numero_oficio - Asunto: ".substr($_POST['asunto'], 0, 100);

    mysqli_stmt_bind_param($stmt_hist_lab, 'issii',
        $personal_id,
        $accion,
        $detalles,
        $usuario_id,
        $documento_id
    );
    mysqli_stmt_execute($stmt_hist_lab);

    $conn->commit();

    $_SESSION['success'] = "Documento $numero_oficio registrado correctamente";
    header("Location: index.php");
    exit;

} catch (Exception $e) {
    $conn->rollback();

    if (isset($pdf_path) && file_exists($pdf_path)) {
        @unlink($pdf_path);
    }

    $_SESSION['error'] = "Error: ".$e->getMessage();
    error_log("Error en guardar.php: ".$e->getMessage());
    header("Location: index.php");
    exit;
}


