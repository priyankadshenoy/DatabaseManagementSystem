<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 20px;
    text-align: center;
	
}
</style>
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

<center>
<br><br><br><br>
<b><font color="red" size="4"><em> Welcome to Red Eye Registration System ! </em></font></b>
<br><br><br>
<table>
<tr> 
<td> <FORM action="StudentLogin.jsp">
<INPUT type=submit value="Student Login">
</FORM></td>
</tr>
<tr> 
<td> <FORM action="login_nupd.jsp">
<INPUT type=submit value="NUPD Login">
</FORM></td>
</tr>
<tr> 
<td> <FORM action="login_driver.jsp">
<INPUT type=submit value="Driver Login">
</FORM></td>
</tr>
</table>
</center>
</body>
</html>