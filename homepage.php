<!DOCTYPE html>
<html>
  <head>
    <style>
        div { width: 300px; margin: auto; }
        .form-group { display: flex; }
        .form-group label { margin-right: 10px; }
        body { text-align: center; }
        th, td { border: 1px solid black; padding: 8px; }
        th a { text-decoration: none; color: black; }
        h1, h3 {text-align: center;}
        a{text-decoration: none; color: black;}
        a:not(td a):hover {color: #7a7a7a;}
    </style>
    <title>JBKD</title>
    <h1><a href="homepage.php">John's Basement Karaoke Diner</a></h1>

    <h3>Find a song to sing along to!</h3>
  </head>
  <body>
    <form method="post" action="search.php">
        <input type="text" name="search" placeholder="Search">
        <input type="radio" name="searchType" value="title" checked>Title
        <input type="radio" name="searchType" value="artist">Artist
        <input type="radio" name="searchType" value="producer">Producer
        <input type="radio" name="searchType" value="writer">Writer
        <input type="submit" value="Search">
    </form>
  </body>
  <footer>
  <h3><a href="dj.php">DJ Interface</a></h3>
  <img src="https://i.imgur.com/N2y9XgQ.png" width="300">

  <p>
  <audio controls autoplay>
  <source src="winans.ogg" type="audio/ogg">
  </audio>
  <p>

</footer>
</html>