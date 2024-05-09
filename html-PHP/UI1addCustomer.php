<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$customerId = $_POST['customerId'];
$email = $_POST['email'];
$phoneNumber = $_POST['phoneNumber'];
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$middleName = $_POST['middleName'];

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "project";

$conn = new mysqli($servername,$username,$password,$dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql= "INSERT INTO customers(CustomerID,email,phone,first_name,last_name,middle_name) 
       VALUES ('$customerId','$email','$phoneNumber','$firstName','$lastName','$middleName')";
if($conn->query($sql) == TRUE){
    echo "Customer record inserted successfully!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>

