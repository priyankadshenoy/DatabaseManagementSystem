<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="javax.servlet.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
//String n= session.getAttribute( "userid" ).toString();
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
Statement st = conn.createStatement();
String n= session.getAttribute( "userid" ).toString();
//String n="1001";
Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
int c = localCalendar.get(Calendar.DAY_OF_WEEK);
Statement st1 = conn.createStatement();
ResultSet rs1;
Statement st2 = conn.createStatement();
Date dNow = new Date( );
SimpleDateFormat ft = 
new SimpleDateFormat ("H");
int h=Integer.parseInt(ft.format(dNow));
SimpleDateFormat ft1 =
new SimpleDateFormat ("m");
int m=Integer.parseInt(ft1.format(dNow));
/*if(m>0)*/
//h=h+1;
String hr=h+"";
hr=hr.concat("00");
//out.println(hr);
String ht="1900";
ResultSet rs2;
rs1 = st1.executeQuery
("select * from driver_shift_details_date where (shift1 ='" +n+ "' or shift2 ='" +n+ "' or shift3= '" +n+ "' or shift4 = '" +n+ "' or shift5 ='" +n+ "' or shift7='" +n+ "') and dy=3");
if(! rs1.next())
response.sendRedirect("driver_no_shift.jsp");
else
{rs2=st2.executeQuery
("select * from ride r , ride_details rd, destination_address a "+ 
"where r.ride_id=rd.ride_id and " +
"rd.destination_id=a.destination_id and r.start_time= '2015-12-09 16:00:00.000000'");
int i=0;
%>
<br><br><br>
<center>
<b> List of students in ride</b><br><br>
<table>
<tr>
<td>NUID</td>
<td>Location</td>
<td> Details</td>
</tr>
<%while(rs2.next())
{ if(i<3){%>	
<tr>
<td><%out.println(rs2.getString(7)); %> </td>
<td><%out.println(rs2.getString(12)); %></td>
<td><%out.println(rs2.getString(13)); %></td>
</tr>
<% }i++;}
}%>
</table>
</center>
<br>
<br><br>
<center> <b> Students who are absent</b></center><br>
 <form action="driver_student_absentism.jsp" method="POST">
      <input type="text" id="nuid1" name="nuid1" /><br><br>
      <input type="text" id="nuid2" name="nuid2" /><br><br>
      <input type="text" id="nuid3" name="nuid3" /><br><br>
      <input type="text" id="nuid4" name="nuid4" /><br><br>
      <input type="text" id="nuid5" name="nuid5" /><br><br>
      <input type="text" id="nuid6" name="nuid6" /><br><br>
      <input type="text" id="nuid7" name="nuid7" /><br><br>
      <input type="text" id="nuid8" name="nuid8" /><br><br>
      <input type="text" id="nuid9" name="nuid9" /><br><br>
      <input type="text" id="nuid10" name="nuid10" /><br><br>
      <input type="submit" value="Submit" />
</form>
<br> <br>
<a href="driver_add_new_student.jsp">Please click here to add on the spot entries for students!</a>

<body>
</body> 

</html>