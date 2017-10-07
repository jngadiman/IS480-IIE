/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLETS;

import com.opencsv.CSVReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hui Min
 */
@WebServlet(name = "bootstrapServlet", urlPatterns = {"/bootstrapServlet"})
public class bootstrapServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //arraylist of the csv files in folder
        ArrayList<String> csvList = (ArrayList<String>) request.getAttribute("csvList");

        //instantiates a hashmap to store key and value
        //key being the name of the file, value being the path
        HashMap<String, String> csvHash = new HashMap<String, String>();

        //goes through every csv in the arraylist, and store them into the hashmap
        //using substring, we get the name of the file to set as key
        //the value will be the path itself
        //this way we can retrieve the filepath when we want them
        //if there had been additional csv files uploaded by user, it does not matter
        //because we will only be calling the 6 that we need from the hashmap
        //for example <Key:"student.csv" Value:"......build/web/data/student.csv"> 
        for (String path : csvList) {
            String fileName = path.substring(path.lastIndexOf(File.separator) + 1);
            csvHash.put(fileName, path);
        }


        /*
        ==========================================================
            WIPING ALL THE TABLES
        ==========================================================
         */
        BootstrapDAO.wipeTables();

        /*
        ==========================================================
            READING OF STUDENT CSV
        ==========================================================
         */
        String studentCSV = csvHash.get("student.csv"); //getting csv filepath from hashmap
        CSVReader studentReader = new CSVReader(new FileReader(studentCSV)); //using CSVReader to read csv
        TreeMap<Integer, ArrayList<String>> invalidStudents = new TreeMap<>(); //stores invalid rows to be displayed
        ArrayList<String[]> validStudents = new ArrayList<>(); //stores valid rows to be passed to DAO

        String[] student;
        int studentRowNumber = 1;

        student = studentReader.readNext(); //skips the header row

        while ((student = studentReader.readNext()) != null) {
            // nextLine[] is an array of values from the csv file
            ArrayList<String> errors = BootstrapValidator.validateStudent(student);
            studentRowNumber++;
            
            if (errors == null) {
                validStudents.add(student);
            } else {
                invalidStudents.put((Integer)studentRowNumber, errors);
            }
        }

        //Converting ArrayList<String[]> to String[][]
        String[][] validStudentArray = validStudents.toArray(new String[0][0]);

        //Calling BootstrapDAO to batch process all valid students into database
        int studentBSResults = BootstrapDAO.batchProcessStudent(validStudentArray);
        
        studentReader.close();
        
        /*
        ==========================================================
            READING OF COURSE CSV
        ==========================================================
         */
        String courseCSV = csvHash.get("course.csv");
        CSVReader courseReader = new CSVReader(new FileReader(courseCSV));
        TreeMap<Integer, ArrayList<String>> invalidCourses = new TreeMap<>(); //stores invalid rows to be displayed
        ArrayList<String[]> validCourses = new ArrayList<>(); //stores valid rows to be passed to DAO

        String[] course;
        int courseRowNumber = 1;

        course = courseReader.readNext(); //skips the header row

        while ((course = courseReader.readNext()) != null) {
            // nextLine[] is an array of values from the csv file
            ArrayList<String> errors = BootstrapValidator.validateCourse(course);
            courseRowNumber++;

            if (errors == null) {
                validCourses.add(course);
            } else {
                invalidCourses.put((Integer)courseRowNumber, errors);
            }
            
        }

        //Converting ArrayList<String[]> to String[][]
        String[][] validCourseArray = validCourses.toArray(new String[0][0]);

        //Calling BootstrapDAO to batch process all valid courses into database
        int courseBSResults = BootstrapDAO.batchProcessCourse(validCourseArray);
        
        courseReader.close();

        /*
        ==========================================================
            READING OF SECTION CSV
        ==========================================================
         */
        String sectionCSV = csvHash.get("section.csv"); //getting csv filepath from hashmap
        CSVReader sectionReader = new CSVReader(new FileReader(sectionCSV)); //using CSVReader to read csv
        TreeMap<Integer, ArrayList<String>> invalidSections = new TreeMap<>(); //stores invalid rows to be displayed
        ArrayList<String[]> validSections = new ArrayList<>(); //stores valid rows to be passed to DAO

        String[] section;
        int sectionRowNumber = 1;

        section = sectionReader.readNext(); //skips the header row

        while ((section = sectionReader.readNext()) != null) {
            // nextLine[] is an array of values from the csv file
            ArrayList<String> errors = BootstrapValidator.validateSection(section);
            sectionRowNumber++;
            
            if (errors == null) {
                validSections.add(section);
            } else {
                invalidSections.put((Integer)sectionRowNumber, errors);
            }
            
        }

        //Converting ArrayList<String[]> to String[][]
        String[][] validSectionArray = validSections.toArray(new String[0][0]);

        //Calling BootstrapDAO to batch process all valid sections into database
        int sectionBSResults = BootstrapDAO.batchProcessSection(validSectionArray);
        
        sectionReader.close();
        
        /*
        ==========================================================
            READING OF PREREQUISITE CSV
        ==========================================================
         */
        String prereqCSV = csvHash.get("prerequisite.csv"); //getting csv filepath from hashmap
        CSVReader prereqReader = new CSVReader(new FileReader(prereqCSV)); //using CSVReader to read csv
        TreeMap<Integer, ArrayList<String>> invalidPrereq = new TreeMap<>(); //stores invalid rows to be displayed
        ArrayList<String[]> validPrereq = new ArrayList<>(); //stores valid rows to be passed to DAO

        String[] prerequisite;
        int prereqRowNumber = 1;

        prerequisite = prereqReader.readNext(); //skips the header row

        while ((prerequisite = prereqReader.readNext()) != null) {
            // nextLine[] is an array of values from the csv file
            ArrayList<String> errors = BootstrapValidator.validatePrerequisite(prerequisite);
            prereqRowNumber++;

            if (errors == null) {
                validPrereq.add(prerequisite);
            } else {
                invalidPrereq.put((Integer)prereqRowNumber, errors);
            }

        }

        //Converting ArrayList<String[]> to String[][]
        String[][] validPrereqArray = validPrereq.toArray(new String[0][0]);

        //Calling BootstrapDAO to batch process all valid prereq into database
        int prereqBSResults = BootstrapDAO.batchProcessPrerequisite(validPrereqArray);
        
        prereqReader.close();
        
        /*
        ==========================================================
            READING OF COURSE_COMPLETED CSV
        ==========================================================
         */
        String courseCompletedCSV = csvHash.get("course_completed.csv"); //getting csv filepath from hashmap
        CSVReader ccReader = new CSVReader(new FileReader(courseCompletedCSV)); //using CSVReader to read csv
        TreeMap<Integer, ArrayList<String>> invalidCourseCompleted = new TreeMap<>(); //stores invalid rows to be displayed
        ArrayList<String[]> validCourseCompleted = new ArrayList<>(); //stores valid rows to be passed to DAO

        String[] courseCompleted;
        int ccRowNumber = 1;

        courseCompleted = ccReader.readNext(); //skips the header row

        while ((courseCompleted = ccReader.readNext()) != null) {
            // nextLine[] is an array of values from the csv file
            ArrayList<String> errors = BootstrapValidator.validateCourseCompleted(courseCompleted);
            ccRowNumber++;
            
            if (errors == null) {
                validCourseCompleted.add(courseCompleted);
            } else {
                invalidCourseCompleted.put((Integer)ccRowNumber, errors);
            }
            
        }

        //Converting ArrayList<String[]> to String[][]
        String[][] validCCArray = validCourseCompleted.toArray(new String[0][0]);

        //Calling BootstrapDAO to batch process all valid course completed into database
        int ccBSResults = BootstrapDAO.batchProcessCourseCompleted(validCCArray);
        
        ccReader.close();
        
        /*
        ==========================================================
            READING OF BID CSV
        ==========================================================
         */
        String bidCSV = csvHash.get("bid.csv"); //getting csv filepath from hashmap
        CSVReader bidReader = new CSVReader(new FileReader(bidCSV)); //using CSVReader to read csv
        TreeMap<Integer, ArrayList<String>> invalidBids = new TreeMap<>(); //stores invalid rows to be displayed
        String[][] validBidsArray = null; //stores valid rows to be passed to DAO

        String[] bid;
        int bidRowNumber = 1;

        bid = bidReader.readNext(); //skips the header row

        while ((bid = bidReader.readNext()) != null) {
            // nextLine[] is an array of values from the csv file
            ArrayList<String> errors = BootstrapValidator.validateBid(bid);
            bidRowNumber++;
            
            if (errors != null) {
                invalidBids.put((Integer)bidRowNumber, errors);
            }
            
        }

        //Retrieving validBids from validator bidMap to ensure no repeated bids
        validBidsArray = BootstrapValidator.retrieveValidBids();

        //Calling BootstrapDAO to batch process all valid course completed into database
        int bidBSResults = BootstrapDAO.batchProcessBids(validBidsArray);
        
        bidReader.close();
        
        //clearing all maps in validator used for checking
        BootstrapValidator.clearMaps();

        /*
        ==========================================================
            DELETING ALL UPLOADED FILES
        ==========================================================
         */
        String path = getServletContext().getRealPath("")
                + File.separator + "data";
        File uploadDirectory = new File(path);
        UploadController.emptyFolder(uploadDirectory);

        
        /*
        ==========================================================
            STARTING BIDDING ROUND TO ROUND 1
        ==========================================================
         */
        
        
        BootstrapDAO.startBiddingRound();
        
        /*
        ==================================================================================
            RESULTS OF BOOTSTRAP TO BE PASSED ON TO BE DISPLAYED ON "bootstrapResult.jsp"
        ==================================================================================
         */
        HttpSession session = request.getSession();

        session.setAttribute("invalidStudents", invalidStudents);
        session.setAttribute("invalidCourses", invalidCourses);
        session.setAttribute("invalidSections", invalidSections);
        session.setAttribute("invalidPrerequisite", invalidPrereq);
        session.setAttribute("invalidCourseCompleted", invalidCourseCompleted);
        session.setAttribute("invalidBids", invalidBids);

        session.setAttribute("validStudents", studentBSResults);
        session.setAttribute("validCourses", courseBSResults);
        session.setAttribute("validSections", sectionBSResults);
        session.setAttribute("validPrerequisite", prereqBSResults);
        session.setAttribute("validCourseCompleted", ccBSResults);
        session.setAttribute("validBids", (bidRowNumber-invalidBids.size()-1));

        response.sendRedirect("bootstrapResults.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
