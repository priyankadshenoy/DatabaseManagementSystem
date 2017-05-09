<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 10px;
    text-align: center;
	
}
</style>
</head>
<body>
<div id="background">
<img src="photo.jpg" class="stretch" alt="" />
</div>
<div id="left"></div>
<div id="right"></div>
<div id="top"></div>
<div id="bottom"></div>

<%
String n= session.getAttribute( "userid" ).toString();
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
Statement st = conn.createStatement();
ResultSet rs;
rs = st.executeQuery
("select * from driver_shift_details where mon='" + n + "' or tue='" + n + "' or wed='" + n + "' or thur='" + n + "' or fri='" + n + "' or sat='" + n + "' or sun='" + n + "'");
if(rs.next())
	response.sendRedirect("driver_weekly_schedule_created.jsp");
else
%>
<br><br><br><br><br>
<center>
<form name="driveravailability" action="driver_availability_success.jsp" method="POST">
<table>
<tr>
<th colspan="8">Please select slots as per availability</th>
<tr>
<th>Sunday</th>
<th>Monday</th>
<th>Tuesday</th>
<th>Wednesday</th>
<th>Thursday</th>
<th>Friday</th>
<th>Saturday</th>
</tr>
<tr>
<td><input type="checkbox" name="avail" value="sunday"></td>
<td><input type="checkbox" name="avail" value="monday"></td>
<td><input type="checkbox" name="avail" value="tuesday"></td>
<td><input type="checkbox" name="avail" value="wednesday"></td>
<td><input type="checkbox" name="avail" value="thursday"></td>
<td><input type="checkbox" name="avail" value="friday"></td>
<td><input type="checkbox" name="avail" value="saturday"></td>
</tr>
<tr>
<td colspan="3"></td>
<td><input type="submit" value="Submit"></td>
<td colspan="3"></td>
</tr>
</table>
</form>
</center>
</body>
</html>