<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><center>
<table cellpadding="5" cellspacing="5" border="5">
<thead>
<tr>
<th>Transaction ID</th>
<th>Amount</th>
<th>Sender ID</th>
<th>Receiver ID</th>
<th>Time</th>
</tr>
</thead>
<tbody>
<%@page import="java.sql.*" %>
<%@page import="Project1.*" %>
<%
try{
Connection con = ConnectionProvider.getCon();
if(con==null)
	%><script>alert("Connection Error");</script><% 
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM `transiction` WHERE 1");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
</tr><%} 
}catch(Exception e){
	%><h1><%=e %></h1><script>alert("Error Found");</script><% 
}
%>
</tbody>
</table>
</center>
</body>
</html>