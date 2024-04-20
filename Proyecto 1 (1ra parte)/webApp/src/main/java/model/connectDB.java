package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectDB {

    public Connection connect() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Conexion con la base de datos
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp", "root", "admin");
            System.out.println("Connection to MySQL has been established.");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }
}
