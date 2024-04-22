<?php
$host = 'courses';
$dbname = 'z1933585';
$username = 'z1933585';
$password = '2002Dec27';

try{
  $dsn = "mysql:host=$host;dbname=$dbname";
  $pdo = new PDO($dsn, $username, $password);

  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMOD_EXCEPTION);
} catch(PDOException $e){
  echo "Connection to database failed: " .$e->getMessage();
}
?>

<!DOCTYPE html>
<html>
  <style>
    div{
    width: 300px;
    margin: auto;
  }
  .form-group{
    display: flex;
  }
  .form-group label{
    margin-right: 10px;
  }
  body{
    text-align: center;
  }
  </style>
  <head>
    <title>Song Name here</title>
  </head>
  <body>
    <h1><a href="homepage.php">Song Info</a></h1>
    <h3>Choose a song version to add to the queue</h3>
  </body>
</html>
