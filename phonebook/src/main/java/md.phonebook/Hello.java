package md.phonebook;

import md.ungureanu.ira.data.Contact;
import md.ungureanu.ira.data.ContactList;
import md.ungureanu.ira.data.DBConnection;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Path("/contacts")
public class Hello {

    @GET
    @Path("/all")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Contact> getContactsInJSON() throws Exception {

        ContactList contactList = new ContactList();
        contactList.importInArray();

        return contactList.contactList;
    }

    @Path("{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Contact getContactById(@PathParam("id") String id) throws Exception {
        System.out.println("Getting contact by ID: " + id);
        DBConnection con = new DBConnection("testDB", "practica", "OKdan96_gmail_com");
        con.connectToDB();

        Contact contact = new Contact(Integer.parseInt(id));
        contact.getContact(con.connect());

//        if (con != null) {
//            logger.info("Inside getContactById, returned: " + contact.getName());
//        } else {
//            logger.info("Inside getContactById, ID: " + id + ", NOT FOUND!");
//        }
        return contact;
    }


//    @POST
//    @Path("/post")
//    @Consumes(MediaType.APPLICATION_JSON)
//    public Response createTrackInJSON(Track track) {
//
//        String result = "Track saved : " + track;
//        return Response.status(201).entity(result).build();
//    }
}