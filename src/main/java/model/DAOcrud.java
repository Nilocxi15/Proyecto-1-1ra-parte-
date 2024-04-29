package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOcrud {

    Connection conn;
    connectDB cn = new connectDB();
    PreparedStatement ps;
    ResultSet rs;

    public List list() {
        ArrayList<users> list = new ArrayList<>();
        String query = "SELECT * FROM users";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                users usr = new users();
                usr.setDPI(rs.getString("DPI"));
                usr.setName(rs.getString("name_user"));
                usr.setLastName(rs.getString("last_name"));
                usr.setRol(rs.getString("rol"));
                usr.setState(rs.getInt("state"));
                if (usr.getState() == 1) {
                    usr.setStateString("Activo");
                } else {
                    usr.setStateString("Inactivo");
                }
                list.add(usr);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean validation(String cl) {
        boolean flag = false;
        String query = "SELECT DPI from users where DPI=?";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, cl);
            rs = ps.executeQuery();

            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {
        }

        return flag;
    }

    public boolean add(users data) {

        boolean flag = false;

        String query = "INSERT INTO users (DPI, name_user, last_name, rol, state) values('" + data.getDPI()
                + "', '" + data.getName() + "', '" + data.getLastName() + "', '" + data.getRol() + "', 1)";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();

        } catch (Exception e) {
        }

        return flag;
    }

    public void update(String DPI, String state) {
        String query = "UPDATE users SET state = '" + state + "' WHERE DPI = '" + DPI + "'";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(String DPI) {
        String query = "DELETE FROM users WHERE DPI = '" + DPI + "'";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
