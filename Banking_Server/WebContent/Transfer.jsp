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
	ResultSet rs = st.executeQuery("SELECT * FROM `customers` WHERE `Customer_ID`='"+request.getParameter("s_id")+"'"); 
	if(rs.next()){
	%>
<body>
<div><br>
<h1>Sender Details</h1><br><hr><br>
<h3>Customer ID : <%=rs.getString(6) %></h3><br>
<h3>Name : <%=rs.getString(1) %></h3><br>
<h3>Contact No. : <%=rs.getString(2) %></h3><br>
<h3>Email ID : <%=rs.getString(3) %></h3><br>
<h3>Current Balance : <%=rs.getString(4)%></h3><br>
</div><hr><hr>
<%	}
	rs = st.executeQuery("SELECT * FROM `customers` WHERE `Customer_ID`='"+request.getParameter("r_id")+"'"); 
	if(rs.next()){
	%>
<div><br>
<h1>Receiver Details</h1><br><hr><br>
<h3>Customer ID : <%=rs.getString(6) %></h3><br>
<h3>Name : <%=rs.getString(1) %></h3><br>
<h3>Contact No. : <%=rs.getString(2) %></h3><br>
<h3>Email ID : <%=rs.getString(3) %></h3><br>
<h3>Current Balance : <%=rs.getString(4)%></h3><br>
</div><hr><hr>
<center><div>
<form action="Transiction.jsp" method="post">
<input type="hidden" value="<%=request.getParameter("s_id")%>" name="s_id">
<input type="hidden" value="<%=request.getParameter("r_id")%>" name="r_id">
<input type="number" placeholder="Amount" name="amount" required> <br><br>
<input type="text" placeholder="Transaction pin" name="tpin" required><br><br>
<button type="submit"><h2>Transfer</h2></button> 
</form>
</div></center>

</body>
<%}}catch(Exception e){
	%><h1><%=e %></h1><script>alert("Error Found");</script><% 
} %>
</html>