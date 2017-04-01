package hr.fer.zpr.sbp.homework02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class TestProc {
   
   public static void main(String argv[]) {
      String jmbag = argv[0];
      
      Connection connection = otvoriKonekciju();
      
      try {
         Statement stmt = connection.createStatement();
         stmt.executeUpdate("EXECUTE PROCEDURE upisStudenta('" + jmbag + "')");
         System.out.println("Procedura je izvršena.");
         connection.close();
      }
      catch (SQLException exception) {
         System.out.println(exception.getErrorCode() + " " + exception.getMessage());
      }
   }

   private static Connection otvoriKonekciju () {
      Connection conn = null;
      // sastavljanje JDBC URL:
      //                                       ip_adresa:port/baza
      String url = "jdbc:informix-sqli://sbp.edu:1526/sbpdz2" 
            + ":INFORMIXSERVER=sbp;DB_LOCALE=hr_hr.utf8;CLIENT_LOCALE=hr_hr.utf8;" 
            + "user=horvat;password=horvat";
      
      // u�itavanje i registriranje Informix JDBC driver-a
      try {
         Class.forName("com.informix.jdbc.IfxDriver");
         System.out.println("Informix JDBC driver je učitan i registriran.");
      } catch (ClassNotFoundException exception) {
         System.out.println("Pogreška: nije uspjelo učitavanje Informix JDBC driver-a.");
         System.out.println(exception.getMessage());
         return;
      }
      
      // uspostavljanje konekcije
      try {
         conn = DriverManager.getConnection(url);
         System.out.println("Konekcija je uspostavljena.");
      } catch (SQLException exception) {
         System.out.println("Pogreška: nije uspjelo uspostavljanje konekcije.");
         System.out.println(exception.getErrorCode() + " " + exception.getMessage());
         return;
      }
      return conn;
   }
}
