<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

	<%
String available_days[]=request.getParameterValues("avail");
String p;
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
PreparedStatement pstatement = null;
String command;
int nid= Integer.parseInt(session.getAttribute("userid").toString());
//out.println(nid);
Class.forName("com.mysql.jdbc.Driver");
/*ResultSet rs1;
Statement st1 = conn.createStatement();
rs1 = st1.executeQuery
("select * from driver_shift_details where mon='"+ nid +"' or tue='"+ nid +"' or wed='"+ nid +"' or thur='"+ nid +"' or fri='"+ nid +"' or sat='"+ nid +"' or sun='"+ nid +"'");
if(! rs1.next())
	out.println("You have already entered your availability for this week");
else*/
{
	int updateQuery = 0;
String queryString = 
"INSERT INTO driver_availability(nuid,mon,tue,wed,thur,fri,sat,sun) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
boolean m=false;boolean t=false;boolean w=false;boolean th=false;boolean f=false;boolean s=false;boolean su=false;
pstatement = conn.prepareStatement(queryString);
for(int i=0;i<available_days.length;i++)
	{
	p= available_days[i];
		if(p.equals("monday"))
			m=true;
		else if(p.equals("tuesday"))
			t=true; 
		else if(p.equals("wednesday"))
			w=true; 
		else if(p.equals("thursday"))
			th=true; 
		else if(p.equals("friday"))
			f=true; 
		else if(p.equals("saturday"))
			s=true; 
		else if(p.equals("sunday"))
			su=true; 	
		}
pstatement.setInt(1, nid);
pstatement.setBoolean(2, m);
pstatement.setBoolean(3, t);
pstatement.setBoolean(4, w);
pstatement.setBoolean(5, th);
pstatement.setBoolean(6, f);
pstatement.setBoolean(7, s);
pstatement.setBoolean(8, su);
updateQuery = pstatement.executeUpdate();
}
/*command="insert into driver_availability (nuid,mon) values (?, true)" ;
st.execute(command);
out.println(nid);*/
	
%>
<br><br><br><br><br>
Your input has been recorded. Thank you!
</body>
</html>
