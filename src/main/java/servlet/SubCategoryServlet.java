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

@WebServlet("/subCategory")
public class SubCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SubCategoryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Connection connection = DBConnection.getInstance().getConnection();
			PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Sub_Category");
			ResultSet rst = pstm.executeQuery();
			ArrayList<Category> allCategory = new ArrayList<>();
			while (rst.next()) {
				Category category = new Category();
				category.setCategory_ID(rst.getInt(1));
				category.setName((rst.getString(2)));
				allCategory.add(category);
				System.out.println(rst.getInt(1));
				System.out.println(rst.getString(2));
			}
			System.out.println(allCategory);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int categoryID = Integer.parseInt(request.getParameter("categoryName"));
		String categoryName = request.getParameter("subCategory");

		try {
			Connection connection = DBConnection.getInstance().getConnection();
			String sql = "INSERT INTO Sub_Category(category_ID,name) VALUES("+categoryID+",'" + categoryName + "')";
			PreparedStatement pstm = connection.prepareStatement(sql);
			int i = pstm.executeUpdate();
			if (i > 0) {
				System.out.println("Added");
			} else {
				System.out.println("Error");
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
