package com.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Action
 */
public class Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Action() {
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
		String register=request.getParameter("register");
		String cancel=request.getParameter("cancel");
		String logout=request.getParameter("logout");
		HttpSession httpSession=request.getSession();
		
		if(register!=null)
		{
			request.getRequestDispatcher("PreRegister.jsp").forward(request, response);
		}
		if(cancel!=null)
		{
			request.getRequestDispatcher("cancel.jsp").forward(request, response);
		}
	
		if(logout!=null)
		{
			httpSession.invalidate();
			request.getRequestDispatcher("StudentLogin.jsp").forward(request, response);
			
		}
	}

}
