/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hr.fer.zpr.sbp.homework03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class EvidentirajUlaz {
    
    public static void main(String argv[]) {
        String errMsg = "Nacin pozivanja: Jdbc.Lab03 <informix|postgres> <zadatak> <dogadajId>";
        
        if (argv.length < 3) {
            System.err.println(errMsg);
            return;
        }
        
        String classname;
        String url;
        if (argv[0].toLowerCase().equals("informix")) {
            classname = "com.informix.jdbc.IfxDriver";
            url = "jdbc:informix-sqli://sbp.edu:1526/lab3" 
                   + ":INFORMIXSERVER=sbp;"
                   + "DB_LOCALE=hr_hr.utf8;CLIENT_LOCALE=hr_hr.utf8;" 
                   + "user=informix;password=informix";
        } else if (argv[0].toLowerCase().equals("postgres")) {
            classname = "org.postgresql.Driver";
            url = "jdbc:postgresql://sbp.edu:5432/lab3?user=postgres&password=postgres";
        } else {
            System.err.println(errMsg);
            return;
        }
        
        String zadatak = argv[1];
        int dogadajId;
        try {
            dogadajId = Integer.parseInt(argv[2]);
        } catch (NumberFormatException e) {
            System.err.println(errMsg);
            return;
        }
        
        switch(zadatak) {
            case ("3a"):
                Zad3a.evidentirajUlaz(dogadajId,url,classname);
                break;
            case ("3c"):
                Zad3c.evidentirajUlaz(dogadajId,url,classname);
                break;
            case ("3d"):
                Zad3d.evidentirajUlaz(dogadajId,url,classname);
                break;
            case ("4a"):
                Zad4a.evidentirajUlaz(dogadajId,url,classname);
                break;
            case ("4c"):
                Zad4c.evidentirajUlaz(dogadajId,url,classname);
                break;
            default:
                System.err.println("Neispravan zadatak.");
                break;
        }
    }
  
    public static void executeStatement(Connection conn, String text, int param) 
            throws SQLException {
        System.out.println(text.replaceFirst("\\?", Integer.toString(param)));
        PreparedStatement pstmt = conn.prepareStatement(text);
        pstmt.setInt(1, param);
        pstmt.executeUpdate();
    }
    
    public static void executeStatement(Connection conn, String text) 
            throws SQLException {
        System.out.println(text);
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(text);
    }

    public static void handleExceptions(SQLException ex) {
        if (ex.getMessage().toLowerCase().contains("chkkapacitet"))
            {
                System.err.printf("ERROR %s: Premasen kapacitet dogadaja!%n", 
                  ex.getErrorCode());
            }
            else 
                System.err.printf("ERROR %s: %s%n", ex.getErrorCode(), ex.getMessage());
    }
}
