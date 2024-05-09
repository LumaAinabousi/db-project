<?php
$hallNumber = $_POST['hallNumber'];

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "project";

$conn = new mysqli($servername,$username,$password,$dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql= "SELECT * FROM eventdetails
       WHERE hallNo='$hallNumber'";
$result = $conn->query($sql);

if($result->num_rows > 0){
    echo "<h1>Events held at ". $hallNumber ."</h1>";
    echo "<table border = 2>";
    echo "<tr>
             <th>Event ID</th>
             <th>Date of Event</th>
             <th>Customer ID</th>
         </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["EventID"] . "</td>";
        echo "<td>" . $row["dateOfEvent"] . "</td>";
        echo "<td>" . $row["CustomerID"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} 
else {
  echo "There is no events held at the hall.";
}

$conn->close();
?>

