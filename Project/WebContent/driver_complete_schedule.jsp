<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
		Statement st = conn.createStatement();
		Statement st1 = conn.createStatement();
		Statement st2 = conn.createStatement();
		Statement st3 = conn.createStatement();
		Statement st4 = conn.createStatement();
		Statement st5 = conn.createStatement();
		Statement st6 = conn.createStatement();
		PreparedStatement ps = conn.prepareStatement("select nuid from driver_availability where mon=true");
		ResultSet rs1,rs2,rs3,rs4,rs5,rs6,rs7;
		int result;
		int z=1;
		PreparedStatement pstatement = null;
		String queryString = 
"INSERT INTO driver_shift_details(tod,mon,tue,wed,thur,fri,sat,sun) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		rs1 = st.executeQuery ("select nuid from driver_availability where mon=true");
		rs2 = st1.executeQuery ("select nuid from driver_availability where tue=true");
		rs3 = st2.executeQuery ("select nuid from driver_availability where wed=true");
		rs4 = st3.executeQuery ("select nuid from driver_availability where thur=true");
		rs5 = st4.executeQuery ("select nuid from driver_availability where fri=true");
		rs6 = st5.executeQuery ("select nuid from driver_availability where sat=true");
		rs7 = st6.executeQuery ("select nuid from driver_availability where sun=true");
		pstatement = conn.prepareStatement(queryString);
		int updateQuery = 0;
		int i=0;
		ArrayList<Integer> rl1 = new ArrayList<Integer>();
		ArrayList<Integer> rl2 = new ArrayList<Integer>();
		ArrayList<Integer> rl3 = new ArrayList<Integer>();
		ArrayList<Integer> rl4 = new ArrayList<Integer>();
		ArrayList<Integer> rl5 = new ArrayList<Integer>();
		ArrayList<Integer> rl6 = new ArrayList<Integer>();
		ArrayList<Integer> rl7 = new ArrayList<Integer>();

		while (rs1.next()) {
		result = rs1.getInt(1); 
		rl1.add(result);
		}
		Integer[] arr1 = rl1.toArray(new Integer[rl1.size()]);
		int a1[]=new int [7];
		int c=0;
		for(i=0; i<7; )
		{
			if(c>arr1.length-1)
				c=0;
			else
				{
				a1[i]=arr1[c];	
				c++;
				i++;
				}
			
		}
		while (rs2.next()) {
		result = rs2.getInt(1); 
		rl2.add(result);
		}
		Integer[] arr2 = rl2.toArray(new Integer[rl2.size()]);
		int a2[]=new int [7];
		c=0;
		for(i=0; i<7; )
		{
			if(c>arr2.length-1)
				c=0;
			else
				{
				a2[i]=arr2[c];	
				c++;
				i++;
				}
			
		}
		while (rs3.next()) {
			result = rs3.getInt(1); 
			rl3.add(result);
			}
			Integer[] arr3 = rl3.toArray(new Integer[rl3.size()]);
			int a3[]=new int [7];
			c=0;
			for(i=0; i<7; )
			{
				if(c>arr3.length-1)
					c=0;
				else
					{
					a3[i]=arr3[c];	
					c++;
					i++;
					}
				
			}

			while (rs4.next()) {
				result = rs4.getInt(1); 
				rl4.add(result);
				}
				Integer[] arr4 = rl4.toArray(new Integer[rl4.size()]);
				int a4[]=new int [7];
				c=0;
				for(i=0; i<7; )
				{
					if(c>arr4.length-1)
						c=0;
					else
						{
						a4[i]=arr4[c];	
						c++;
						i++;
						}
					
				}

				while (rs5.next()) {
					result = rs5.getInt(1); 
					rl5.add(result);
					}
					Integer[] arr5 = rl5.toArray(new Integer[rl1.size()]);
					int a5[]=new int [7];
					c=0;
					for(i=0; i<7; )
					{
						if(c>arr1.length-1)
							c=0;
						else
							{
							a5[i]=arr5[c];	
							c++;
							i++;
							}
						
					}
					
					while (rs6.next()) {
						result = rs6.getInt(1); 
						rl6.add(result);
						}
						Integer[] arr6 = rl6.toArray(new Integer[rl6.size()]);
						int a6[]=new int [7];
						c=0;
						for(i=0; i<7; )
						{
							if(c>arr6.length-1)
								c=0;
							else
								{
								a6[i]=arr6[c];	
								c++;
								i++;
								}
							
						}

						while (rs7.next()) {
							result = rs7.getInt(1); 
							rl7.add(result);
							}
							Integer[] arr7 = rl7.toArray(new Integer[rl7.size()]);
							int a7[]=new int [7];
							c=0;
							for(i=0; i<7; )
							{
								if(c>arr7.length-1)
									c=0;
								else
									{
									a7[i]=arr7[c];	
									c++;
									i++;
									}
								
							}
			
		/*for(i=0; i<7; i++)
		{
			out.println(a[i]);
		}*/
		int time=1800;
		for(i=0;i<7;i++)
		{
			pstatement.setString(1, time+"");
			pstatement.setString(2, (a1[i]+""));
			pstatement.setString(3, (a2[i]+""));
			pstatement.setString(4, (a3[i]+""));
			pstatement.setString(5, (a4[i]+""));
			pstatement.setString(6, (a5[i]+""));
			pstatement.setString(7, (a6[i]+""));
			pstatement.setString(8, (a7[i]+""));
			updateQuery = pstatement.executeUpdate();
			//out.println(a[i]);
			time=time+100;
		}
		Calendar now = Calendar.getInstance();
		int dayOfMonth = now.get(Calendar.DAY_OF_MONTH);
		
		//Date date = new Date();
		  // out.print( "<h2 align=\"center\">" +date.toString()+"</h2>");*/
		
%>




</body>
</html>