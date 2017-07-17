package md.ungureanu.ira.data;
import java.sql.Statement;
import java.util.ArrayList;

public class Main {

    public static void main(String [] args) throws Exception{

        Contact newContact = new Contact("Daniel", "Surdu", "078060742", "okdan96@gmail.com");
        DBConnection con = new DBConnection("testDB", "practica", "OKdan96_gmail_com");
        con.connectToDB();

        newContact.saveContact(con.connect());

        con.close();
      }
}
