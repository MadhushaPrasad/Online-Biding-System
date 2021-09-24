package service;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Category;

public interface CategoryService {
	public boolean addCategory(Category c)throws ClassNotFoundException,SQLException;
    public boolean updateCategory(Category c)throws ClassNotFoundException,SQLException;
    public boolean deleteCategory(int id)throws ClassNotFoundException,SQLException;
    public Category searchCategory(int id)throws ClassNotFoundException,SQLException;
    public ArrayList <Category> getAllCategory()throws ClassNotFoundException,SQLException;
}
