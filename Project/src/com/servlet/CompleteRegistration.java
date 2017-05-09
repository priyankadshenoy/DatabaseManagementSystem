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

import sun.security.util.Length;

import java.util.Calendar;

/**
 * Servlet implementation class Add
 */
public class CompleteRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private static Connection connection;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompleteRegistration() {
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
		String AREA=request.getParameter("Area");
		String LOCATION=request.getParameter("Location");
		
		try {
			connection = DatabaseManage.getConnection();
			   Calendar now = Calendar.getInstance();
				System.out.println("Current Hour in 24 hour format is : " + now.get(Calendar.HOUR_OF_DAY));
				int time=now.get(Calendar.HOUR_OF_DAY);
				time=time+1;
				int min=now.get(Calendar.MINUTE);
				int sec=now.get(Calendar.SECOND);
				String t=time+"";
				String m=min+"";
				String s=sec+"";
				if(t.length()==1)
				{
					t="0".concat("t");
				}
				String TimeFinal=t.concat(":").concat(m).concat(":").concat(s);
				System.out.println ("SS"+TimeFinal);
				
				String selectDate="SELECT CURDATE()";
				PreparedStatement preparedStatement1;
			     preparedStatement1 = connection.prepareStatement(selectDate);
			ResultSet resultSet1 = preparedStatement1.executeQuery();
			String Date=null;
			if(resultSet1.next())
			{
				Date=resultSet1.getString(1);
			}
			String Var= Date.concat(" ").concat(t);
			System.out.println("STR DATE"+Var);
			System.out.println("DATE"+Date);
			
		    String InsertDestination="INSERT INTO destination_address(closest_drop_area, exact_destination_address) VALUES(?,?)";
		    
		    PreparedStatement preparedStatement5;
			preparedStatement5 = connection.prepareStatement(InsertDestination);
			preparedStatement5.setString(1, AREA);
			preparedStatement5.setString(2, LOCATION);
			preparedStatement5.executeUpdate();
		    
			String select_aid= "SELECT max(destination_id) "
					+ "FROM destination_address d ";
			PreparedStatement ps2= connection.prepareStatement(select_aid);
			ResultSet rs3= ps2.executeQuery();
			int did=0;
			if(rs3.next()) {
				 did = rs3.getInt(1);
				}
			
				String selectQuery = "SELECT ride_id FROM ride "
									+" WHERE start_time LIKE ?";
				         PreparedStatement preparedStatement;
					     preparedStatement = connection.prepareStatement(selectQuery);
					preparedStatement.setString(1, Var + "%");
					ResultSet resultSet = preparedStatement.executeQuery();
				int rid=0;
				if(resultSet.next())
				{
				 rid=resultSet.getInt(1);
				}
				System.out.println("RIDEID"+rid);
				 String selectQuery1 = "SELECT COUNT(*) FROM ride_details WHERE ride_id=? AND cancel_ride=0";
				 PreparedStatement preparedStatement2;
			     preparedStatement2 = connection.prepareStatement(selectQuery1);
			     preparedStatement2.setInt(1, rid);
			ResultSet rs = preparedStatement2.executeQuery();
			int count=0;
			if(rs.next())
			{
			 count= rs.getInt(1);
			}
			int flag=0;
			if(count>=10)
			{
				String Sq= "SELECT COUNT(*) FROM waitlist WHERE ride_id=? AND waitlist_clear=0";
				PreparedStatement preparedStatement3;
			     preparedStatement3 = connection.prepareStatement(Sq);
			     preparedStatement3.setInt(1, rid);
				ResultSet rs2 = preparedStatement3.executeQuery();
				int c=0;
				if(rs2.next())
				{
				 c= rs2.getInt(1);
				}
				
				int wnum=c+1;
				
				if(c>=10)
				{
					request.getRequestDispatcher("/NoPlaceEvenInWaitList.jsp").forward(request, response);
					return;
				}
				else
				{
				String InsertWL="INSERT INTO waitlist (ride_id, nuid, waitlist_number, destination_id) VALUES(?,?,?,?)";
	
				PreparedStatement preparedStatement6;
				preparedStatement6 = connection.prepareStatement(InsertWL);
				preparedStatement6.setInt(1, rid);
				preparedStatement6.setString(2, NUID);
				preparedStatement6.setInt(3, wnum);
				preparedStatement6.setInt(4, did);
				preparedStatement6.executeUpdate();
				flag=1;
				httpSession.setAttribute("Wnumber", wnum);
				request.getRequestDispatcher("/AddedToWaitList.jsp").forward(request, response);
				return;
				}
				
			}
			else
			{
				String Insert="INSERT INTO ride_details (ride_id,nuid,destination_id) VALUES(?,?,?)";
				PreparedStatement preparedStatement7;
				preparedStatement7 = connection.prepareStatement(Insert);
				preparedStatement7.setInt(1, rid);
				preparedStatement7.setString(2, NUID);
				preparedStatement7.setInt(3, did);
				preparedStatement7.executeUpdate();
				
				String Update="Update Student set ride_registered=1 where nuid=?";
				PreparedStatement preparedStatement8;
				preparedStatement8 = connection.prepareStatement(Update);
				
				preparedStatement8.setString(1, NUID);
				
				preparedStatement8.executeUpdate();
				request.getRequestDispatcher("/Registered.jsp").forward(request, response);
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
