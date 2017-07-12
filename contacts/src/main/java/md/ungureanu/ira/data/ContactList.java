package md.ungureanu.ira.data;

import java.sql.*;
import java.util.ArrayList;

public class ContactList {
    public ArrayList<Contact> contactList = new ArrayList<Contact>();

    public void importInArray() throws Exception{
        Statement statement;
        ResultSet resultSet;
        DBConnection con = new DBConnection("testDB", "practica", "OKdan96_gmail_com");
        con.connectToDB();
        try {
            statement = con.connect().createStatement();
            resultSet = statement.executeQuery("SELECT * FROM contacts");

            while (resultSet.next()) {
                Contact contact = new Contact(resultSet.getInt("id"));

                contact.getContact(con.connect());
                System.out.println(contact);
                contactList.add(contact);
            }
        }
        catch (SQLException se){
            throw se;
        }
        catch (Exception e){
            throw e;
        }
        finally {
            con.close();
        }
    }
}
