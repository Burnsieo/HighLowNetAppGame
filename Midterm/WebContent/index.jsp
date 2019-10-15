<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="midtermStyleSheet.css" type="text/css" rel="stylesheet">
<title>High Low Game</title>
</head>
<body>
<h1>Welcome to the High-Low Game</h1>
<h3>You start with a stake of $1,000.00</h3>
<div id="images">
	<img class="die" src="images/Dice-4.png" alt="Die with 4 showing">
	<img class="die" src="images/Dice-4.png" alt="Die with 4 showing">
</div>
<form name="playButton" action="BetPage.jsp">
	<input type="hidden" name="balance" value="1000.00">
	<input type="hidden" name="count" value="0">
	<input type="submit" name="submit" value="Play">
</form>

<footer>
  <p>Created by Ty Burns for MIST 4630</p>
</footer>
</body>
</html>