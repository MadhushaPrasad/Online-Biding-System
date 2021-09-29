package service.custom;

import model.Category;
import service.CrudService;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CategoryService extends CrudService<Category, Integer> {
    ArrayList<Category> getCatageryNameList() throws ClassNotFoundException, SQLException;
}
