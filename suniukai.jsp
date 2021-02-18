<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Jorkšyro terjero šuniukai</title>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>

<style>
	
	th {

		background-color: none;
	}
</style>

</head>

<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<h2 align="center">Jorkšyro terjero šuniukai</h2>
<table width="400" cellspacing="5" cellpadding="5" border="1">
	<tr>
	</tr>
	<tr>
		<th>id</th>
		<th>Lytis</th>
		<th>Gimimo data</th>
		<th>Tevas</th>
		<th>Mama</th>
		<th>Defektai</th>
		<th>Paskirtis</th>
		<th>Kaina</th>
		
	</tr>
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "jorksyro_terjerai";
	String userId = "root";
	String password = "";
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
		try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");	
		
		connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		
		String sql = "";
		
		statement=connection.createStatement();	
		
		sql = "SELECT * FROM `suniukai`WHERE 1";
			
		
		resultSet = statement.executeQuery(sql);
		 
		while( resultSet.next() ){
%>
<tr style="background-color: none">
	<td><%= resultSet.getString ( "id" ) %></td>
	<td><%=resultSet.getString ( "Lytis" ) %></td>
	<td><%=resultSet.getString ("Gimimo_data" ) %></td>
	<td><%=resultSet.getString ("Tevas" ) %></td>
	<td><%=resultSet.getString ("Mama" ) %></td>
	<td><%=resultSet.getString ("Defektai" ) %></td>
	<td><%=resultSet.getString ("Paskirtis" ) %></td>
	<td><%=resultSet.getString ("Kaina" ) %></td>
</tr>

<% 
		}
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</table>

</body>
</html>