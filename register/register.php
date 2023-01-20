<?php
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $phone = $_POST['phone'];
    $city = $_POST['city'];
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];

    $conn = new mysqli('localhost','root','','dbms');
    if($conn->connect_error){
        die('connection failed :' . $conn->connect_error);
    }
    else{
        $stmt = $conn->prepare("insert into registerform(fname, lname, email, password, dob, gender, phone, city) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")
        $stmt->bind_param("ssssssis",$fname,$lname,$email,$password,$dob,$gender,$phone,$city);
        $stmt->execute();
        echo "successful";
        $stmt->close();
        $conn->close();
    }
?>
