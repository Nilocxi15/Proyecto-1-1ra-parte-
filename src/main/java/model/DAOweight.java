package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOweight {

    Connection conn;
    connectDB cn = new connectDB();
    PreparedStatement ps;
    ResultSet rs;

    public List list() {
        ArrayList<weight> list = new ArrayList<>();
        String query = "SELECT * FROM prices";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                weight wt = new weight();
                wt.setWeight(rs.getInt("weight"));
                wt.setPrice(rs.getFloat("price"));
                list.add(wt);
            }
        } catch (Exception e) {
        }

        return list;
    }

}
