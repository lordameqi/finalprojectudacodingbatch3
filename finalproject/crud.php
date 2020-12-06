<?php
$servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "finalprojekudacoding";
    $table = "catatn"; // lets create a table named Employees.
 
    // we will get actions from the app to do operations in the database...
    $action = $_POST["action"];
     
    // Create Connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }
 
    // If connection is OK...
 
    // If the app sends an action to create the table...
   
 
    // Get all employee records from the database
    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT id_catatan, catatan from $table ORDER BY id_catatan DESC";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
    // Add an Employee
    if("ADD_EMP" == $action){
        // App will be posting these values to this server
        $first_name = $_POST["catatan"];
       // $last_name = $_POST["last_name"];
        $sql = "INSERT INTO $table (catatan) VALUES ('$first_name')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }
 
    // Remember - this is the server file.
    // I am updating the server file.
    // Update an Employee
    if("UPDATE_EMP" == $action){
        // App will be posting these values to this server
        $emp_id = $_POST['emp_id'];
        $first_name = $_POST["catatan"];
       // $last_name = $_POST["last_name"];
        $sql = "UPDATE $table SET catatan = '$first_name' WHERE id = $emp_id";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
 
    // Delete an Employee
    if('DELETE_EMP' == $action){
        $emp_id = $_POST['emp_id'];
        $sql = "DELETE FROM $table WHERE id = $emp_id"; // don't need quotes since id is an integer.
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

?>