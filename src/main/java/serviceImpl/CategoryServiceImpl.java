package serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Category;
import service.CategoryService;
import util.DBConnection;

public class CategoryServiceImpl implements CategoryService {

	@Override
	public boolean addCategory(Category c) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateCategory(Category c) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCategory(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Category searchCategory(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Category> getAllCategory() throws ClassNotFoundException, SQLException {

		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Category");
		ResultSet rst = pstm.executeQuery();
		ArrayList<Category> allCategory = new ArrayList<>();
		while (rst.next()) {
			Category category = new Category();
			category.setCategory_ID(rst.getInt(1));
			category.setName((rst.getString(2)));
			allCategory.add(category);
		}
		return allCategory;
	}

}
