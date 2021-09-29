package service.custom;

import model.Category;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CategoryService {
    boolean addCategory(Category c) throws ClassNotFoundException, SQLException;

    boolean updateCategory(Category c) throws ClassNotFoundException, SQLException;

    boolean deleteCategory(int id) throws ClassNotFoundException, SQLException;

    Category searchCategory(int id) throws ClassNotFoundException, SQLException;

    ArrayList<Category> getAllCategory() throws ClassNotFoundException, SQLException;

    ArrayList<Category> getCatageryNameList() throws ClassNotFoundException, SQLException;
}
