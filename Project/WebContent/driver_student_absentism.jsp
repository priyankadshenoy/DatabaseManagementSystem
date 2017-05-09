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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
String f1 = request.getParameter("nuid1");
String f2 = request.getParameter("nuid2");
String f3 = request.getParameter("nuid3");
String f4 = request.getParameter("nuid4");
String f5 = request.getParameter("nuid5");
String f6 = request.getParameter("nuid6");
String f7 = request.getParameter("nuid7");
String f8 = request.getParameter("nuid8");
String f9 = request.getParameter("nuid9");
String f10 = request.getParameter("nuid10");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
ResultSet rs1,rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10;

Statement st1 = conn.createStatement();
Statement st2 = conn.createStatement();
Statement st3 = conn.createStatement();
Statement st4 = conn.createStatement();
Statement st5 = conn.createStatement();
Statement st6 = conn.createStatement();
Statement st7 = conn.createStatement();
Statement st8 = conn.createStatement();
Statement st9 = conn.createStatement();
Statement st10 = conn.createStatement();

rs1 = st1.executeQuery("select num_missed_rides from student where nuid='"+ f1 +"'");   
int val=0;
int val1=0;
while(rs1.next())
val=rs1.getInt(1);
val++;
st1.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f1+ "'");
rs1 = st1.executeQuery("select student_attendance from ride_details where nuid='" + f1+ "'");   
val=0;
while(rs1.next())
val=rs1.getInt(1);
val++;
st1.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f1+ "'");

val=0;
rs2 = st2.executeQuery("select num_missed_rides from student where nuid='"+ f2 +"'");   
while(rs2.next())
val=rs1.getInt(1);
val++;
st2.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f2+ "'");
rs2 = st2.executeQuery("select student_attendance from ride_details where nuid='" + f2+ "'");   
val=0;
while(rs2.next())
val=rs2.getInt(1);
val++;
st2.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f2+ "'");

rs3 = st3.executeQuery("select num_missed_rides from student where nuid='"+ f3 +"'");   
val=0;
while(rs3.next())
val=rs3.getInt(1);
val++;
st3.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f3+ "'");
rs3 = st3.executeQuery("select student_attendance from ride_details where nuid='" + f3+ "'");   
val=0;
while(rs3.next())
val=rs3.getInt(1);
val++;
st3.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f3+ "'");

rs4 = st4.executeQuery("select num_missed_rides from student where nuid='"+ f4 +"'");   
val=0;
while(rs4.next())
val=rs4.getInt(1);
val++;
st4.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f4+ "'");
rs4 = st4.executeQuery("select student_attendance from ride_details where nuid='" + f4+ "'");   
val=0;
while(rs4.next())
val=rs4.getInt(1);
val++;
st4.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f4+ "'");


rs5 = st5.executeQuery("select num_missed_rides from student where nuid='"+ f5 +"'");   
val=0;
while(rs5.next())
val=rs5.getInt(1);
val++;
st5.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f5+ "'");
rs5 = st5.executeQuery("select student_attendance from ride_details where nuid='" + f5+ "'");   
val=0;
while(rs5.next())
val=rs5.getInt(1);
val++;
st5.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f5+ "'");

rs6 = st6.executeQuery("select num_missed_rides from student where nuid='"+ f6 +"'");   
val=0;
while(rs6.next())
val=rs6.getInt(1);
val++;
st6.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f6+ "'");
rs6 = st6.executeQuery("select student_attendance from ride_details where nuid='" + f6+ "'");   
val=0;
while(rs6.next())
val=rs6.getInt(1);
val++;
st6.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f6+ "'");

rs7 = st7.executeQuery("select num_missed_rides from student where nuid='"+ f7 +"'");   
val=0;
while(rs7.next())
val=rs7.getInt(1);
val++;
st7.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f7+ "'");
rs7 = st7.executeQuery("select student_attendance from ride_details where nuid='" + f7+ "'");   
val=0;
while(rs7.next())
val=rs7.getInt(1);
val++;
st7.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f7+ "'");

rs8 = st8.executeQuery("select num_missed_rides from student where nuid='"+ f8 +"'");   
val=0;
while(rs8.next())
val=rs8.getInt(1);
val++;
st8.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f8+ "'");
rs8 = st8.executeQuery("select student_attendance from ride_details where nuid='" + f8+ "'");   
val=0;
while(rs8.next())
val=rs8.getInt(1);
val++;
st8.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f8+ "'");


rs9 = st9.executeQuery("select num_missed_rides from student where nuid='"+ f9 +"'");   
val=0;
while(rs9.next())
val=rs9.getInt(1);
val++;
st9.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f9+ "'");
rs9 = st9.executeQuery("select student_attendance from ride_details where nuid='" + f9+ "'");   
val=0;
while(rs9.next())
val=rs9.getInt(1);
val++;
st9.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f9+ "'");


rs10 = st10.executeQuery("select num_missed_rides from student where nuid='"+ f10 +"'");   
val=0;
while(rs10.next())
val=rs10.getInt(1);
val++;
st10.executeUpdate("update student set num_missed_rides='"+ val +"' where nuid='" + f10+ "'");
rs10 = st10.executeQuery("select student_attendance from ride_details where nuid='" + f10+ "'");   
val=0;
while(rs10.next())
val=rs10.getInt(1);
val++;
st10.executeUpdate("update ride_details set student_attendance='"+ val1 +"' where nuid='" + f10+ "'");



%>
</body>
<br><br><br><br>
Thank you for providing attendance details!
</html>