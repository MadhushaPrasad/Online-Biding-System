package serviceImpl;

import model.SubCategory;
import service.SubCategoryService;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SubCategoryServiceImpl implements SubCategoryService {

    @Override
    public boolean addSubCategory(SubCategory sC) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("INSERT INTO sub_category(category_ID,subCategoryName) VALUES(?,?)");
        System.out.println("impl Sub " + sC.getSubCategoryName());
        pst.setObject(1, sC.getCategory_ID());
        pst.setObject(2, sC.getSubCategoryName());
        return pst.executeUpdate() > 0;
    }

    @Override
    public boolean updateSubCategory(SubCategory sC) throws ClassNotFoundException, SQLException {
        return false;
    }

    @Override
    public boolean deleteSubCategory(int id) throws ClassNotFoundException, SQLException {
        return false;
    }

    @Override
    public SubCategory searchSubCategory(int id) throws ClassNotFoundException, SQLException {
        return null;
    }

    @Override
    public ArrayList<SubCategory> getAllSubCategory() throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM sub_category");
        ResultSet rst = pst.executeQuery();

        ArrayList<SubCategory> subCategories = new ArrayList<>();
        while (rst.next()) {
            SubCategory subCategory = new SubCategory();
            subCategory.setSubCategory_ID(rst.getInt(1));
            subCategory.setCategory_ID(rst.getInt(2));
            subCategory.setSubCategoryName(rst.getString(3));

//            System.out.println(rst.getInt(1));
//            System.out.println(rst.getInt(2));
//            System.out.println(rst.getString(3));
//            System.out.println(subCategory.toString());

            subCategories.add(subCategory);
        }
//        System.out.println(subCategories);
        return subCategories;
    }
}
