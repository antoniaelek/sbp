/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.fer.zpr.sbp.homework03;


import static hr.fer.zpr.sbp.homework03.EvidentirajUlaz.executeStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author aelek
 */
public class Zad4a {
    public static void evidentirajUlaz(int dogadajId, String url, String classname){
        try (Connection conn = JdbcManager.openConnection(url,classname)) {
            executeStatement(conn, 
                    "EXECUTE PROCEDURE EvidentirajUlaz(?);", 
                    dogadajId);
            
        }
        catch (SQLException ex) {
            System.err.printf("%s %s%n", ex.getErrorCode(), ex.getMessage());
        }
    } 
}
