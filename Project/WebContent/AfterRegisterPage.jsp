<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Homepage</title>
</head>
<div id="background">
<img src="photo.jpg" class="stretch" alt="" />
</div>
<div id="left"></div>
<div id="right"></div>
<div id="top"></div>
<div id="bottom"></div>
Welcome: ${sessionScope.fname}
<br>
<br>
<br>
<table border="1" bordercolor="#3104B4">
<tr>
<td>
<form action="Action" method="post">


<p><input type="submit" name="register" value="Register for a ride"><br><br><input type="submit" value="Cancel a ride" name="cancel"><br><br><input type="submit" value="Log Out" name="logout"></p>

</form>
</td>
</tr>
</table>



</body>
</html>