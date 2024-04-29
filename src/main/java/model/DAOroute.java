package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOroute {

    Connection conn;
    connectDB cn = new connectDB();
    PreparedStatement ps;
    ResultSet rs;

    public List list() {
        ArrayList<route> list = new ArrayList<>();
        String query = "SELECT * FROM routes";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                route rt = new route();
                rt.setID(rs.getInt("ID"));
                rt.setInitialAddress(rs.getString("initial_address"));
                rt.setEndAddress(rs.getString("end_address"));
                rt.setDestinationFee(rs.getFloat("destination_fee"));
                rt.setGlobalFee(rs.getFloat("global_fee"));
                rt.setState(rs.getInt("state"));

                if (rt.getState() == 1) {
                    rt.setStateString("Activa");
                } else {
                    rt.setStateString("Inactiva");
                }

                list.add(rt);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean validation(String cl) {
        boolean flag = false;
        String query = "SELECT id FROM routes WHERE id=?";

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

    public void add(route data) {
        String query = "INSERT INTO routes (initial_address, end_address, destination_fee, global_fee, state) values("
                + data.getInitialAddress() + "', '" + data.getEndAddress() + "', '" + data.getDestinationFee() + "', '"
                + data.getGlobalFee() + "', 1";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
