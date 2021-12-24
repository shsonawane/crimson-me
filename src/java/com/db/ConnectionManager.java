package com.db;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("session") 
public class ConnectionManager {

    private Connection conn;

    public ConnectionManager() {
        setConn();
    }

    public Connection getConn() {
        if(conn == null){
            setConn();
        }
        return conn;
    }

    private void setConn() {
        try {
            String dbName = "crimson";
            String userName = "root";
            String password = "0981";
            String hostname = "localhost";
            String port = "3306";
            String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password + "&autoReconnect=true&useSSL=false";
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            System.out.println("Getting remote connection with connection string from environment variables.");
            conn = (Connection) DriverManager.getConnection(jdbcUrl);
            System.out.println("Remote connection successful.");
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
