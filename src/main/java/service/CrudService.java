package service;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CrudService<S, ID> extends SuperService {
    boolean add(S s) throws ClassNotFoundException, SQLException;

    boolean update(S s) throws ClassNotFoundException, SQLException;

    boolean delete(ID id) throws ClassNotFoundException, SQLException;

    S search(ID id) throws ClassNotFoundException, SQLException;

    ArrayList<S> getAll() throws ClassNotFoundException, SQLException;
}
