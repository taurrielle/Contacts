package md.ungureanu.ira.data;

import com.mysql.jdbc.PreparedStatement;
import java.sql.*;

//import com.fasterxml.jackson.annotation.JsonInclude;
//import com.fasterxml.jackson.annotation.JsonInclude.Include;
//
//@JsonInclude(Include.NON_EMPTY)
public class Contact {
    private int id;
    private String name;
    private String surname;
    private String number;
    private String email;

    public void setName(String cName){
        name = cName;
    }
    public void setSurname(String cSurname){
        surname = cSurname;
    }
    public void setNumber(String cNumber){
        number = cNumber;
    }
    public void setEmail(String cEmail){
        email = cEmail;
    }

    public int getId(){
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getEmail() {
        return email;
    }

    public String getNumber() {
        return number;
    }

    public Contact(String cName, String cSurname, String cNumber, String cEmail){
        name = cName;
        surname = cSurname;
        number = cNumber;
        email = cEmail;
    }

    public Contact (int cId){
        this.id = cId;
    }

    public Contact () {}



    public void saveContact(Connection connect) throws Exception {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Statement statement = null;
        int lastId = -1;
        try {
            preparedStatement = (PreparedStatement) connect.prepareStatement("SELECT name, surname FROM contacts WHERE name = ? AND surname = ?");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, surname);
            resultSet = preparedStatement.executeQuery();

            if(resultSet.next()) {
                System.out.println("This contact already exists.");
            }
            else {
                preparedStatement = (PreparedStatement) connect.prepareStatement("INSERT INTO contacts VALUES (default, ?, ?, ?, ?)");
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, surname);
                preparedStatement.setString(3, number);
                preparedStatement.setString(4, email);
                preparedStatement.executeUpdate();

                System.out.println("Contact has been registered.");
            }
            statement = connect.createStatement();
            resultSet = statement.executeQuery("SELECT LAST_INSERT_ID()");

            if (resultSet.next()) {
                lastId = resultSet.getInt(1);
            } else {
                System.out.println("Something went wrong. No id");
            }
            this.id = lastId;
        }
        catch (SQLException se) {
            throw se;
        }
        catch (Exception e) {
            throw e;
        }
        finally {
            if (preparedStatement != null) {preparedStatement.close();}
            if (resultSet != null) {resultSet.close();}
            if (statement != null) {statement.close();}
        }
    }

    public void getContact(Connection connect) throws Exception {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = (PreparedStatement) connect.prepareStatement("SELECT * FROM contacts WHERE id = ?");
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                id = resultSet.getInt("id");
                name = resultSet.getString("name");
                surname = resultSet.getString("surname");
                number = resultSet.getString("number");
                email = resultSet.getString("email");
            }
        }
        catch(SQLException se){
            throw se;
        }
        catch (Exception e) {
            throw e;
        }
        finally {
            if(preparedStatement != null){
                preparedStatement.close();
            }
            if(resultSet != null){
                resultSet.close();
            }
        }
    }
}
