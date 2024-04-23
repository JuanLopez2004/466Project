<!DOCTYPE html>
<html>
<style>
body {
    text-align: center;
}
</style>
<?php
    $host ='courses';
    $dbname ='z1952526';
    $username ='z1952526';
    $password ='2004Mar09';
    try 
    {
        $dsn = "mysql:host=courses;dbname=z1952526";
        $pdo = new PDO($dsn, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

          $sql = "SELECT FI_Fname, FI_Lname, FileName FROM FIUser JOIN FIFOQueue ON FIUser.FIUser = FIFOQueue.FIID 
          JOIN KaraokeFile ON FIFOQueue.FileID = KaraokeFile.FileID WHERE FIUser.FIUser = 1";

          $stmt = $pdo->query($sql);
          if ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
              $first_name = $row['FI_FName'];
              $last_name = $row['FI_LName'];
              $song_name = $row['FileName']; 
              echo "<h1>Thank You for Choosing " . htmlspecialchars($song_name) . " to Sing Along to, " . htmlspecialchars($first_name) . " " . htmlspecialchars($last_name) . "!</h1>";
              echo "<h1> Your song has been added to the priority queue.</h1>";
              echo "<h1> You will now be redirected to the homepage.</h1>";
          } 
          else 
          {
            echo "<h1>No results found</h1>";
          }
    }
    catch(PDOexception $e) 
    { 
        echo "Connection to database failed: " . $e->getMessage();
    }

?>
 <img src="https://cdn.discordapp.com/attachments/1227725842101305356/1232116715597598750/Picsart_24-04-22_18-51-51-585.jpg?ex=6628499c&is=6626f81c&hm=e6af88218da2592f838731f984e71df03dc5787a22de4082e56da60b8976cacd&" width="600">

</html>