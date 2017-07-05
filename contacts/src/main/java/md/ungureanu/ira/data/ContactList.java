package md.ungureanu.ira.data;

import java.sql.*;
import java.util.ArrayList;

public class ContactList {
    public ArrayList<Contact> contactList = new ArrayList<Contact>();

    public void importInArray(Connection connect) throws Exception{
        Statement statement;
        ResultSet resultSet;
        try {
            statement = connect.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM contacts");

            while (resultSet.next()) {
                Contact contact = new Contact(resultSet.getInt("id"));

                contact.getContact(connect);
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

            connect.close();
        }
    }


}
