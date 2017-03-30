/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.fer.zpr.sbp.homework02;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author aelek
 */
public class StudentiPoGrupama {
    
    public static void main(String argv[]) {

        String url = "jdbc:informix-sqli://sbp.edu:1526/sbpdz2" 
                   + ":INFORMIXSERVER=sbp;"
                   + "DB_LOCALE=hr_hr.utf8;CLIENT_LOCALE=hr_hr.utf8;" 
                   + "user=horvat;password=horvat";

        try (Connection conn = JdbcManager.openConnection(url)) {
            System.out.println("Pokretanje funkcije studentipogrupama.");
            while (true) {
                try {
                    ResultSet result = JdbcManager
                            .executeFunction(conn, "studentiPoGrupama");
                    while(result.next()) {
                        String jmbag = result.getString("r_jmbag");
                        String prez = result.getString("r_prez").trim();
                        String ime = result.getString("r_ime").trim();
                        String grupa = result.getString("r_curr").trim();
                        System.out.printf("%s %s %s %s%n",grupa,jmbag,prez,ime);
                    }
                    System.out.println();
                } catch (SQLException ex) {
                    System.err.printf("%s %s%n", ex.getErrorCode(), 
                                                 ex.getMessage());
                    break;
                }
            }
        }
        catch (SQLException ex) {
            System.err.printf("%s %s%n", ex.getErrorCode(), ex.getMessage());
        }
   }
}
