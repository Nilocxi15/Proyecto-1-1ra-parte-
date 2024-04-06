package logic.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connection {

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

    public void insert(String query) {
        System.out.println("insert query: " + query);
        Connection conn = this.connect();
        try {
            Statement stmt = conn.createStatement();
            // Execute a query
            stmt.executeUpdate(query);
            System.out.println("Inserted records into the table...");
            conn.close();
        } catch (SQLException e) {
            System.out.println("An error has been ocurred, " + e.getMessage());
        }
    }

    public void delete(String query) {
        System.out.println("insert query: " + query);
        Connection conn = this.connect();
        try {
            Statement stmt = conn.createStatement();
            // Execute a query
            stmt.executeUpdate(query);
            System.out.println("Deleted records from the table...");
            conn.close();
        } catch (SQLException e) {
            System.out.println("An error has been ocurred, " + e.getMessage());
        }
    }

    public void update(String query) {
        System.out.println("insert query: " + query);
        Connection conn = this.connect();
        try {
            Statement stmt = conn.createStatement();
            // Execute a query
            stmt.executeUpdate(query);
            System.out.println("Updated records into the table...");
            conn.close();
        } catch (SQLException e) {
            System.out.println("An error has been ocurred, " + e.getMessage());
        }
    }

}
