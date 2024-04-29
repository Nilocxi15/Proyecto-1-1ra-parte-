package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAOuser implements validate {

    Connection conn;
    connectDB cn = new connectDB();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    int rol = 0;
    String name;

    @Override
    public int validate(users usr) {
        String query = "SELECT * FROM users WHERE DPI =?";
        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            ps.setString(1, usr.getDPI());
            rs = ps.executeQuery();            

            while (rs.next()) {
                r = r + 1;
                usr.setDPI(rs.getString("DPI"));
                usr.setRol(rs.getString("rol"));
                usr.setName(rs.getString("name_user"));
                usr.setLastName(rs.getString("last_name"));
                usr.setState(rs.getInt("state"));
            }

            if (usr.getState() == 1) {
                switch (usr.getRol()) {
                    case "administrador":
                        rol = 1;
                        break;
                    case "operador":
                        rol = 2;
                        break;
                    case "recepcionista":
                        rol = 3;
                        break;
                    default:
                        throw new AssertionError();
                }

                if (r == 1) {
                    name = usr.getName() + " " + usr.getLastName();
                    return 1;
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
    }

    public String getName() {
        return name;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public void setR(int r) {
        this.r = r;
    }
}
