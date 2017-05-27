/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.fer.zpr.sbp.homework03;

import static hr.fer.zpr.sbp.homework03.EvidentirajUlaz.executeStatement;
import java.sql.Connection;
import java.sql.SQLException;
import static hr.fer.zpr.sbp.homework03.EvidentirajUlaz.handleExceptions;

/**
 *
 * @author aelek
 */
public class Zad3a {
    public static void evidentirajUlaz(int dogadajId, String url, String classname){
        try (Connection conn = JdbcManager.openConnection(url,classname)) {
            conn.setAutoCommit(false);
            executeStatement(conn, 
                    "INSERT INTO Ulaz (IdDogadaj) VALUES (?);", 
                    dogadajId);
            executeStatement(conn, 
                    "UPDATE Dogadaj SET BrGledatelja = BrGledatelja + 1 " +
                    "WHERE Id = ?;", 
                    dogadajId);           
            conn.commit();
        }
        catch (SQLException ex) {
            handleExceptions(ex);
        }
    }
}
