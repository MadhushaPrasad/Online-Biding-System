package service.custom.Impl;

import model.Category;
import service.custom.CategoryService;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryServiceImpl implements CategoryService {


    @Override
    public boolean add(Category category) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        String sql = "INSERT INTO Category(categoryName) VALUES(?)";
        PreparedStatement pstm = connection.prepareStatement(sql);
        pstm.setObject(1, category.getCategoryName());
        return pstm.executeUpdate() > 0;
    }

    @Override
    public boolean update(Category category) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("Update category set category_ID = ? ,categoryName=? WHERE category_ID=?");
        pst.setObject(1, category.getCategory_ID());
        pst.setObject(2, category.getCategoryName());
        pst.setObject(3, category.getCategory_ID());
        return pst.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Integer id) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("DELETE FROM Category WHERE category_ID=?");
        pst.setObject(1, id);
        return pst.executeUpdate() > 0;
    }

    @Override
    public Category search(Integer id) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM category WHERE category_ID=?");
        pst.setObject(1, id);
        ResultSet rst = pst.executeQuery();
        Category category = new Category();
        while (rst.next()) {
            category.setCategory_ID(rst.getInt(1));
            category.setCategoryName(rst.getString(2));
        }
        return category;
    }

    @Override
    public ArrayList<Category> getAll() throws ClassNotFoundException, SQLException {

        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Category");
        ResultSet rst = pstm.executeQuery();
        ArrayList<Category> allCategory = new ArrayList<>();
        while (rst.next()) {
            Category category = new Category();
            category.setCategory_ID(rst.getInt(1));
            category.setCategoryName((rst.getString(2)));
            allCategory.add(category);
        }
        return allCategory;
    }

    @Override
    public ArrayList<Category> getCatageryNameList() throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT category_ID,categoryName FROM category");
        ResultSet rst = pst.executeQuery();

        ArrayList<Category> categoryList = new ArrayList<>();
        while (rst.next()) {
            Category category = new Category();
            category.setCategory_ID(rst.getInt(1));
            category.setCategoryName(rst.getString(2));

            categoryList.add(category);
        }
        return categoryList;
    }

}
