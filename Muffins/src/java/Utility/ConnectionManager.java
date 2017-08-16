/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JJAY
 */
public class ConnectionManager {
    private static final String PROPS_FILENAME = "/connection.properties";
    private static String dbUser;
    private static String dbPassword;
    private static String dbURL;

    static {
        // grab environment variable
        String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
        if (host != null) {
            // this is production environment
            // obtain database connection properties from environment variables
            String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
            String dbName = System.getenv("OPENSHIFT_APP_NAME");
            dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
            dbPassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");

            dbURL = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useUnicode=true&characterEncoding=UTF-8";

        } else {
            // this is development environment
            // obtain database connection properties from properties file

            try {
                // Retrieve properties from connection.properties via the CLASSPATH
                // WEB-INF/classes is on the CLASSPATH
                InputStream is = ConnectionManager.class.getResourceAsStream(PROPS_FILENAME);
                Properties props = new Properties();
                props.load(is);

                // load database connection details
                host = props.getProperty("db.host");
                String port = props.getProperty("db.port");
                String dbName = props.getProperty("db.name");
                dbUser = props.getProperty("db.user");
                
                // grab environment variable to check if we are on production environment
                String username = System.getProperty("os.name");
                if (username.equals("Linux")) {
                    // in production environment, use aws.db.password
                    dbPassword = props.getProperty("aws.db.password");
                } else {
                    // in local environment, use db.password
                    dbPassword = props.getProperty("db.password");
                }

                dbURL = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useUnicode=true&characterEncoding=UTF-8";
            } catch (Exception ex) {
                // unable to load properties file
                String message = "Unable to load '" + PROPS_FILENAME + "'.";

                System.out.println(message);
                Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
                throw new RuntimeException(message, ex);
            }

        }

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            // unable to load properties file
            String message = "Unable to find JDBC driver for MySQL.";

            System.out.println(message);
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, message, ex);
            throw new RuntimeException(message, ex);
        }
    }

    /**
     * Method used to Get a database connection object.
     *
     * @return Connection object to the database.
     * @throws SQLException This method throws an SQLException if the JDBC driver cannot be loaded
     */
    public static Connection getConnection() throws SQLException {
        Connection conn = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");

            System.out.println("CONN:" + dbURL);
            conn = DriverManager
                    .getConnection(dbURL, dbUser, dbPassword);
        } catch (ClassNotFoundException ex) {
            String msg = "Unable to load MySQL JDBC Driver.";

            // Note that I'm using Logger as per default.
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.SEVERE, msg, ex);

            throw new RuntimeException(msg, ex);
        }
        return conn;
    }

    /**
     * Method used to Close the given connection, statement and resultset
     *
     * @param conn the connection object to be closed
     * @param stmt the statement object to be closed
     * @param rs the resultSet object to be closed
     */
    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.WARNING,
                    "Unable to close ResultSet", ex);
        }

        close(conn, stmt);
    }

    /**
     * Method used to Close the given connection, statement
     *
     * @param conn the connection object to be closed
     * @param stmt the statement object to be closed
     */
    public static void close(Connection conn, Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.WARNING,
                    "Unable to close Statement", ex);
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionManager.class.getName()).log(Level.WARNING,
                    "Unable to close Connection", ex);
        }
    }

    /**
     * Method used to read Openshift Database Properties
     *
     * @return boolean a boolean if host is Openshift, true = is Openshift and
     * properties are set false = is not Openshift and properties are not set
     */
    private static boolean readOpenshiftDatabaseProperties() {
        // grab environment variable
        String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");

        if (host == null) {
            return false;
        }
        // this is production environment
        // obtain database connection properties from environment variables
        String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
        String dbName = System.getenv("OPENSHIFT_APP_NAME");
        dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        dbPassword = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");

        dbURL = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useUnicode=true&characterEncoding=UTF-8";
        return true;
    }

}
