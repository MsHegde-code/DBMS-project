<?php
    $server = "localhost";
    $username = "root";
    $password = "";

    $con = mysqli_connect($server, $username, $password);

    if(!$con){
        die("connect failed" . mysqli_connect_error());
    }

    echo "connection successful";
?>
