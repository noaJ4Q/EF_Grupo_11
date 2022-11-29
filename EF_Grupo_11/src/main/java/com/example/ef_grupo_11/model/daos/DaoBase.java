package com.example.ef_grupo_11.model.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoBase {

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        String host = "localhost";
        String db = "ef";
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://"+host+":3306/"+db;

        return DriverManager.getConnection(url, user, pass);
    }


}
