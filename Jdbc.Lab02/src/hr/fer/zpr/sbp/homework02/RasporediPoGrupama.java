/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.fer.zpr.sbp.homework02;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author aelek
 */
public class RasporediPoGrupama {
    
    public static void main(String argv[]) {
        
        String url = "jdbc:informix-sqli://sbp.edu:1526/sbpdz2" 
                   + ":INFORMIXSERVER=sbp;"
                   + "DB_LOCALE=hr_hr.utf8;CLIENT_LOCALE=hr_hr.utf8;" 
                   + "user=horvat;password=horvat";

        try (Connection conn = JdbcManager.openConnection(url)) {
            System.out.println("Pokretanje procedure rasporediPoGrupama.");
            JdbcManager.executeProcedure(conn, "rasporediPoGrupama");
        }
        catch (SQLException ex) {
            System.err.printf("%s %s%n", ex.getErrorCode(), ex.getMessage());
        }
   }
}
