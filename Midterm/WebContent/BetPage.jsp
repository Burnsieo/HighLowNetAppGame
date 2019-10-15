<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.NumberFormat" %>
<%
	NumberFormat f = NumberFormat.getNumberInstance();
	f.setMaximumFractionDigits(2);
	double balance = Double.parseDouble(request.getParameter("balance"));
	f.format(balance);
	String count = request.getParameter("count");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="midtermStyleSheet.css" type="text/css" rel="stylesheet">
<title>Place a Bet</title>
</head>
<body>
<h1>Place a Bet</h1>
<h3>Current Balance: $<%= balance %></h3>
<form name="bet" action="doCalculate" method="doPost">
	<table border="1">
	<tr><td width="50%" height="50px">Bet Amount: <input type="text" name="betAmount" Value=""></td></tr>
	<tr><td height="40px">Low (Sum 2-6) Payout of 1:1<input type="radio" name="bet" value="Low"></td></tr>
	<tr><td height="40px">Seven (Sum 7) Payout of 4:1<input type="radio" name="bet" value="Seven"></td></tr>
	<tr><td height="40px">High (Sum 8-12) Payout of 1:1<input type="radio" name="bet" value="High"></td></tr>
	<input type="hidden" name="balance" value="<%= balance %>">
	<input type="hidden" name="count" value="<%= count %>">
	<tr><td height="40px"><input type="submit" name="submit" value="Place Bet"></td></tr>
	</table>
</form>
<form name="quit" action="doQuit" method="doPost">
	<input type="hidden" name="balance" value="<%= balance %>">
	<input type="hidden" name="count" value="<%= count %>">
	<input type="submit" name="submit" value="Quit">
</form>
<footer>
  <p>Created by Ty Burns for MIST 4630</p>
</footer>
</body>
</html>