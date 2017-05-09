<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
	<%
String att[]=request.getParameterValues("attendance");
String p;
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
PreparedStatement pstatement = null;
String command;
int nid= Integer.parseInt(session.getAttribute("userid").toString());
Class.forName("com.mysql.jdbc.Driver");
int updateQuery = 0;
String queryString = "INSERT INTO driver_student_details(attendance) VALUES (?)";
pstatement = conn.prepareStatement(queryString);
for(int i=0;i<att.length;i++)
{
	pstatement.setString(1, att[i]);
updateQuery = pstatement.executeUpdate();
}
/*command="insert into driver_availability (nuid,mon) values (?, true)" ;
st.execute(command);
out.println(nid);*/
	
%>
<br><br><br><br><br>
Attendance has been recorded. Thank you!
<br>
<a href="driver_add_new_student.jsp">New students added</a>
</body>
</html>
