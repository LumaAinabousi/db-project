<?php
    $SSN = $_POST['empSSN'];

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "project";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT e.SSN, CONCAT(fname,' ', mname,' ', lname) AS name, name AS department_name, location_
            FROM employees e
            INNER JOIN works_in w ON e.SSN = w.SSN
            INNER JOIN department d ON w.department_name = d.name
            WHERE e.SSN = '$SSN'";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        echo "<h1>Employee details</h1>";
        echo "<table border='2'>";
        echo "<tr>
                 <th>SSN</th>
                 <th>Name</th>
                 <th>Department Name</th>
                 <th>Department Location</th>
             </tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row["SSN"] . "</td>";
            echo "<td>" . $row["name"] . "</td>";
            echo "<td>" . $row["department_name"] . "</td>";
            echo "<td>" . $row["location_"] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "There is no employee found.";
    }

    $conn->close();

?>
