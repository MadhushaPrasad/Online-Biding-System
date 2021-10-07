package service.custom.Impl;

import model.Bid;
import model.Category;
import service.custom.BidService;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BidServiceImpl implements BidService {
    @Override
    public boolean add(Bid bid) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("INSERT INTO Bid(userID, itemID, amount, bid_time, bid_date, status) VALUES (?,?,?,current_time(),current_time,?)");
        pst.setObject(1, bid.getUserID());
        pst.setObject(2, bid.getItemID());
        pst.setObject(3, bid.getAmount());
        pst.setObject(4, bid.getStatus());
        return pst.executeUpdate() > 0;
    }

    @Override
    public boolean update(Bid bid) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("UPDATE Bid set bid_ID=?,userID=?,itemID=?,amount=?,bid_date = current_time(),bid_time=current_time(),status=? WHERE bid_ID = ?");
        pst.setObject(1, bid.getBid_ID());
        pst.setObject(2, bid.getUserID());
        pst.setObject(3, bid.getItemID());
        pst.setObject(4, bid.getAmount());
        pst.setObject(5, bid.getStatus());
        pst.setObject(6, bid.getBid_ID());
        return pst.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Integer id) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("DELETE FROM bid WHERE bid_ID=?");
        pst.setObject(1, id);
        return pst.executeUpdate() > 0;
    }

    @Override
    public Bid search(Integer id) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * from bid WHERE bid_ID=?");
        pst.setObject(1, id);
        ResultSet rst = pst.executeQuery();
        Bid bid = new Bid();
        while (rst.next()) {
            bid.setBid_ID(rst.getInt(1));
            bid.setUserID(rst.getInt(2));
            bid.setItemID(rst.getInt(3));
            bid.setAmount(rst.getDouble(4));
            bid.setBid_time(rst.getString(5));
            bid.setBid_date(rst.getString(6));
            bid.setStatus(rst.getString(7));
        }
        return bid;
    }

    @Override
    public ArrayList<Bid> getAll() throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM bid");
        ResultSet rst = pst.executeQuery();
        ArrayList<Bid> bidList = new ArrayList<>();
        if (rst.next()) {
            Bid bid = new Bid();
            bid.setBid_ID(rst.getInt(1));
            bid.setUserID(rst.getInt(2));
            bid.setItemID(rst.getInt(3));
            bid.setAmount(rst.getDouble(4));
            bid.setBid_time(rst.getString(5));
            bid.setBid_date(rst.getString(6));
            bid.setStatus(rst.getString(7));

            bidList.add(bid);
        }
        return bidList;
    }
}
