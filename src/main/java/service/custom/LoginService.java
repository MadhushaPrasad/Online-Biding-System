package service.custom;

import model.User;
import service.SuperService;

import java.sql.SQLException;
import java.util.ArrayList;

public interface LoginService extends SuperService {
    public boolean checkUser(String email,String password) throws SQLException, ClassNotFoundException;
    public User checkUserType(String email, String password) throws SQLException, ClassNotFoundException;
}
