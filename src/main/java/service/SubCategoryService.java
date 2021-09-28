package service;

import model.SubCategory;

import java.sql.SQLException;
import java.util.ArrayList;

public interface SubCategoryService {
    boolean addSubCategory(SubCategory sC) throws ClassNotFoundException, SQLException;

    boolean updateSubCategory(SubCategory sC) throws ClassNotFoundException, SQLException;

    boolean deleteSubCategory(int id) throws ClassNotFoundException, SQLException;

    SubCategory searchSubCategory(int id) throws ClassNotFoundException, SQLException;

    ArrayList<SubCategory> getAllSubCategory() throws ClassNotFoundException, SQLException;
}
