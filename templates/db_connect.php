<?php

    $conn = mysqli_connect('localhost','root','','snackit');
    if(!$conn) {
        echo 'Connection error: ' . mysqli_connect_error();
    }

 ?>
