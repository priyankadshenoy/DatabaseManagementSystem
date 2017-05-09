<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NUPD</title>
</head>
<body>
<style type="text/css">
html, body{width: 100%; height: 100%; padding: 0; margin: 0}
div{position: absolute; padding: 1em; border: 1px solid #000}
#nw{background: ; top: 0; left: 0; right: 50%; bottom: 50%}
#ne{background: ; top: 0; left: 50%; right: 0; bottom: 50%}
#sw{background: ; top: 50%; left: 0; right: 50%; bottom: 0}
#se{background: ; top: 50%; left: 50%; right: 0; bottom: 0}
</style>
<div id="background">
<img src="photo.jpg" class="stretch" alt="" />
</div>

<div id="nw">DRIVER 
<hr>
&nbsp;
<br>

<form action="addNew" method="post">
<a href="/DB_project/addNew.jsp">Add new account</a>
</form>

<br><br><br>
<form action="updateDriver" method="post">
<a href="/DB_project/gettingDriverDetails.jsp">UpdateExisting</a>
</form>
<br><br><br>
<form action="monitorDriver" method="post">
<a href="/DB_project/monitorDriverDetails.jsp"> Monitor driver details</a>
</form>
</div>
<div id="ne">STUDENT
<hr>
&nbsp;
<br>
<form action="fetchDefaulters" method="post">
<a href="/DB_project/getAllDefaulters.jsp">Fetch defaulters</a>
</form>
<br><br><br>
<form action="clearDefaulters" method="post">
<a href="/DB_project/getAllDefaultersClear.jsp">Clear defaulters</a>
</div>
<div id="sw">VEHICLE
<hr>
&nbsp;
<br>
<form action="addNewVehicle" method="post">
<a href="/DB_project/addNewVehicle.jsp">Add new vehicle</a>
</form>
<br><br><br>
<form action="monitorVehicle" method="post">
<a href="/DB_project/monitorVehDetails.jsp"> Monitor vehicle details</a>
</form>
</div>
<div id="se">RIDE 
<hr>
&nbsp;
<br>
<form action="monitorRide" method="post">
<a href="/DB_project/monitorRideDetails.jsp">Start and End time of the ride</a>
</form>

</div>

</body>
</html>