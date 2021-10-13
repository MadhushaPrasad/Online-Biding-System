package service.custom.Impl;

import model.User;
import service.custom.LoginService;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginServiceImpl implements LoginService {
    @Override
    public boolean checkUser(String email, String password) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        System.out.println(email);
        System.out.println(password);
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
        pst.setObject(1,email);
        pst.setObject(2,password);
        ResultSet rst = pst.executeQuery();
        if (rst.next()) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public User checkUserType(String email, String password) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        PreparedStatement pst = connection.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
        pst.setObject(1,email);
        pst.setObject(2,password);
        ResultSet rst = pst.executeQuery();
        User user = new User();
        while (rst.next()) {
            user.setUserID(rst.getInt(1));
            user.setUserName(rst.getString(2));
            user.setF_Name(rst.getString(3));
            user.setL_Name(rst.getString(4));
            user.setEmail(rst.getString(5));
            user.setTelephone(rst.getString(6));
            user.setAddress(rst.getString(7));
            user.setPassword(rst.getString(8));
            user.setImg(rst.getString(9));
            user.setType(rst.getString(10));
            user.setStatus(rst.getString(11));
        }
        return user;
    }
}
