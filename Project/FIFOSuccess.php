<!DOCTYPE html>
<html>
<style>
body {
    text-align: center;
}
</style>
<meta http-equiv="refresh" content="5;url=homepage.php">
<?php
    require 'pdo.php';
          $sql = "SELECT FI_Fname, FI_Lname, FileName FROM FIUser JOIN FIFOQueue ON FIUser.FIUser = FIFOQueue.FIID 
          JOIN KaraokeFile ON FIFOQueue.FileID = KaraokeFile.FileID WHERE FIUser.FIUser = 1";

          $stmt = $pdo->query($sql);
          if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
              $first_name = $row['FI_FName'];
              $last_name = $row['FI_LName'];
              $song_name = $row['FileName']; 
              echo "<h1>Thank You for Choosing John's Basement! </h1<";
              echo "<h1> Your song has been added to the queue.</h1>";
              echo "<h1> You will now be redirected to the homepage.</h1>";
          } 
          else 
          {
            echo "<h1>No results found</h1>";
          }
?>
 <h1 id="countdown">Redirecting in 5 seconds...</h1>
 <img src="https://i.imgur.com/qe4Qnc9.jpeg" width="300">
 </html>

<script>
    var seconds = 5; 
    var countdown = document.getElementById('countdown');

    function updateCountdown() 
    {
        countdown.innerHTML = 'Redirecting in ' + seconds + ' seconds...';
        if (seconds <= 0) 
        {
            window.location.href = 'homepage.php';
        }
        else 
        {
            seconds--;
            setTimeout(updateCountdown, 1000);
        }
    }

    updateCountdown();
</script>

</body>
<footer>
  <h3><a href="homepage.php">Home</a></h3>
</footer>
</html>