package md.ungureanu.ira.data;
import java.sql.Statement;
import java.util.ArrayList;

public class Main {

    public static void main(String [] args) throws Exception{

        DBConnection con = new DBConnection("testDB", "practica", "OKdan96_gmail_com");
        con.connectToDB();
        Contact newContact = new Contact("adsfkjsal", "Surdu", "078060742", "okdan96@gmail.com");
        newContact.setId(35);
        newContact.editContact(con.connect());
        System.out.print(newContact.getName());
        con.close();
      }
}
