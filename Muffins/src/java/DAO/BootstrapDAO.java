/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODEL.Student;
import UTILITY.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * Data Access Object for Bootstrapping data into the system. 
 */
public class BootstrapDAO {

    /*
    ==============================================================
        6 METHODS FOR 6 CSV FILES, TO INSERT DATA INTO 6 TABLES
    ==============================================================
     */
    
    /**
    *
    * Batch processes the Students from the given parameter, students, into the BIOS System. 
    * @param students list of Students to be placed in the database
    * 
    * @return successfulRows
    */
    public static int batchProcessStudent(String[][] students) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        int[] count = null;

        try {

            //Get connection
            conn = ConnectionManager.getConnection();

            // Create SQL statement
            String SQL = "INSERT INTO Student (userid, password, name, school, eDollar) "
                    + "VALUES(?, ?, ?, ?, ?)";

            // Create PrepareStatement object
            pstmt = conn.prepareStatement(SQL);

            //Set auto-commit to false
            conn.setAutoCommit(false);

            for (String[] student : students) {
                pstmt.setString(1, student[0]);
                pstmt.setString(2, student[1]);
                pstmt.setString(3, student[2]);
                pstmt.setString(4, student[3]);
                pstmt.setString(5, student[4]);
                pstmt.addBatch();
            }

            //Create an int[] to hold returned values
            count = pstmt.executeBatch();

            //Explicitly commit statements to apply changes
            conn.commit();
            
        } catch (SQLException e) {

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }

            } catch (SQLException e) {

            }
        }

        int successfulRows = 0;
        if (count != null) {
            for (int i : count) {
                if (i >= 0) {
                    successfulRows++;
                }
            }
        }

        return successfulRows;
    }

    /**
    *
    * Batch processes the Courses from the given parameter, courses, into the BIOS System.
    * @param courses list of Courses to be placed into the database
    * 
    * @return successfulRows
    */
    public static int batchProcessCourse(String[][] courses) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        int[] count = null;

        try {

            //Get connection
            conn = ConnectionManager.getConnection();

            // Create SQL statement
            String SQL = "INSERT INTO Course (course_id, school, title, description, exam_date, exam_start, exam_end) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?)";

            // Create PrepareStatement object
            pstmt = conn.prepareStatement(SQL);

            //Set auto-commit to false
            conn.setAutoCommit(false);

            for (String[] course : courses) {
                pstmt.setString(1, course[0]);
                pstmt.setString(2, course[1]);
                pstmt.setString(3, course[2]);
                pstmt.setString(4, course[3]);
                pstmt.setString(5, course[4]);
                pstmt.setString(6, course[5]);
                pstmt.setString(7, course[6]);
                pstmt.addBatch();
            }

            //Create an int[] to hold returned values
            count = pstmt.executeBatch();

            //Explicitly commit statements to apply changes
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }

            } catch (SQLException e) {

            }
        }

        int successfulRows = 0;
        if (count != null) {
            for (int i : count) {
                if (i >= 0) {
                    successfulRows++;
                }
            }
        }

        return successfulRows;
    }

    /**
    *
    * Batch processes the Courses that are completed by the students from the given parameter, courseCompleted, into the BIOS System. 
    * @param courseCompleted list of Courses Completed to be placed into the database 
    * 
    * @return successfulRows
    */
    public static int batchProcessCourseCompleted(String[][] courseCompleted) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        int[] count = null;

        try {

            //Get connection
            conn = ConnectionManager.getConnection();

            // Create SQL statement
            String SQL = "INSERT INTO Course_completed (userid, code) "
                    + "VALUES(?, ?)";

            // Create PrepareStatement object
            pstmt = conn.prepareStatement(SQL);

            //Set auto-commit to false
            conn.setAutoCommit(false);

            for (String[] cc : courseCompleted) {
                pstmt.setString(1, cc[0]);
                pstmt.setString(2, cc[1]);
                pstmt.addBatch();
            }

            //Create an int[] to hold returned values
            count = pstmt.executeBatch();

            //Explicitly commit statements to apply changes
            conn.commit();

        } catch (SQLException e) {

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }

            } catch (SQLException e) {

            }
        }

        int successfulRows = 0;
        if (count != null) {
            for (int i : count) {
                if (i >= 0) {
                    successfulRows++;
                }
            }
        }

        return successfulRows;

    }

    /**
    *
    * Batch processes the pre-requisites of the Courses from the given parameter, prereqs, into the BIOS System. 
    * @param prereqs list of Prerequisites to be placed into the database
    * 
    * @return successfulRows
    */
    public static int batchProcessPrerequisite(String[][] prereqs) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int[] count = null;

        try {

            //Get connection
            conn = ConnectionManager.getConnection();

            // Create SQL statement
            String SQL = "INSERT INTO Prerequisite (course_id, prerequisite) "
                    + "VALUES(?, ?)";

            // Create PrepareStatement object
            pstmt = conn.prepareStatement(SQL);

            //Set auto-commit to false
            conn.setAutoCommit(false);

            for (String[] prereq : prereqs) {
                pstmt.setString(1, prereq[0]);
                pstmt.setString(2, prereq[1]);
                pstmt.addBatch();
            }

            //Create an int[] to hold returned values
            count = pstmt.executeBatch();

            //Explicitly commit statements to apply changes
            conn.commit();

        } catch (SQLException e) {

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }

            } catch (SQLException e) {

            }
        }

        int successfulRows = 0;
        if (count != null) {
            for (int i : count) {
                if (i >= 0) {
                    successfulRows++;
                }
            }
        }

        return successfulRows;
    }

    /**
    *
    * Batch processes the Sections from the given parameter, sections, into the BIOS System. 
    * @param sections list of Sections to be placed into the database
    * 
    * @return successfulRows
    */
    public static int batchProcessSection(String[][] sections) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int[] count = null;

        try {

            //Get connection
            conn = ConnectionManager.getConnection();

            // Create SQL statement
            String SQL = "INSERT INTO Section (course_id, section, day, start, end, instructor, venue, size, vacancy) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?,?)";

            // Create PrepareStatement object
            pstmt = conn.prepareStatement(SQL);

            //Set auto-commit to false
            conn.setAutoCommit(false);

            for (String[] section : sections) {
                pstmt.setString(1, section[0]);
                pstmt.setString(2, section[1]);
                pstmt.setInt(3, Integer.parseInt(section[2]));
                pstmt.setString(4, section[3]);
                pstmt.setString(5, section[4]);
                pstmt.setString(6, section[5]);
                pstmt.setString(7, section[6]);
                pstmt.setInt(8, Integer.parseInt(section[7]));
                pstmt.setInt(9, Integer.parseInt(section[7]));
                pstmt.addBatch();
            }

            //Create an int[] to hold returned values
            count = pstmt.executeBatch();

            //Explicitly commit statements to apply changes
            conn.commit();

        } catch (SQLException e) {

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }

            } catch (SQLException e) {

            }
        }

        int successfulRows = 0;
        if (count != null) {
            for (int i : count) {
                if (i >= 0) {
                    successfulRows++;
                }
            }
        }

        return successfulRows;
    }
  
    /**
    *
    * Batch processes the Bids from the given parameter, bids, into the BIOS System.
    * @param bids list of Bids to be placed into the database 
    * 
    * @return successfulRows
    */
    public static int batchProcessBids(String[][] bids) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        int[] count = null;

        try {

            //Get connection
            conn = ConnectionManager.getConnection();

            // Create SQL statement
            String SQL = "INSERT INTO Bid (userid, amount, code, section) "
                    + "VALUES(?, ?, ?, ?)";

            // Create PrepareStatement object
            pstmt = conn.prepareStatement(SQL);
            
            //Set auto-commit to false
            conn.setAutoCommit(false);
            
            for (String[] bid : bids) { 
                pstmt.setString(1, bid[0]);
                pstmt.setDouble(2, Double.parseDouble(bid[1]));
                pstmt.setString(3, bid[2]);
                pstmt.setString(4, bid[3]);
                pstmt.addBatch();
                
                //deduct edollar
                Student stud = StudentDAO.getStudentByUsername(bid[0]);
                double amount = stud.getEDollar();
                amount -= Double.parseDouble(bid[1]);
                StudentDAO.updateEDollar(bid[0],amount);
                
            }

            //Create an int[] to hold returned values
            count = pstmt.executeBatch();

            //Explicitly commit statements to apply changes
            conn.commit();

        } catch (SQLException e) {

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }

            } catch (SQLException e) {

            }
        }

        int successfulRows = 0;
        if (count != null) {
            for (int i : count) {
                if (i >= 0) {
                    successfulRows++;
                }
            }
        }

        return successfulRows;
    }

    /**
    *
    * Remove all the data in the database. 
    */
    public static void wipeTables() {

        Connection conn = null;
        Statement stmt = null;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.createStatement();
            
            String clearEnrolledSQL = "delete from section_student";
            String clearBidSQL = "delete from bid";
            String clearCourseCompletedSQL = "delete from course_completed";
            String clearPrerequisiteSQL = "delete from prerequisite";
            String clearSectionSQL = "delete from section";
            String clearCourseSQL = "delete from course";
            String clearStudentSQL = "delete from student";
            String clearBiddingRound = "delete from bidding_round";

            if (stmt != null) {
                stmt.execute(clearEnrolledSQL);
                stmt.execute(clearBidSQL);
                stmt.execute(clearCourseCompletedSQL);
                stmt.execute(clearPrerequisiteSQL);
                stmt.execute(clearSectionSQL);
                stmt.execute(clearCourseSQL);
                stmt.execute(clearStudentSQL);
                stmt.execute(clearBiddingRound);
            }
        } catch (SQLException ex) {

        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (stmt != null) {
                    stmt.close();
                }

            } catch (SQLException e) {

            }
        }

    }
    
    /**
    *
    * starts the BiddingRound of the BIOS System 
    */
    public static void startBiddingRound(){

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();

            //insert round to database
            stmt = conn.prepareStatement("Insert into bidding_round values (?, ?, ?)");

            //set roundid (always zero)
            stmt.setInt(1, 0);

            //set round no
            stmt.setInt(2, 1);
            
            //set status
            stmt.setString(3,"ongoing");

            int numRecordsUpdated = stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            try {
                if (conn != null) {
                    conn.close();

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
