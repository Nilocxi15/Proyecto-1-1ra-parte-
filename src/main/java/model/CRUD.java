package model;

import java.util.List;

public interface CRUD {
    public List list();
    public users listUsers(String DPI);
    public boolean add(users usr);
    public boolean edit(users usr);
    public boolean delete(String DPI);
}
