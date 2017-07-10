package md.ungureanu.ira.data;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private String dataBase;
    private String userName;
    private String password;
    private Connection connect;

    public DBConnection(String db, String user, String pass){
        dataBase = db;
        userName = user;
        password = pass;
    }

    public Connection connect() {
        return connect;
    }

    public Connection connectToDB() throws Exception {
        try{
            // This will load the MySQL driver, each DB has its own driver
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/" + dataBase, userName, password);
            return connect;
        }
        catch(Exception e){
            throw e;
        }
    }

    public void close() throws Exception {
        try {
            connect.close();
        } catch (Exception e) {
            throw e;
        }
    }
}
