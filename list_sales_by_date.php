<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sis_ventas";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$startDate = isset($_GET['startDate']) ? $_GET['startDate'] : null;
$endDate = isset($_GET['endDate']) ? $_GET['endDate'] : null;

$sql = "SELECT ventas.*, productos.empresa 
        FROM ventas 
        INNER JOIN productos ON ventas.idprod = productos.idprod 
        WHERE fecha BETWEEN '$startDate' AND '$endDate'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h2>Ventas Registradas entre $startDate y $endDate</h2>";
    echo "<table border='1'><tr><th>ID</th><th>Fecha</th><th>Usuario</th><th>Empresa</th><th>Valor</th><th>Cantidad</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["IDcorrelativo"]. "</td><td>" . $row["fecha"]. "</td><td>" . $row["cod"]. "</td><td>" . $row["empresa"]. "</td><td>" . $row["valor"]. "</td><td>" . $row["cantidad"]. "</td></tr>";
    }
    echo "</table>";
} else {
    echo "No se encontraron ventas entre $startDate y $endDate.";
}

$conn->close();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    
</body>
</html>