package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private static final String URL = "jdbc:mysql://localhost:3306/gimnasio";
    private static final String USER = "root";
    private static final String PASSWORD = "Sena2026*";

    public static Connection getConexion() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("CONECTADO A: " + con.getCatalog());

        } catch (Exception e) {

            e.printStackTrace();

        }

        return con;
    }
}
