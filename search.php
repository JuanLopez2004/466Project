<?php
//saves search info
session_start();
require 'pdo.php';

$search = $searchType = '';
$sortField = $_GET['sort'] ?? 'Title'; 
$sortOrder = $_GET['order'] ?? 'ASC'; 

//wizard stuff
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['search'], $_POST['searchType'])) {
    $_SESSION['search'] = $search = $_POST['search'];
    $_SESSION['searchType'] = $searchType = $_POST['searchType'];
} elseif (isset($_SESSION['search'], $_SESSION['searchType'])) {
    $search = $_SESSION['search'];
    $searchType = $_SESSION['searchType'];
}

$queryBase = '';
$params = [];
if (!empty($search)) {
    $likeSearch = "%$search%";
    switch ($searchType) {
        case 'title':
            $queryBase = "WHERE Song.Title LIKE ?";
            break;
        case 'artist':
            $queryBase = "WHERE Artist.Artist_Name LIKE ?";
            break;
        case 'producer':
            $queryBase = "WHERE Producer.Prod_Name LIKE ?";
            break;
        case 'writer':
            $queryBase = "WHERE Writer.Writer_Name LIKE ?";
            break;
    }
    $params = [$likeSearch];
}

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
        $queryBase
        GROUP BY Song.Title
        ORDER BY $sortField $sortOrder";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$results = $stmt->fetchAll();

//had to make two functions for the sorting and the indicator
function buildSortLink($field, $currentField, $currentOrder) {
    $newOrder = ($currentField == $field && $currentOrder == 'ASC') ? 'DESC' : 'ASC';
    return $_SERVER['PHP_SELF'] . "?sort=$field&order=$newOrder";
}

function sortIndicator($field, $currentField, $currentOrder) {
    if ($field == $currentField) {
        return $currentOrder == 'ASC' ? '↑' : '↓';
    }
    return '';
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>JBKD</title>
    <style>
        .form-group { display: flex; }
        .form-group label { margin-right: 10px; }
        body { text-align: center; }
        table { text-align: left; margin: auto; border-collapse: collapse; }
        h1, h3 {text-align: center;}
        th, td { border: 0px solid black; padding: 8px; }
        th a { text-decoration: none; color: black; }
        td a{display: block;}
        a{text-decoration: none; color: black;}
        tr:not(:first-child):hover{background-color:whitesmoke;}
        a:not(td a):hover {color: #7a7a7a;}
    </style>
    <h1><a href="homepage.php">John's Basement Karaoke Diner</a></h1>
    <h3>Find a song to sing along to!</h3>
</head>
<body>
    <form method="post" action="">
        <input type="text" name="search" placeholder="Search" value="<?= htmlspecialchars($search) ?>">
        <input type="radio" name="searchType" value="title" <?= $searchType === 'title' ? 'checked' : '' ?>>Title
        <input type="radio" name="searchType" value="artist" <?= $searchType === 'artist' ? 'checked' : '' ?>>Artist
        <input type="radio" name="searchType" value="producer" <?= $searchType === 'producer' ? 'checked' : '' ?>>Producer
        <input type="radio" name="searchType" value="writer" <?= $searchType === 'writer' ? 'checked' : '' ?>>Writer
        <input type="submit" value="Search">
    </form><br>

    <?php if (!empty($results)): ?>
        <table>
            <tr>
                <th><a href="<?= buildSortLink('Title', $sortField, $sortOrder) ?>">Title</a> <?= sortIndicator('Title', $sortField, $sortOrder) ?></th>
                <th><a href="<?= buildSortLink('Artists', $sortField, $sortOrder) ?>">Artists</a> <?= sortIndicator('Artists', $sortField, $sortOrder) ?></th>
                <th><a href="<?= buildSortLink('Producers', $sortField, $sortOrder) ?>">Producers</a> <?= sortIndicator('Producers', $sortField, $sortOrder) ?></th>
                <th><a href="<?= buildSortLink('Writers', $sortField, $sortOrder) ?>">Writers</a> <?= sortIndicator('Writers', $sortField, $sortOrder) ?></th>
            </tr>
            <?php foreach ($results as $row): ?>
                <tr>
                    <td><a href="song.php?id=<?= $row['ID'] ?>"><?= htmlspecialchars($row['Title']) ?></a></td>
                    <td><a href="song.php?id=<?= $row['ID'] ?>"><?= htmlspecialchars($row['Artists']) ?></a></td>
                    <td><a href="song.php?id=<?= $row['ID'] ?>"><?= htmlspecialchars($row['Producers']) ?></a></td>
                    <td><a href="song.php?id=<?= $row['ID'] ?>"><?= htmlspecialchars($row['Writers']) ?></a></td>
                </tr>
            <?php endforeach; ?>
        </table>
    <?php endif; ?>
</body>
<footer>
  <h3><a href="dj.php">DJ Interface</a></h3>
</footer>
</html>