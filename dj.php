<!DOCTYPE html>
<?php

$host = 'courses';
$dbname = 'z1952885';
$username = 'z1952885';
$password = '2003Nov21';

try
{
    // Connect to the database
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
    $pdo = new PDO($dsn, $username, $password);

    // Set PDO to throw exceptions
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch Priority Queue table info
    $stmt = $pdo->query("SELECT * FROM PriorityQueue");
    $PriorityQueue = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetching the FIFOQueue table info
    $stmt = $pdo->query("SELECT * FROM FIFOQueue");
    $FIFOQueue = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

?>

<html>
<style>
  body{
    text-align: center;
  }
</style>

<head>
  <title>DJ Interface</title>
</head>

<body>
  <h1>DJ Interface</h1>
</body>

</html>
