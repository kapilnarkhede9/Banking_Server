<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><h1>Select Receiver</h1></center>
<center><table cellpadding="5" cellspacing="5" border="5">
<thead>
<tr>
<th>Customer ID</th>
<th>Customer Name</th>
<th>Customer Email</th>
<th>Current Balance</th>
<th>Select</th></tr>
</thead>
<tbody>
<%@page import="java.sql.*" %>
<%@page import="Project1.*" %>
<%
try{
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM `customers` WHERE NOT `Customer_ID`='"+request.getParameter("S_ID")+"'");
while(rs.next()){
%>
<tr>
<form action="Transfer.jsp" method="post">
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<input type="hidden" value="<%=request.getParameter("S_ID")%>" name="s_id">
<input type="hidden" value="<%=rs.getString(6)%>" name="r_id">
<td><button type="submit">Select</button></td>
</tr></form><%} 
}catch(Exception e){
	%><h1><%=e %></h1><script>alert("Error Found");</script><% 
}
%>
</tbody>
</table></center>
</body>
</html>