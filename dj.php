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

    // Sort $PQresults by 'Pledge' in descending order, but maintain the order of PQUser
    usort($PQresults, function($a, $b)
    {
      if ($b['Pledge'] == $a['Pledge'])
      {
        // If pledges are equal, sort by PQUser in ascending order
        return $a['PQUser'] <=> $b['PQUser'];
      }
      // Otherwise, sort by Pledge in descending order
      return $b['Pledge'] <=> $a['Pledge'];
    });
?>

<html>
<style>
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
            font-weight: bold;
        }
  body{
    text-align: center;
  }

  .typewriter {
  display: inline-block;
}

  .typewriter h1
  {
    color: #fff;
    font-family: Times New Roman;
    overflow: hidden; /* Ensures the content is not revealed until the animation */
    border-right: .15em solid orange; /* The typewriter cursor */
    white-space: nowrap; /* Keeps the content on a single line */
    margin: 0 auto; /* Gives that scrolling effect as the typing happens */
    animation: typing 3.5s steps(30, end), blink-caret .5s step-end infinite;
  }

  /* The typing effect */
  @keyframes typing
  {
   from { width: 0 }
   to { width: 100% }
  }

  /* The typewriter cursor effect */
  @keyframes blink-caret 
  {
    from, to { border-color: transparent }
    50% { border-color: red }
  }

  .neonText {
  animation: flicker 1.5s infinite alternate;animation: flicker 1.5s infinite alternate;
  color: pink;
  font-family: Gabriola;
  font-size: 30px;
  }

  h1 {
    animation: pulsate 0.11s ease-in-out infinite alternate;     
}

  h2 {
  text-align: center;
}

@keyframes flicker {
    0%, 18%, 22%, 25%, 53%, 57%, 100% {

    text-shadow:
      0 0 7px red,
      0 0 10px red,
      0 0 21px red,
      0 0 42px red,
      0 0 82px red,
      0 0 92px red,
      0 0 102px red,
      0 0 151px red;
    }
    20%, 24%, 55% {        
      text-shadow: none;
  } 
}
.container {
  margin-top: 20vh;
}

</style>

<head>
  <title>DJ Interface</title>
</head>

<body style="background-color:rgb(25, 25, 25);">

    <div class="typewriter">
    <h1 style="color: white;">DJ Interface</h1>
    </div>

  <section>
  <h2 class="neonText">Priority Queue</h2>
        <table>
            <tr>
                <th>Queue</th>
                <th>User First Name</th>
                <th>User Last Name</th>
                <th>Pledge</th>
                <th>KaraokeID</th>
            </tr>
            <?php foreach ($PQresults as $index => $PQresult) : ?>
            <tr>
              <td><?php echo $index + 1; ?></td>
              <td><?php echo $PQresult['PQ_FName']; ?></td>
              <td><?php echo $PQresult['PQ_LName']; ?></td>
              <td><?php echo $PQresult['Pledge']; ?></td>
              <td><?php echo $PQresult['FileID']; ?></td>
            </tr>
            <?php endforeach; ?>
        </table>

        <h2 class="neonText">FIFO Queue</h2>
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

</body>
<footer>
  <h3><a href="homepage.php">Home</a></h3>
</footer>
</html>
