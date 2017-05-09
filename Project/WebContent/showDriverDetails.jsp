  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Driver details</title>
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
Length:${sessionScope.length }
<form action="ActualUpdateDriver" method="post">
<table border="1">
<tr>
<th>Driver ID</th>
<th>first Name</th>
<th>Last Name</th>
<th>Start time</th>
<th>End Time</th>
</tr>

	<c:forEach var="i" begin="0" end="${sessionScope.length}" step="1">
	<tr>
	 <td>
                  ${sessionScope.List[i].dID}
     </td>
     <td>
                  ${sessionScope.List[i].fName}
     </td>
      <td>
                  ${sessionScope.List[i].lName}
     </td>
      <td>
                  ${sessionScope.List[i].start}
     </td>
      <td>
                  ${sessionScope.List[i].end}
     </td>
     </tr>
	</c:forEach>




</table>

</form>


</body>
</html>