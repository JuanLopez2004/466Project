<!DOCTYPE html>
<?php
    require 'pdo.php';

    // Fetch FIUser and FIFOQueue table info
    $stmt = $pdo->query("SELECT FIUser.*, FIFOQueue.FileID, FIFOQueue.Time 
                         FROM FIUser 
                         JOIN FIFOQueue ON FIUser.FIUser = FIFOQueue.FIID");
    $FIFOresult = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch PQUser and Priority Queue table info
    $stmt = $pdo->query("SELECT PQUser.*, PriorityQueue.FileID, PriorityQueue.Time 
                         FROM PQUser 
                         JOIN PriorityQueue ON PQUser.PQUser = PriorityQueue.PQID");
    $PQresults = $stmt->fetchAll(PDO::FETCH_ASSOC);
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

<body style="background-color:rgb(25, 25, 25);">
  <h1 style="color: white;">DJ Interface</h1>

  <section>
  <h2 style="color: white;">Priority Queue</h2>
        <table>
            <tr>
                <th>Queue</th>
                <th>User First Name</th>
                <th>User Last Name</th>
                <th>Pledge</th>
                <th>KaraokeID</th>
            </tr>
            <?php foreach ($PQresults as $PQresults) : ?>
                <tr>
                    <td><?php echo $PQresults['PQUser']; ?></td>
                    <td><?php echo $PQresults['PQ_FName']; ?></td>
                    <td><?php echo $PQresults['PQ_LName']; ?></td>
                    <td><?php echo $PQresults['Pledge']; ?></td>
                    <td><?php echo $PQresults['FileID']; ?></td>
                </tr>
            <?php endforeach; ?>
        </table>

        <h2 style="color: white;">FIFO Queue</h2>
        <table>
            <tr>
                <th>Queue</th>
                <th>User First Name</th>
                <th>User Last Name</th>
                <th>KaraokeID</th>
            </tr>
            <?php foreach ($FIFOresult as $FIFOresult) : ?>
                <tr>
                    <td><?php echo $FIFOresult['FIUser']; ?></td> 
                    <td><?php echo $FIFOresult['FI_FName']; ?></td>
                    <td><?php echo $FIFOresult['FI_LNAME']; ?></td>
                    <td><?php echo $FIFOresult['FileID']; ?></td>
                </tr>
            <?php endforeach; ?>
        </table>

  </section>

  <?php
    
  ?>


</body>

</html>
