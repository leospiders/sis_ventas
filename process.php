<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sis_ventas";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
$fecha = $_POST['fecha'];
$cod = $_POST['cod'];
$empresa = $_POST['empresa'];
$valor = $_POST['valor'];
$cantidad = $_POST['cantidad'];

$sql = "INSERT INTO ventas (fecha, cod, idprod, valor, cantidad) VALUES ('$fecha', '$cod', (SELECT idprod FROM productos WHERE empresa = '$empresa'), '$valor', '$cantidad')";

if ($conn->query($sql) === TRUE) {
    echo "<script>alert('Registro exitoso'); window.location.href='index.php';</script>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
