<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
    border: 0px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 10px;
    text-align: center;
	
}
</style>
<link rel="stylesheet" type="text/css" href="style.css" >
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
<form method="post" action="driver_new_student_success.jsp">
<table>
<tr><td></td><td></td><th> On the spot student entries</th></tr><br>

<tr><td>NUID:</td><td><input type="text" name="nuid1"></td>
	<td>Location:</td><td><input type="text" name="location1"></td></tr><br>
<tr><td>NUID:</td><td><input type="text" name="nuid2"></td>
	<td>Location:</td><td><input type="text" name="location2"></td></tr><br>
<tr><td>NUID:</td><td><input type="text" name="nuid3"></td>
	<td>Location:</td><td><input type="text" name="location3"></td></tr><br>
<tr><td>NUID:</td><td><input type="text" name="nuid4"></td>
	<td>Location:</td><td><input type="text" name="location4"></td></tr><br>
<tr><td>NUID:</td><td><input type="text" name="nuid5"></td>
	<td>Location:</td><td><input type="text" name="location5"></td></tr><br>
<tr><td></td><td></td><td><center><input type="submit" value="Submit"></td></center></tr>

</table>
</form>
</center>
</html>
</body>
</html>