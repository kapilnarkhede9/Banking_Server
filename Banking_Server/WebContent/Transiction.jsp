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
	String s_id = request.getParameter("s_id");
	String r_id = request.getParameter("r_id");
	int amount = Integer.parseInt(request.getParameter("amount"));
	String tpin = request.getParameter("tpin");
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM `customers` WHERE `Customer_ID`='"+s_id+"'"); 
	ResultSet rs1 = st1.executeQuery("SELECT * FROM `customers` WHERE `Customer_ID`='"+r_id+"'"); 
	if(rs.next()){
		if(!tpin.equals(rs.getString(5).toString())){
			response.sendRedirect("Transfer.jsp?s_id="+s_id+"&r_id="+r_id);
		}
		st2.executeUpdate("INSERT INTO `transiction`(`Transiction_Amount`, `Sender_ID`, `Receiver_ID`) VALUES ("+amount+",'"+s_id+"','"+r_id+"')");
		ResultSet rs2 = st3.executeQuery("SELECT `Transiction_ID`, `Time` FROM `transiction` WHERE 1 ORDER BY `Time` DESC"); 
		if(rs1.next() && rs2.next()){
	int sb=rs.getInt(4)-amount;
	int rb=rs1.getInt(4)+amount;
	st2.execute("UPDATE `customers` SET `Current_Balence`="+sb+" WHERE `Customer_ID`='"+s_id+"'");
	st2.execute("UPDATE `customers` SET `Current_Balence`="+rb+" WHERE `Customer_ID`='"+r_id+"'");
	%>
<body>
<center><div>
<h1>Transiction Details</h1><hr>
<h3>Sender Name :<%=rs.getString(1) %></h3>
<h3>Receiver Name : <%=rs1.getString(1) %></h3>
<h3>Transaction Amount : <%=amount %></h3>
<h3>Transiction ID : <%=rs2.getString(1) %> </h3>
<h3>Date and Time : <%=rs2.getString(2) %></h3><hr><hr>
<h2>Transaction Sucessful.</h2>
<button><a href="index.jsp">Go To Home</a></button>
<hr><hr>
</div></center>
</body><%}}}catch(Exception e){
	%><h1><%=e %></h1><script>alert("Error Found");</script><% 
} %>
</html>