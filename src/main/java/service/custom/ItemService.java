package service.custom;

import model.Item;
import service.CrudService;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ItemService extends CrudService<Item, Integer> {
    public ArrayList<Item> getAllItemName() throws ClassNotFoundException, SQLException;
}
