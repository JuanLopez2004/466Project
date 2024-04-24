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

    <h1>
    <img src="https://cdn.discordapp.com/attachments/1227725842101305356/1230252532463304705/winansanime1.png?ex=662a1334&is=6628c1b4&hm=587144293d6ae985bf63439bdb44d43cb7e6e3ad3014c9c26951fe32387686dd&">
  </h1>
    <h1>
    <audio controls autoplay>
    <source src="winans.ogg" type="audio/ogg">
    </audio>
  </h1>

  </body>
</html>
