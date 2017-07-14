package md.ungureanu.ira.data;


import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.Statement;

public class ContactTest {
    @Test
    public void testSaveContact() throws Exception {
        Contact newContact = new Contact("Daniel", "Surdu", "078060742", "okdan96@gmail.com");
        Assertions.assertEquals(0, newContact.getId());

        DBConnection con = new DBConnection("testDB", "practica", "OKdan96_gmail_com");
        con.connectToDB();
        Statement statement = con.connect().createStatement();
        statement.addBatch("DELETE FROM contacts");
        statement.addBatch("ALTER TABLE contacts AUTO_INCREMENT = 1");
        statement.executeBatch();

        newContact.saveContact(con.connect());
        Assertions.assertNotEquals(0, newContact.getId());
        con.close();
    }
    @Test
    public void testGetContact() throws Exception {
        Contact newContact = new Contact(1);
        DBConnection con = new DBConnection("testDB", "practica", "OKdan96_gmail_com");
        con.connectToDB();
        newContact.getContact(con.connect());
        Assertions.assertEquals("Daniel", newContact.getName());
        Assertions.assertEquals("Surdu", newContact.getSurname());
        Assertions.assertEquals("078060742", newContact.getNumber());
        Assertions.assertEquals("okdan96@gmail.com", newContact.getEmail());
    }
}