<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.NumberFormat" %>
<%
	int count = (int) request.getAttribute("count");
	double balance = (double) request.getAttribute("balance");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="midtermStyleSheet.css" type="text/css" rel="stylesheet">
<title>Result</title>
</head>
<body>
	<h1>Final Results</h1>
	<h3>Final Balance: $<%= balance %></h3>
	<h3>Number of Rolls: <%= count %></h3>
	<a id="link" href="index.jsp">Play Again</a>
<footer>
  <p>Created by Ty Burns for MIST 4630</p>
</footer>
</body>
</html>