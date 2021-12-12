<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@page import="java.sql.*" %>
<%@page import="Project1.*" %>
<%try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM `customers` WHERE `Customer_ID`='"+request.getParameter("id")+"'"); 
	if(rs.next())
	%>
<body>
<center><div>
<h1>Client Details</h1><br><hr><hr><br>
<h3>Customer ID : <%=rs.getString(6) %></h3><br>
<h3>Name : <%=rs.getString(1) %></h3><br>
<h3>Contact No. : <%=rs.getString(2) %></h3><br>
<h3>Email ID : <%=rs.getString(3) %></h3><br>
<h3>Current Balance : <%=rs.getString(4)%></h3><br><br>
<form action="Select_Receiver.jsp">
<input type="hidden" name="S_ID" value="<%=rs.getString(6) %>">
<button type="submit"><h2>Transfer Money</h2></button>
</form><hr><hr>
</div></center>
</body>
<%}catch(Exception e){
	%><h1><%=e %></h1><script>alert("Error Found");</script><% 
} %>
</html>