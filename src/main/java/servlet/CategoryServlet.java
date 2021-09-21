package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Category;
import serviceImpl.CategoryServiceImpl;
import util.DBConnection;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Connection connection;
		try {
			connection = DBConnection.getInstance().getConnection();
			PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Category");
			ResultSet rst = pstm.executeQuery();
			ArrayList<Category> allCategory = new ArrayList<>();
			while (rst.next()) {
				Category category = new Category();
				category.setCategory_ID(rst.getInt(1));
				category.setName((rst.getString(2)));
				allCategory.add(category);
			}
			System.out.println(allCategory);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//CategoryServiceImpl cSI = new CategoryServiceImpl();
		
		System.out.println("YOUR MESSAGE");
	}

}
