package com.vehicleservice.vehicleservicereservationapp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Connection connection;

    //Establish database connection
    public static Connection getConnection(){

        if(connection == null){
            try{

                String dbUrl = "jdbc:mysql://51.132.137.223:3306/isec_assessment2";
                String dbUser = "isec";
                String dbPassword = "EUHHaYAmtzbv";

                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        return connection;
    }

    public static void closeConnection(){
        if(connection != null){
            try{
                connection.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }


}
