<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$dname = $_POST['depName'];
$loc = $_POST['location'];
$edate = $_POST['edate'];
$mSSN = $_POST['mSSN'];

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "project";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//check if department name already exists
$sqlCheck = "SELECT * FROM department WHERE name = '$dname'";
$resultCheck = $conn->query($sqlCheck);

if ($resultCheck->num_rows > 0) {
    echo "The department name already exists.";
} else {
    //check if manager SSN exists
    $sqlManager = "SELECT * FROM employees WHERE SSN = '$mSSN'";
    $resultManager = $conn->query($sqlManager);

    if ($resultManager->num_rows > 0) {
        $sqlInsert = "INSERT INTO department (name, location_, estdate, SSN) 
                      VALUES ('$dname', '$loc', '$edate', '$mSSN')";

        if ($conn->query($sqlInsert) === TRUE) {
            echo "Department record inserted successfully!";
        } else {
            echo "Error: " . $sqlInsert . "<br>" . $conn->error;
        }
    } else {
        echo "The manager SSN is not found.";
    }
}

$conn->close();
?>
