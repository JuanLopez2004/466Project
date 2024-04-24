<?php
$host = 'courses';
$dbname = 'z1933585';
$username = 'z1933585';
$password = '2002Dec27';

try{
  $dsn = "mysql:host=$host;dbname=$dbname";
  $pdo = new PDO($dsn, $username, $password);

  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch(PDOException $e){
  echo "Connection to database failed: " .$e->getMessage();
}
?>

