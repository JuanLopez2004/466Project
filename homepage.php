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
  </body>
</html>
