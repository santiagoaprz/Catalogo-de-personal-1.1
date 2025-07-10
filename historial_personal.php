<?php
require 'session_config.php';
require 'auth_middleware.php';
requireAuth();
require 'database.php';

if (!isset($_GET['id'])) {
    header('Location: catalogo.php');
    exit;
}

$personal_id = (int)$_GET['id'];
// Obtener información básica del empleado (CORRECCIÓN AQUÍ)
$info_query = "SELECT numero_empleado, nombre, puesto, departamento_jud 
               FROM catalogo_personal WHERE id = ?";
$info_stmt = mysqli_prepare($conn, $info_query);
mysqli_stmt_bind_param($info_stmt, 'i', $personal_id);
mysqli_stmt_execute($info_stmt);
$info_result = mysqli_stmt_get_result($info_stmt); // Obtener el resultado
$empleado = mysqli_fetch_assoc($info_result); // Usar $info_result en lugar de $info_stmt

// Obtener historial completo
$historial_query = "SELECT hd.departamento_anterior, hd.departamento_nuevo, 
                   hd.fecha_cambio, u.username as responsable
                   FROM historial_departamentos hd
                   JOIN usuarios u ON hd.usuario_id = u.id
                   WHERE hd.personal_id = ?
                   ORDER BY hd.fecha_cambio DESC";
$historial_stmt = mysqli_prepare($conn, $historial_query);
mysqli_stmt_bind_param($historial_stmt, 'i', $personal_id);
mysqli_stmt_execute($historial_stmt);
$historial_result = mysqli_stmt_get_result($historial_stmt);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de <?= htmlspecialchars($empleado['nombre']) ?></title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 8px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Historial de Departamentos</h1>
    <h2><?= htmlspecialchars($empleado['nombre']) ?> (<?= htmlspecialchars($empleado['numero_empleado']) ?>)</h2>
    <p>Puesto: <?= htmlspecialchars($empleado['puesto']) ?></p>
    <p>Departamento actual: <?= htmlspecialchars($empleado['departamento_jud']) ?></p>
    
    <table>
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Departamento Anterior</th>
                <th>Departamento Nuevo</th>
                <th>Responsable</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($movimiento = mysqli_fetch_assoc($historial_result)): ?>
            <tr>
                <td><?= htmlspecialchars($movimiento['fecha_cambio']) ?></td>
                <td><?= htmlspecialchars($movimiento['departamento_anterior']) ?: 'N/A' ?></td>
                <td><?= htmlspecialchars($movimiento['departamento_nuevo']) ?></td>
                <td><?= htmlspecialchars($movimiento['responsable']) ?></td>
            </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
    
    <a href="catalogo.php" class="btn">Volver al Catálogo</a>
</body>
</html>