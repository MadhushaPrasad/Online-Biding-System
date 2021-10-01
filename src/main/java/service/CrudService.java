package service;

import java.sql.SQLException;
import java.util.ArrayList;

public interface CrudService<S, ID> extends SuperService {
    public boolean add(S s) throws ClassNotFoundException, SQLException;

    public boolean update(S s) throws ClassNotFoundException, SQLException;

    public boolean delete(ID id) throws ClassNotFoundException, SQLException;

    public S search(ID id) throws ClassNotFoundException, SQLException;

    public ArrayList<S> getAll() throws ClassNotFoundException, SQLException;
}
