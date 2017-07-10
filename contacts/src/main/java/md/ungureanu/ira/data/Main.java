package md.ungureanu.ira.data;
import java.util.ArrayList;

public class Main {

    public static void main(String [] args) throws Exception{
        ContactList contactList = new ContactList();
        contactList.importInArray();

        for (Contact value : contactList.contactList) {
            System.out.println(value);
        }
        System.out.println(contactList.contactList.get(0).getEmail());

        System.out.println(contactList.contactList.get(0).getClass().getName());
      }
}
