<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Homepage</title>
</head>
<body>
<div id="background">
<img src="photo.jpg" class="stretch" alt="" />
</div>
<div id="left"></div>
<div id="right"></div>
<div id="top"></div>
<div id="bottom"></div>
<strong><font color="#0A1B2A" size="5">Welcome Student</strong>
<p>&nbsp;</p>

<table border="1" bordercolor="#3104B4">
<tr>
<td>
<form method="POST" action="loginpage">
<p><font color="#0A1B2A" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Enter your NUID:</font><input type="text" name="username" size="20"></p>

<p><font color="#0A1B2A" size="5">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter password:&nbsp;</font><input type="password" name="password" size="20"></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Login" name="login"></p>  
</form>
</td>
</tr>
</table>
</body>
</html>