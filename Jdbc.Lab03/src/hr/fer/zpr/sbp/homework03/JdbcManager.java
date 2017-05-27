/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.fer.zpr.sbp.homework03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author aelek
 */
public class JdbcManager {
    public static Connection openConnection (String url, String classname) {
        Connection conn = null;

        // ucitavanje i registriranje JDBC driver-a
        try {
            Class.forName(classname);
            System.out.println("JDBC driver je učitan i registriran.");
        } catch (ClassNotFoundException exception) {
            System.err.println("Pogreška: nije uspjelo "
                    + "učitavanje JDBC driver-a.");
            System.err.println(exception.getMessage());
            return null;
        }

        // uspostavljanje konekcije
        try {
            conn = DriverManager.getConnection(url);
            System.out.println("Konekcija je uspostavljena.");
        } catch (SQLException ex) {
            System.out.println("Pogreška: nije uspjelo "
                    + "uspostavljanje konekcije.");
            System.err.printf("%s %s%n", ex.getErrorCode(), ex.getMessage());
        }
        return conn;
    }
    
    public static ResultSet executeFunction (Connection connection,
            String function) throws SQLException {
         Statement stmt = connection.createStatement();
         return stmt.executeQuery("EXECUTE FUNCTION " + function + "()");
    }

    public static void executeProcedure (Connection connection, 
            String procedure) throws SQLException {
         Statement stmt = connection.createStatement();
         stmt.executeUpdate("EXECUTE PROCEDURE " + procedure + "()");
    }
}
