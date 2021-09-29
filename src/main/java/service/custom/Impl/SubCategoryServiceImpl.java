package service.custom.Impl;

import model.SubCategory;
import service.custom.SubCategoryService;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SubCategoryServiceImpl implements SubCategoryService {

    @Override
    public boolean add(SubCategory sC) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("INSERT INTO sub_category(category_ID,subCategoryName) VALUES(?,?)");
        System.out.println("impl Sub " + sC.getSubCategoryName());
        pst.setObject(1, sC.getCategory_ID());
        pst.setObject(2, sC.getSubCategoryName());
        return pst.executeUpdate() > 0;
    }

    @Override
    public boolean update(SubCategory sC) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("UPDATE sub_category SET subCategory_ID = ? ,category_ID=?,subCategoryName=? WHERE subCategory_ID=?");
        System.out.println(sC.getSubCategory_ID());
        System.out.println(sC.getCategory_ID());
        System.out.println(sC.getSubCategoryName());
        System.out.println(sC.getSubCategory_ID());

        pst.setObject(1, sC.getSubCategory_ID());
        pst.setObject(2, sC.getCategory_ID());
        pst.setObject(3, sC.getSubCategoryName());
        pst.setObject(4, sC.getSubCategory_ID());
        return pst.executeUpdate() > 0;
    }

    public boolean delete(Integer id) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("DELETE FROM sub_category WHERE subCategory_ID=?");
        pst.setObject(1, id);
        return pst.executeUpdate() > 0;
    }

    public SubCategory search(Integer id) throws ClassNotFoundException, SQLException {
        return null;
    }

    @Override
    public ArrayList<SubCategory> getAll() throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM sub_category");
        ResultSet rst = pst.executeQuery();

        ArrayList<SubCategory> subCategories = new ArrayList<>();
        while (rst.next()) {
            SubCategory subCategory = new SubCategory();
            subCategory.setSubCategory_ID(rst.getInt(1));
            subCategory.setCategory_ID(rst.getInt(2));
            subCategory.setSubCategoryName(rst.getString(3));

            subCategories.add(subCategory);
        }
        return subCategories;
    }
}
