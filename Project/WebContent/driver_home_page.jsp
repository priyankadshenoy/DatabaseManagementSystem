<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page - Driver</title>
<style>
body{
text-align: center;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
	
}
th, td {
    padding: 10px;
    text-align: center;
	
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:1000px;
    width:300px;
    float:left;
    padding:10px;	  
	text-align:center;
}
#section {
    width:800px;
    float:left;
    padding:10px;	
	text-align:center;
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

<div id="nav">
<br><br>
<b>Welcome <%= session.getAttribute( "name" ) %>!</b>
<br><br>
<a href="driver_availability.jsp">Fill availability form</a><br>
<a href="driver_next_ride_details.jsp">Next Ride Details</a><br>
</div>
<div id="section">
<h2>Weekly shift details</h2>
<center>
<%
String n= session.getAttribute( "userid" ).toString();
//out.println(nuid);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
Statement st = conn.createStatement();
ResultSet rs;
rs = st.executeQuery
("select tod from driver_shift_details where mon='" + n + "' ");
out.println("<th><td>Monday</td></th><tr><td><br>");
/*if(!rs.next())
out.println("No shifts<br>");
else*/
while(rs.next())
out.println(+rs.getInt(1)+" hrs<br>");
rs = st.executeQuery
("select tod from driver_shift_details where tue='" + n + "' ");
out.println("<br><th><td>Tuesday</td></th><tr><td><br>");

while(rs.next())
	out.println(+rs.getInt(1)+" hrs<br>");
rs = st.executeQuery
("select tod from driver_shift_details where wed='" + n + "' ");
out.println("<br><th><td>Wednesday</td></th><tr><td><br>");

while(rs.next())
	out.println(+rs.getInt(1)+" hrs<br>");
rs = st.executeQuery
("select tod from driver_shift_details where thur='" + n + "' ");
out.println("<br><th><td>Thursday</td></th><tr><td><br>");

while(rs.next())
	out.println(+rs.getInt(1)+" hrs<br>");
rs = st.executeQuery
("select tod from driver_shift_details where fri='" + n + "' ");
out.println("<br><th><td>Friday</td></th><tr><td><br>");

while(rs.next())
	out.println(+rs.getInt(1)+" hrs<br>");
rs = st.executeQuery
("select tod from driver_shift_details where sat='" + n + "' ");
out.println("<br><th><td>Saturday</td></th><tr><td><br>");

while(rs.next())
	out.println(+rs.getInt(1)+" hrs<br>");
rs = st.executeQuery
("select tod from driver_shift_details where sun='" + n + "' ");
out.println("<br><th><td>Sunday</td></th><tr><td><br>");
while(rs.next())
	out.println(+rs.getInt(1)+" hrs<br>");

%>
</center>
</div>
</body>
</html>