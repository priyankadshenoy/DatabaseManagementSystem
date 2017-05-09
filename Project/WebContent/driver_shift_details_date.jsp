<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="javax.servlet.*"%>
<html>
<head>
<title>Display Current Date & Time</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
String queryString = 
"INSERT INTO driver_shift_details_date(dt,shift1,shift2,shift3,shift4,shift5,shift6, shift7, dy) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
Statement st = conn.createStatement();
PreparedStatement pstatement = null;
ResultSet rs1 = st.executeQuery ("select tue from driver_shift_details");
pstatement = conn.prepareStatement(queryString);
ArrayList<Integer> rl1 = new ArrayList<Integer>();
int result;
int a1[]=new int [7];
int c=0; int i=0;
while (rs1.next()) {
	result = rs1.getInt(1); 
	rl1.add(result);
	}
Integer[] arr1 = rl1.toArray(new Integer[rl1.size()]);
	
Date date = new Date();
SimpleDateFormat formaterForOut = new SimpleDateFormat("dd-MM-yyyy");
String resultString = formaterForOut.format(date); 
Date startDate = formaterForOut.parse(resultString);
Date d2 = new Date();
Date d[]=new Date[7];
int updateQuery = 0;
d2.setDate(startDate.getDate()+0);
pstatement.setString(1, (d2+""));
pstatement.setString(2, (arr1[0]+""));
pstatement.setString(3, (arr1[1]+""));
pstatement.setString(4, (arr1[2]+""));
pstatement.setString(5, (arr1[3]+""));
pstatement.setString(6, (arr1[4]+""));
pstatement.setString(7, (arr1[5]+""));
pstatement.setString(8, (arr1[6]+""));
pstatement.setInt(9, 3);
updateQuery = pstatement.executeUpdate();

ResultSet rs2=st.executeQuery ("select wed from driver_shift_details");
ArrayList<Integer> rl2 = new ArrayList<Integer>();
arr1=null;
while (rs2.next()) {
	result = rs2.getInt(1); 
	rl2.add(result);
	}
arr1 = rl2.toArray(new Integer[rl2.size()]);
d2.setDate(startDate.getDate()+1);
pstatement.setString(1, (d2+""));
pstatement.setString(2, (arr1[0]+""));
pstatement.setString(3, (arr1[1]+""));
pstatement.setString(4, (arr1[2]+""));
pstatement.setString(5, (arr1[3]+""));
pstatement.setString(6, (arr1[4]+""));
pstatement.setString(7, (arr1[5]+""));
pstatement.setString(8, (arr1[6]+""));
pstatement.setInt(9, 4);
updateQuery = pstatement.executeUpdate();

ResultSet rs3=st.executeQuery ("select thur from driver_shift_details");
ArrayList<Integer> rl3 = new ArrayList<Integer>();
arr1=null;
while (rs3.next()) {
	result = rs3.getInt(1); 
	rl3.add(result);
	}
arr1 = rl3.toArray(new Integer[rl3.size()]);
d2.setDate(startDate.getDate()+2);
pstatement.setString(1, (d2+""));
pstatement.setString(2, (arr1[0]+""));
pstatement.setString(3, (arr1[1]+""));
pstatement.setString(4, (arr1[2]+""));
pstatement.setString(5, (arr1[3]+""));
pstatement.setString(6, (arr1[4]+""));
pstatement.setString(7, (arr1[5]+""));
pstatement.setString(8, (arr1[6]+""));
pstatement.setInt(9, 5);
updateQuery = pstatement.executeUpdate();

ResultSet rs4=st.executeQuery ("select fri from driver_shift_details");
ArrayList<Integer> rl4 = new ArrayList<Integer>();
arr1=null;
while (rs4.next()) {
	result = rs4.getInt(1); 
	rl4.add(result);
	}
arr1 = rl4.toArray(new Integer[rl4.size()]);
d2.setDate(startDate.getDate()+3);
pstatement.setString(1, (d2+""));
pstatement.setString(2, (arr1[0]+""));
pstatement.setString(3, (arr1[1]+""));
pstatement.setString(4, (arr1[2]+""));
pstatement.setString(5, (arr1[3]+""));
pstatement.setString(6, (arr1[4]+""));
pstatement.setString(7, (arr1[5]+""));
pstatement.setString(8, (arr1[6]+""));
pstatement.setInt(9, 6);
updateQuery = pstatement.executeUpdate();

ResultSet rs5=st.executeQuery ("select sat from driver_shift_details");
ArrayList<Integer> rl5 = new ArrayList<Integer>();
arr1=null;
while (rs5.next()) {
	result = rs5.getInt(1); 
	rl5.add(result);
	}
arr1 = rl5.toArray(new Integer[rl5.size()]);
d2.setDate(startDate.getDate()+4);
pstatement.setString(1, (d2+""));
pstatement.setString(2, (arr1[0]+""));
pstatement.setString(3, (arr1[1]+""));
pstatement.setString(4, (arr1[2]+""));
pstatement.setString(5, (arr1[3]+""));
pstatement.setString(6, (arr1[4]+""));
pstatement.setString(7, (arr1[5]+""));
pstatement.setString(8, (arr1[6]+""));
pstatement.setInt(9, 7);
updateQuery = pstatement.executeUpdate();

ResultSet rs6=st.executeQuery ("select sun from driver_shift_details");
ArrayList<Integer> rl6 = new ArrayList<Integer>();
arr1=null;
while (rs6.next()) {
	result = rs6.getInt(1); 
	rl6.add(result);
	}
arr1 = rl6.toArray(new Integer[rl6.size()]);
d2.setDate(startDate.getDate()+5);
pstatement.setString(1, (d2+""));
pstatement.setString(2, (arr1[0]+""));
pstatement.setString(3, (arr1[1]+""));
pstatement.setString(4, (arr1[2]+""));
pstatement.setString(5, (arr1[3]+""));
pstatement.setString(6, (arr1[4]+""));
pstatement.setString(7, (arr1[5]+""));
pstatement.setString(8, (arr1[6]+""));
pstatement.setInt(9, 1);
updateQuery = pstatement.executeUpdate();

ResultSet rs7=st.executeQuery ("select mon from driver_shift_details");
ArrayList<Integer> rl7 = new ArrayList<Integer>();
arr1=null;
while (rs7.next()) {
	result = rs7.getInt(1); 
	rl7.add(result);
	}
arr1 = rl7.toArray(new Integer[rl7.size()]);
d2.setDate(startDate.getDate()+6);
pstatement.setString(1, (d2+""));
pstatement.setString(2, (arr1[0]+""));
pstatement.setString(3, (arr1[1]+""));
pstatement.setString(4, (arr1[2]+""));
pstatement.setString(5, (arr1[3]+""));
pstatement.setString(6, (arr1[4]+""));
pstatement.setString(7, (arr1[5]+""));
pstatement.setString(8, (arr1[6]+""));
pstatement.setInt(9, 2);
updateQuery = pstatement.executeUpdate();

%>
</body>
</html>