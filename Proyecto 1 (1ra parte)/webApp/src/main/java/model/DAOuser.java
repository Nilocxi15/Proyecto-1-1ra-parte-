package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DAOuser extends connectDB {

    public users identify(users usr) throws Exception {
        users u = null;
        connectDB conn;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;

        String query = "SELECT * FROM users WHERE DPI ='" + usr.getDPI() + "'";

        conn = new connectDB();
        try {
            cn = conn.connect();
            st = cn.createStatement();
            rs = st.executeQuery(query);
            if (rs.next() == true) {
                u = new users();
                u.setDPI(usr.getDPI());
                u.setName(rs.getString("name"));
                u.setLastName(rs.getString("last_name"));
                u.setRol(rs.getString("rol"));
                u.setState(1);
            }
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (st != null && st.isClosed() == false) {
                st.close();
            }
            st = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return u;
    }
}
