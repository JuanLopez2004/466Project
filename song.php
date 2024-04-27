<?php
require 'pdo.php';

if(!isset($_GET['id']) || empty($_GET['id'])){
  header('Location: error.html');
  exit();
}

$songId = intval($_GET['id']);

$sql = "SELECT Song.ID, Song.Title, 
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
        WHERE Song.ID = ?
        GROUP BY Song.Title";

$stmt = $pdo->prepare($sql);
$stmt->execute([$songId]);
$song = $stmt->fetch();

if(!$song){
  echo "Song not found.";
  exit;
}
?>

<!DOCTYPE html>
<html>
  <head>
    <title>JBKD</title>
    <style>
      body {text-align: center;}
      table { text-align: left; margin: auto; border-collapse: collapse; }
      th, td { border: 0px solid black; padding: 8px; }
      th a { text-decoration: none; color: black; }
      h1, h3 {text-align: center;}
      a{text-decoration: none; color: black;}
      td a{display: block;}
      a{text-decoration: none; color: black;}
      tr:not(:first-child):hover{background-color:whitesmoke;}
      a:not(td a):hover {color: #7a7a7a;}
    </style>
    <h1><a href="homepage.php">John's Basement Karaoke Diner</a></h1>
    <h3>Find a song to sing along to!</h3>
  </head>
  <body>
  <table>
        <tr>
            <th>Title</th>
            <th>Artists</th>
            <th>Producers</th>
            <th>Writers</th>
        </tr>
        <tr>
            <td><?= htmlspecialchars($song['Title']) ?></td>
            <td><?= htmlspecialchars($song['Artists']) ?></td>
            <td><?= htmlspecialchars($song['Producers']) ?></td>
            <td><?= htmlspecialchars($song['Writers']) ?></td>
        </tr>
    </table>
    <h3><a href="homepage.php">Return to homepage</a></h3>
  </body>
</html>
