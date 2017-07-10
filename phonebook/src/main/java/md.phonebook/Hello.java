package md.phonebook;

import md.ungureanu.ira.data.Contact;
import md.ungureanu.ira.data.ContactList;
import md.ungureanu.ira.data.DBConnection;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Path("/hello")
public class Hello {

    // This method is called if TEXT_PLAIN is request
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String sayPlainTextHello() {
        return "Hello Jersey";
    }

    @GET
    @Path("/get")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Contact> getTrackInJSON() throws Exception {

        ContactList contactList = new ContactList();
        contactList.importInArray();

        return contactList.contactList;

//        Track track = new Track();
//        track.setTitle("Enter Sandman");
//        track.setSinger("Metallica");
//        return track;
    }

    @POST
    @Path("/post")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createTrackInJSON(Track track) {

        String result = "Track saved : " + track;
        return Response.status(201).entity(result).build();
    }
}