package service.custom.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bid;
import model.Item;
import service.custom.ItemService;
import util.DBConnection;

public class ItemServiceImpl implements ItemService {

    @Override
    public boolean add(Item s) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pstmt = connection.prepareStatement("INSERT INTO Item(category_ID ,userID,name ,description ,price ,image,status) VALUES(?,?,?,?,?,?,?)");
        pstmt.setObject(1, s.getCategory_ID());
        pstmt.setObject(2, s.getUserID());
        pstmt.setObject(3, s.getName());
        pstmt.setObject(4, s.getDescription());
        pstmt.setObject(5, s.getPrice());
        pstmt.setObject(6, s.getImage());
        pstmt.setObject(7, s.getStatus());

        return pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean update(Item s) throws ClassNotFoundException, SQLException {

        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pstmt = connection.prepareStatement("UPDATE Item SET category_ID = ?,userID = ? ,name = ? ,description = ? ,price = ? ,image = ? , status=? WHERE itemID = ? ");
        pstmt.setObject(1, s.getCategory_ID());
        pstmt.setObject(2, s.getUserID());
        pstmt.setObject(3, s.getName());
        pstmt.setObject(4, s.getDescription());
        pstmt.setObject(5, s.getPrice());
        pstmt.setObject(6, s.getImage());
        pstmt.setObject(7, s.getStatus());
        pstmt.setObject(8, s.getItemID());

        return pstmt.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Integer id) throws ClassNotFoundException, SQLException {

        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pstmt = connection.prepareStatement("DELETE FROM Item WHERE itemID = ?");
        pstmt.setObject(1, id);
        return pstmt.executeUpdate() > 0;
    }

    @Override
    public Item search(Integer id) throws ClassNotFoundException, SQLException {

        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM item WHERE itemID=?");
        pst.setObject(1, id);
        ResultSet rst = pst.executeQuery();
        Item item = new Item();
        if (rst.next()) {
            item.setItemID(rst.getInt(1));
            item.setCategory_ID(rst.getInt(2));
            item.setUserID(rst.getInt(3));
            item.setName(rst.getString(4));
            item.setDescription(rst.getString(5));
            item.setPrice(rst.getDouble(6));
            item.setImage(rst.getString(7));
            item.setStatus(rst.getString(8));
        }

        return item;
    }

    @Override
    public ArrayList<Item> getAll() throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM item");
        ResultSet rst = pst.executeQuery();
        ArrayList<Item> itemList = new ArrayList<>();
        while (rst.next()) {
            Item item = new Item();
            item.setItemID(rst.getInt(1));
            item.setCategory_ID(rst.getInt(2));
            item.setUserID(rst.getInt(3));
            item.setName(rst.getString(4));
            item.setDescription(rst.getString(5));
            item.setPrice(rst.getDouble(6));
            item.setImage(rst.getString(7));
            item.setStatus(rst.getString(8));

            itemList.add(item);
        }

        return itemList;
    }

}
