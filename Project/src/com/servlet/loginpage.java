package com.servlet;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DatabaseManage;

/**
 * Servlet implementation class loginpage
 */
public class loginpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int userId;
	static Connection connection;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginpage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession httpSession=request.getSession();
	
	String uname=request.getParameter("username");
	String pwd=request.getParameter("password");
	String login=request.getParameter("login");
	if(login!=null)
	{
		try {
			connection = DatabaseManage.getConnection();
			String query = "SELECT * from student WHERE nuid=? AND pwd=?";
			PreparedStatement preparedStatement = connection
					.prepareStatement(query);
			preparedStatement.setString(1,uname);
			preparedStatement.setString(2, pwd);
			ResultSet resultSet = preparedStatement.executeQuery();
			String fName=null;
			if (resultSet.next()) {
				fName = resultSet.getString("first_name");
				
				System.out.println("Authenticated");
				httpSession.setAttribute("nuid", uname);
				httpSession.setAttribute("fname", fName);
				request.getRequestDispatcher("/AfterRegisterPage.jsp").forward(request, response);
				System.out.println();
				} else {
				System.out.println("wrong user");
				request.getRequestDispatcher("/StudentLogin.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	}

}
