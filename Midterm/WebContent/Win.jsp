<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.NumberFormat" %>
<%
	//String html = (String) request.getAttribute("html");
	NumberFormat f = NumberFormat.getNumberInstance();
	f.setMaximumFractionDigits(2);
	int count = (int) request.getAttribute("count");
	int die1Value = (int) request.getAttribute("die1Value");
	int die2Value = (int) request.getAttribute("die2Value");
	String die1Image = "<img src=images/Dice-" + die1Value + ".png>";
	String die2Image = "<img src=images/Dice-" + die2Value + ".png>";
	double balance = (double) request.getAttribute("balance");
	f.format(balance);
	double winAmount = (double) request.getAttribute("winAmount");
	f.format(winAmount);
	double betAmount = (double) request.getAttribute("betAmount");
	f.format(betAmount);
	String bet = (String) request.getAttribute("bet");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="midtermStyleSheet.css" type="text/css" rel="stylesheet">
<title>Win!</title>
</head>
<body>
<h1>You Won!</h1>
<h3>Current Balance: $<%= balance %></h3>
<h3>Current Bet Type: <%= bet %></h3>
<h3>Current Bet Amount: $<%= betAmount %></h3>
<h3>You won: $<%= winAmount %></h3>
<h3>This is roll number <%= count %></h3>
<h2>Your Roll</h2>
<p><%= die1Image %><%= die2Image %></p>

<form name="playAgain" action="BetPage.jsp">
	<input type="hidden" name="balance" value="<%= balance %>">
	<input type="hidden" name="count" value="<%= count %>">
	<input type="submit" name="submit" value="Place another bet">
</form>
<form name="quit" action="doQuit" method="doPost">
	<input type="hidden" name="balance" value="<%= balance %>">
	<input type="hidden" name="count" value="<%= count %>">
	<input type="submit" name="quit" value="Quit">
</form>
<footer>
  <p>Created by Ty Burns for MIST 4630</p>
</footer>
</body>
</html>