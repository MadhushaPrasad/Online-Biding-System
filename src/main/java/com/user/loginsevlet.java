package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/loginsevlet")
public class loginsevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String UserName = request.getParameter("username");
		String Password = request.getParameter("password");
		
		
		boolean istrue;
		
		istrue = userDBUtil.validate(UserName, Password);
		
		if(istrue == true) {
				List<Users> UserDetails =  userDBUtil.getUser(UserName);
				
				request.setAttribute("UserDetails", UserDetails);
				
				RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
				dis.forward(request,response);
			}else {
				out.println("<script type = 'text/javascript'>");
				out.println("alert('Your user name or password is incorrect');");
				out.println("location= 'login.jsp'");
				out.println("</script>");
			} 
	}
}