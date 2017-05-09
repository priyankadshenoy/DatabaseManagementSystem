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



/**
 * Servlet implementation class Action
 */
public class Cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int userId;
	static Connection connection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cancel() {
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
		try {
			connection = DatabaseManage.getConnection();
			try {
				String temp = " SELECT ride_registered FROM student  "
						+ " WHERE nuid= ? and ride_registered=1";
				PreparedStatement preStatement = connection.prepareStatement(
						temp, ResultSet.TYPE_SCROLL_INSENSITIVE,
						ResultSet.CONCUR_UPDATABLE);
				preStatement.setString(1, NUID);
				ResultSet resultSet = preStatement.executeQuery();
				
				int rid = 0;
				if (resultSet.next()) {
					String UpdateQuery = "UPDATE student SET ride_registered = 0"
							+ " WHERE nuid = ?";
					PreparedStatement ps;
					ps = connection.prepareStatement(UpdateQuery);
					ps.setString(1, NUID);
					ps.executeUpdate();
					
					String temp2 = "SELECT max(ride_id) as 'rid' FROM ride_details  "
							+ " WHERE nuid= ?";
					PreparedStatement preStatement2 = connection.prepareStatement(temp2);
							
					preStatement2.setString(1, NUID);
					ResultSet resultSet2 = preStatement2.executeQuery();
					System.out.println("HERE2");
					if (resultSet2.next()) {
						rid = resultSet2.getInt(1);
						System.out.println("RIDEID"+rid);
						System.out.println("HERE3");
						
					}
					
					
					String UpdateQuery3 = "UPDATE ride_details SET cancel_ride = 1, student_attendance=0"
							+ " WHERE nuid = ? and ride_id =?";
					System.out.println("HERE4"+rid );
					PreparedStatement ps3;
					ps3 = connection.prepareStatement(UpdateQuery3);
					ps3.setString(1, NUID);
					ps3.setInt(2, rid);
					ps3.executeUpdate();
					
					
					
					String selectQuery= "SELECT w.nuid,w.waitlist_number,w.waitlist_clear,w.destination_id "
							+ "FROM waitlist w "
							+ "WHERE ride_id=?";
					PreparedStatement ps4;
					ps4 = connection.prepareStatement(selectQuery);
					ps4.setInt(1, rid);
	               ResultSet resultSet3 = ps4.executeQuery();
	               int flag=0;
	               String NextNUID= null; 
	               int wNum=0, wClear=0,destination_id=0;
							while(resultSet3.next())
							{
								flag=0;
								NextNUID = resultSet3.getString(1);
								wNum = resultSet3.getInt(2);
								wClear = resultSet3.getInt(3);
								destination_id = resultSet3.getInt(4);
								System.out.println("YYAYAYYAYAYddd");
								if(wClear==0)
								{
									System.out.println("YYAYAYYAYAY");
									String UpdateQuery2 = "UPDATE waitlist SET waitlist_clear = 1"
											+ " WHERE nuid = ?";
									PreparedStatement ps7;
									ps7 = connection.prepareStatement(UpdateQuery2);
									ps7.setString(1, NextNUID);
									ps7.executeUpdate();
									
									System.out.println("YES");
									String InsertQuery = "INSERT INTO ride_details(ride_id,nuid,destination_id) VALUES(?,?,?)";
									PreparedStatement preparedStatement2;
										preparedStatement2 = connection.prepareStatement(InsertQuery);
										preparedStatement2.setInt(1, rid);
										preparedStatement2.setString(2, NextNUID);
										preparedStatement2.setInt(3, destination_id);
										preparedStatement2.executeUpdate();
									
										System.out.println("AA2");
									
										String UpdateQuery4 = "UPDATE student SET ride_registered = 1"
												+ " WHERE nuid = ?";
										PreparedStatement ps8;
										ps8 = connection.prepareStatement(UpdateQuery4);
										ps8.setString(1, NextNUID);
										ps8.executeUpdate();
									break;
								}
								else
								{
									System.out.println("AA1");
									flag=1;
									continue;
								}
							}
							request.getRequestDispatcher("/AfterCancelPage.jsp").forward(request, response);
							return;
							
				}
				else
				{
				request.getRequestDispatcher("/CannotCancel.jsp").forward(request, response);
				return;
				}
							
			}

			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		
		
		}

}
