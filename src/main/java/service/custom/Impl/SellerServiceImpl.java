package service.custom.Impl;

import model.User;
import service.custom.SellerService;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SellerServiceImpl implements SellerService {
    @Override
    public boolean add(User user) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("INSERT INTO users(userName, f_Name, l_Name, email, " +
                "telephone, address, password, img, type, status) VALUES (?,?,?,?,?,?,?,?,?,?)");
        pst.setObject(1, user.getUserName());
        pst.setObject(2, user.getF_Name());
        pst.setObject(3, user.getL_Name());
        pst.setObject(4, user.getEmail());
        pst.setObject(5, user.getTelephone());
        pst.setObject(6, user.getAddress());
        pst.setObject(7, user.getPassword());
        pst.setObject(8, user.getImg());
        pst.setObject(9, user.getType());
        pst.setObject(10, user.getStatus());
        return pst.executeUpdate() > 0;
    }

    @Override
    public boolean update(User user) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("UPDATE Users set userID=?,userName=?,f_Name=?,l_Name=?," +
                "email=?,telephone=?,address=?,password=?,img=?,type=?,status=? WHERE userID=? && type = 'Seller'");
        pst.setObject(1, user.getUserID());
        pst.setObject(2, user.getUserName());
        pst.setObject(3, user.getF_Name());
        pst.setObject(4, user.getL_Name());
        pst.setObject(5, user.getEmail());
        pst.setObject(6, user.getTelephone());
        pst.setObject(7, user.getAddress());
        pst.setObject(8, user.getPassword());
        pst.setObject(9, user.getImg());
        pst.setObject(10, user.getType());
        pst.setObject(11, user.getStatus());
        pst.setObject(12, user.getUserID());
        return pst.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Integer id) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("DELETE FROM Users WHERE userID=? AND type = 'Seller'");
        pst.setObject(1, id);
        return pst.executeUpdate() > 0;
    }

    @Override
    public User search(Integer integer) throws ClassNotFoundException, SQLException {
        return null;
    }

    @Override
    public ArrayList<User> getAll() throws ClassNotFoundException, SQLException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM users");
        ResultSet resultSet = pst.executeQuery();
        ArrayList<User> allUsers = new ArrayList<>();
        while (resultSet.next()) {
            User user = new User();
            user.setUserID(resultSet.getInt(1));
            user.setUserName(resultSet.getString(2));
            user.setF_Name(resultSet.getString(3));
            user.setL_Name(resultSet.getString(4));
            user.setEmail(resultSet.getString(5));
            user.setTelephone(resultSet.getString(6));
            user.setAddress(resultSet.getString(7));
            user.setPassword(resultSet.getString(8));
            user.setImg(resultSet.getString(9));
            user.setType(resultSet.getString(10));

            allUsers.add(user);
        }
        return allUsers;
    }
}
