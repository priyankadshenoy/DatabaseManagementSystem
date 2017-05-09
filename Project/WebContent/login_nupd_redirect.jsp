<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
		int userid = Integer.parseInt(request.getParameter("username"));  
		session.setAttribute("userid", userid);
		String pwd = request.getParameter("password");
		String name;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/db_project", "root", "root");
		Statement st = conn.createStatement();
		ResultSet rs;
		rs = st.executeQuery
				("select * from nupd_details where nuid='" + userid + "' and pass='" + pwd + "'");
		if (rs.next()) {
			//session.setAttribute("userid", fname);
			//out.println("welcome " + userid);
			//out.println("<a href='logout.jsp'>Log out</a>");
			//name=rs.getString(3);
			//session.setAttribute( "name",name);
			response.sendRedirect("NUPD.jsp");
		} 
		else {
			out.println("Invalid password");
		}
		
		
	%>
