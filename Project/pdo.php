<?php
    $host ='courses';
    $dbname ='z1952526';
    $username ='z1952526';
    $password ='2004Mar09';
    try{
    $dsn = "mysql:host=$host;dbname=$dbname";
    $pdo = new PDO($dsn, $username, $password);

    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    } catch(PDOException $e){
    echo "Connection to database failed: " .$e->getMessage();
    }
?>