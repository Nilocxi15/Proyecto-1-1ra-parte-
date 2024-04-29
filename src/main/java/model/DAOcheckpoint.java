package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOcheckpoint {

    Connection conn;
    connectDB cn = new connectDB();
    PreparedStatement ps;
    ResultSet rs;

    public List list() {
        ArrayList<checkpoint> list = new ArrayList<>();
        String query = "SELECT * FROM checkpoints";

        try {
            conn = cn.connect();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                checkpoint ch = new checkpoint();
                ch.setID(rs.getInt("ID"));
                ch.setCheckpointOrder(rs.getInt("checkpoint_order"));
                ch.setRoute(rs.getInt("route"));
                ch.setAddress(rs.getString("address"));
                ch.setLimitQueue(rs.getInt("limit_queue"));
                ch.setQueuePackages(rs.getInt("queue_packages"));
                ch.setOperationFee(rs.getFloat("operation_fee"));
                ch.setGlobalFee(rs.getFloat("global_fee"));
                
                list.add(ch);
            }
        } catch (Exception e) {
        }

        return list;
    }
}
