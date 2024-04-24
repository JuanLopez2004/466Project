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

    // Fetch FIUser and FIFOQueue table info
    $stmt = $pdo->query("SELECT FIUser.*, FIFOQueue.FileID, FIFOQueue.Time 
                         FROM FIUser 
                         JOIN FIFOQueue ON FIUser.FIUser = FIFOQueue.FIID");
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch PQUser and Priority Queue table info
    $stmt = $pdo->query("SELECT PQUser.*, PriorityQueue.FileID, PriorityQueue.Time 
                         FROM PQUser 
                         JOIN PriorityQueue ON PQUser.PQUser = PriorityQueue.PQID");
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

?>

<html>
<style>
    color: white;
        table
        {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td
        {
            margin-left: auto;
            margin-right: auto;
            border: 2px solid white;
            padding: 5px;
            text-align: center;
        }

        th
        {
            background-color: #000000;
            color: white;
        }

        td
        {
            background-color: #FF0000;
        }
  body{
    text-align: center;
  }
</style>

<head>
  <title>DJ Interface</title>
</head>

<body>
  <h1>DJ Interface</h1>

  <section>
  <h2 style="color: black;">Priority Queue</h2>
        <table>
            <tr>
                <th>Queue</th>
                <th>User First Name</th>
                <th>User Last Name</th>
                <th>Pledge</th>
                <th>KaraokeID</th>
            </tr>
            <?php foreach ($results as $results) : ?>
                <tr>
                    <td><?php echo $results['PQUser']; ?></td>
                    <td><?php echo $results['PQ_FName']; ?></td>
                    <td><?php echo $results['PQ_LName']; ?></td>
                    <td><?php echo $results['Pledge']; ?></td>
                    <td><?php echo $results['FileID']; ?></td>
                </tr>
            <?php endforeach; ?>
        </table>

        <h2 style="color: black;">Priority Queue</h2>
        <table>
            <tr>
                <th>Queue</th>
                <th>User First Name</th>
                <th>User Last Name</th>
                <th>KaraokeID</th>
            </tr>
            <?php foreach ($result as $result) : ?>
                <tr>
                    <td><?php echo $result['FIUser']; ?></td> 
                    <td><?php echo $result['FI_FName']; ?></td>
                    <td><?php echo $result['FI_LNAME']; ?></td>
                    <td><?php echo $result['FileID']; ?></td>
                </tr>
            <?php endforeach; ?>
        </table>

  </section>

  <?php
    
  ?>


</body>

</html>
