  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UPDATE</title>
<link rel="stylesheet" type="text/css" href="style.css" >
</head>
<!-- <body bgcolor="#EFFBF5"> -->
<div id="background">
<img src="photo.jpg" class="stretch" alt="" />
</div>
<div id="left"></div>
<div id="right"></div>
<div id="top"></div>
<div id="bottom"></div>

Length:${sessionScope.length }

<table border="1">
<tr>
<th>Name</th>
<th>NUID</th>
</tr>

	<c:forEach var="i" begin="0" end="${sessionScope.length}" step="1">
	<tr>
	 <td>
                  ${sessionScope.List[i].fName}
     </td>
     <td>
                  ${sessionScope.List[i].NUID}
     </td>
     </tr>
	</c:forEach>




</table>

<br>
<form action="clearID" method="post">

			Please enter the NUID you want to clear from list:		
			<input type="text" name="NUID"/><br>
			<input type="submit" name="submit" value="submit"/>
			
	</form>


</body>
</html>