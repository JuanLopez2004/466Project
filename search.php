 <?php
  require 'pdo.php';
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
    <title>JBKD Home</title>
  </head>
  <body>
    <h1><a href="homepage.php">John's Basement Karaoke Diner</a></h1>
    <h3>Find a song to sing along to!</h3>
    <form method="post" action="search.php">
        <input type="text" name="search" placeholder="Search">
        <input type="radio" name="searchType" value="title" checked>Title
        <input type="radio" name="searchType" value="artist">Artist
        <input type="radio" name="searchType" value="producer">Producer
        <input type="radio" name="searchType" value="writer">Writer
        <input type="submit" value="Search">
    </form>
    <?php 
      if(isset($_POST['search'])) {
      $search = $_POST['search'];
      $searchType = $_POST['searchType'];

      $sql = "SELECT 
          Song.Title, 
          GROUP_CONCAT(DISTINCT Artist.Artist_Name SEPARATOR ', ') AS Artists, 
          GROUP_CONCAT(DISTINCT Producer.Prod_Name SEPARATOR ', ') AS Producers, 
          GROUP_CONCAT(DISTINCT Writer.Writer_Name SEPARATOR ', ') AS Writers
          FROM Song
          LEFT JOIN SongArtist ON Song.ID = SongArtist.SongID
          LEFT JOIN Artist ON SongArtist.ArtistID = Artist.ID
          LEFT JOIN SongProducer ON Song.ID = SongProducer.SongID
          LEFT JOIN Producer ON SongProducer.ProducerID = Producer.ID
          LEFT JOIN SongWriter ON Song.ID = SongWriter.SongID
          LEFT JOIN Writer ON SongWriter.WriterID = Writer.ID
          WHERE ";

      if ($searchType === 'title') {
          $sql .= "Song.Title LIKE '%$search%'";
      } elseif ($searchType === 'artist') {
          $sql .= "Artist.Artist_Name LIKE '%$search%'";
      } elseif ($searchType === 'producer') {
          $sql .= "Producer.Prod_Name LIKE '%$search%'";
      } elseif ($searchType === 'writer') {
          $sql .= "Writer.Writer_Name LIKE '%$search%'";
      }

      $sql .= " GROUP BY Song.Title";
      $stmt = $pdo->query($sql);
      echo "<table border='1'>";
      echo "<tr>
              <th>Title</th>
              <th>Artists</th>
              <th>Producers</th>
              <th>Writers</th>
            </tr>";

      while($row = $stmt->fetch()) {
        echo "<tr>
                <td>".$row['Title']."</td>
                <td>".$row['Artists']."</td>
                <td>".$row['Producers']."</td>
                <td>".$row['Writers']."</td>
              </tr>";
      }
      echo "</table>";
    }
    ?>
  </body>
</html>
