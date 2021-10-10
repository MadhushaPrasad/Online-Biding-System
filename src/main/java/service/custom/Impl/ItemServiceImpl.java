package service.custom.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Item;
import service.custom.ItemService;
import util.DBConnection;

public class ItemServiceImpl implements ItemService {

	@Override
	public boolean add(Item s) throws ClassNotFoundException, SQLException {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO Item(category_ID ,name ,description ,price ,image) VALUES(?,?,?,?,?)");
		pstmt.setObject(1, s.getCategory_ID());
		pstmt.setObject(2, s.getName());
		pstmt.setObject(3, s.getDescription());
		pstmt.setObject(4, s.getPrice());
		pstmt.setObject(5, s.getImage());

		return pstmt.executeUpdate() > 0;
	}

	@Override
	public boolean update(Item s) throws ClassNotFoundException, SQLException {
		
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = connection.prepareStatement("UPDATE Item SET category_ID = ? ,name = ? ,description = ? ,price = ? ,image = ? WHERE itemID = ? ");
		pstmt.setObject(1, s.getCategory_ID());
		pstmt.setObject(2, s.getName());
		pstmt.setObject(3, s.getDescription());
		pstmt.setObject(4, s.getPrice());
		pstmt.setObject(5, s.getImage());
		pstmt.setObject(6, s.getItemID());

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
		
		return null;
	}

	@Override
	public ArrayList<Item> getAll() throws ClassNotFoundException, SQLException {
		
		return null;
	}

}
