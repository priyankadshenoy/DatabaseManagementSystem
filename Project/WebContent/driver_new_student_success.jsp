<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="style.css" >
<body>
<div id="background">
<img src="photo.jpg" class="stretch" alt="" />
</div>
<div id="left"></div>
<div id="right"></div>
<div id="top"></div>
<div id="bottom"></div>

<%@page import="java.sql.*,java.util.*"%>

<%
String nuid1=request.getParameter("nuid1");
String nuid2=request.getParameter("nuid2");
String nuid3=request.getParameter("nuid3");
String nuid4=request.getParameter("nuid4");
String nuid5=request.getParameter("nuid5");
String location1=request.getParameter("location1");
String location2=request.getParameter("location2");
String location3=request.getParameter("location3");
String location4=request.getParameter("location4");
String location5=request.getParameter("location5");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
Statement st=con.createStatement();
if(nuid1!="" && location1!="")
st.executeUpdate
("insert into driver_new_student_details(name,location) values('"+nuid1+"','"+location1+"')");
if(nuid2!="" && location2!="")
st.executeUpdate
("insert into driver_new_student_details(name,location) values('"+nuid2+"','"+location2+"')");
if(nuid3!="" && location3!="")
st.executeUpdate
("insert into driver_new_student_details(name,location) values('"+nuid3+"','"+location3+"')");
if(nuid4!="" && location4!="")
st.executeUpdate
("insert into driver_new_student_details(name,location) values('"+nuid4+"','"+location4+"')");
if(nuid5!="" && location5!="")
st.executeUpdate
("insert into driver_new_student_details(name,location) values('"+nuid5+"','"+location5+"')");

//out.println(nuid1+" "+location1);
}
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
        %>
<br><br><br><br><br>
New students have been added. Thank you!
</body>
</html>