package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.db.DatabaseManage;
import java.util.Calendar;

/**
 * Servlet implementation class Add
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private static Connection connection;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String NUID=(String)httpSession.getAttribute("nuid");
		int r=0,s=0;
		
		try {
			connection = DatabaseManage.getConnection();
			String selectQuery = "select * from student where NUID=?";
			PreparedStatement preparedStatement;
				preparedStatement = connection.prepareStatement(selectQuery);
				preparedStatement.setString(1, NUID);
				 ResultSet resultSet = preparedStatement.executeQuery();
				 if(resultSet.next())
				 {
					 System.out.println("TATTATATTATA" +r);
				 r=resultSet.getInt(8);
				 s=resultSet.getInt(5);
				 System.out.println("TATTATATTATSA" +r);
				 if(!(r==0))
				 {
					 	System.out.println("sfsffs");
						request.getRequestDispatcher("/AlreadyRegistered.jsp").forward(request, response);
						return;
				 }
				 System.out.println("ss"+s);
				if(s>=10)
				{
					System.out.println("BLOCK");
					request.getRequestDispatcher("/Blocked.jsp").forward(request, response);
					return;
				}
				 }
				Calendar now = Calendar.getInstance();
				System.out.println("Current Hour in 24 hour format is : " + now.get(Calendar.HOUR_OF_DAY));
				int time=now.get(Calendar.HOUR_OF_DAY);
				
				if(time<14)/*16*/
				{
					System.out.println("YAHAAA");
					request.getRequestDispatcher("/ComeLater.jsp").forward(request, response);
					return;
				}
				else{
				request.getRequestDispatcher("/EnterDestination.jsp").forward(request, response);
				return;
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
