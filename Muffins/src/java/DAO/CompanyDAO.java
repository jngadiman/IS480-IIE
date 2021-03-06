/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import MODELS.Company;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.lang.Object;
import java.sql.Blob;
import javax.sql.rowset.serial.SerialBlob;

/**
 *
 * @author Hui Min
 */
public class CompanyDAO {

    public static Company getCompany(int companyID) {
        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int cID = 0;
        String cName = "";
        String cDescription = "";
        String cFounders = "";
        int cFullTimers = 0;
        int cPartTimers = 0;
        int industry = 0;
        String cStartDate = "";
        Blob cLogo = null;
        byte[] companyLogo = null;
        String productDiff = "";
        String revenueModel = "";
        String traction = "";
        String deployOfFunds = "";
        Blob cAcraFile = null;
        byte[] acraFile = null;
        Blob cBizSlides = null;
        byte[] bizSlides = null;
        Blob cAgreementForm = null;
        byte[] agreementForm = null;
        Date date = new Date();
        int currentstage = 0;
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where company_id = ?;");
            stmt.setInt(1, companyID);
            result = stmt.executeQuery();
            while (result.next()) {
                cID = Integer.parseInt(result.getString("company_id"));
                cName = result.getString("company_name");
                cDescription = result.getString("company_description");
                cFounders = result.getString("founders");
                cFullTimers = result.getInt("num_fulltime");
                cPartTimers = result.getInt("num_parttime");
                industry = result.getInt("industry");
                cStartDate = result.getString("start_date");
                //System.out.println("companyDAO: " + cStartDate);
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                if (cStartDate != null) {
                    try {
                        date = dateformat.parse(cStartDate);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                if (result.getString("current_stage") != null) {
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                } else {
                    currentstage = 0;
                }
                cLogo = result.getBlob("company_logo");
                if (cLogo != null) {
                    companyLogo = cLogo.getBytes(1, (int) cLogo.length());
                } else {
                    companyLogo = null;
                }
                productDiff = result.getString("product_differentiation");
                revenueModel = result.getString("revenue_model");
                traction = result.getString("traction");
                deployOfFunds = result.getString("deployment_of_funds");

                cAcraFile = result.getBlob("acra_file");
                if (cAcraFile != null) {
                    acraFile = cAcraFile.getBytes(1, (int) cAcraFile.length());
                } else {
                    acraFile = null;
                }

                cBizSlides = result.getBlob("business_slides");
                if (cBizSlides != null) {
                    bizSlides = cBizSlides.getBytes(1, (int) cBizSlides.length());
                } else {
                    bizSlides = null;
                }

                cAgreementForm = result.getBlob("agreement_form");
                if (cAgreementForm != null) {
                    agreementForm = cAgreementForm.getBytes(1, (int) cAgreementForm.length());
                } else {
                    agreementForm = null;
                }

                String[] stakeholders = null;
                if (cFounders != null) {
                    stakeholders = cFounders.split(",");
                }

                c = new Company(cID, cName, cDescription, stakeholders, cFullTimers, cPartTimers, industry, date, currentstage, companyLogo, productDiff, revenueModel, traction, deployOfFunds, acraFile, bizSlides, agreementForm);
                System.out.println("companyDAO: " + c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        System.out.println("companyDAO: " + c);
        return c;
    }

    public static ArrayList<Company> getAllCompanies() {
        ArrayList<Company> companies = new ArrayList<Company>();
        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int cID = 0;
        String cName = "";
        String cDescription = "";
        String cFounders = "";
        int cFullTimers = 0;
        int cPartTimers = 0;
        int industry = 0;
        String cStartDate = "";
        Blob cLogo = null;
        byte[] companyLogo = null;
        String productDiff = "";
        String revenueModel = "";
        String traction = "";
        String deployOfFunds = "";
        Blob cAcraFile = null;
        byte[] acraFile = null;
        Blob cBizFiles = null;
        byte[] bizSlides = null;
        Blob cAgreementForm = null;
        byte[] agreementForm = null;
        Date date = new Date();
        int currentstage = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company order by `company_name` asc ;");
            result = stmt.executeQuery();

            while (result.next()) {
                cID = Integer.parseInt(result.getString("company_id"));
                cName = result.getString("company_name");
                cDescription = result.getString("company_description");
                cFounders = result.getString("founders");
                cFullTimers = result.getInt("num_fulltime");
                cPartTimers = result.getInt("num_parttime");
                industry = result.getInt("industry");
                cStartDate = result.getString("start_date");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                if (cStartDate != null) {
                    try {
                        date = dateformat.parse(cStartDate);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                if (result.getString("current_stage") != null) {
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                } else {
                    currentstage = 0;
                }
                cLogo = result.getBlob("company_logo");
                if (cLogo != null) {
                    companyLogo = cLogo.getBytes(1, (int) cLogo.length());
                } else {
                    companyLogo = null;
                }

                productDiff = result.getString("product_differentiation");
                revenueModel = result.getString("revenue_model");
                traction = result.getString("traction");
                deployOfFunds = result.getString("deployment_of_funds");

                cAcraFile = result.getBlob("acra_file");
                if (cAcraFile != null) {
                    acraFile = cAcraFile.getBytes(1, (int) cAcraFile.length());
                } else {
                    acraFile = null;
                }

                cBizFiles = result.getBlob("business_slides");
                if (cBizFiles != null) {
                    bizSlides = cBizFiles.getBytes(1, (int) cBizFiles.length());
                } else {
                    bizSlides = null;
                }

                cAgreementForm = result.getBlob("agreement_form");
                if (cAgreementForm != null) {
                    agreementForm = cAgreementForm.getBytes(1, (int) cAgreementForm.length());
                } else {
                    agreementForm = null;
                }
                String[] stakeholders = null;
                if (cFounders != null) {
                    stakeholders = cFounders.split(",");
                }

                c = new Company(cID, cName, cDescription, stakeholders, cFullTimers, cPartTimers, industry, date, currentstage, companyLogo, productDiff, revenueModel, traction, deployOfFunds, acraFile, bizSlides, agreementForm);

                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }

    public static ArrayList<Company> getCompaniesInStage(int stage) {
        ArrayList<Company> companies = new ArrayList<Company>();
        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int cID = 0;
        String cName = "";
        String cDescription = "";
        String cFounders = "";
        int cFullTimers = 0;
        int cPartTimers = 0;
        int industry = 0;
        String cStartDate = "";
        Blob cLogo = null;
        byte[] companyLogo = null;
        String productDiff = "";
        String revenueModel = "";
        String traction = "";
        String deployOfFunds = "";
        Blob cAcraFile = null;
        byte[] acraFile = null;
        Blob cBizSlides = null;
        byte[] bizSlides = null;
        Blob cAgreementForm = null;
        byte[] agreementForm = null;
        Date date = new Date();
        int currentstage = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Company where current_stage = ?;");
            stmt.setInt(1, stage);
            result = stmt.executeQuery();

            while (result.next()) {
                cID = Integer.parseInt(result.getString("company_id"));
                cName = result.getString("company_name");
                cDescription = result.getString("company_description");
                cFounders = result.getString("founders");
                cFullTimers = result.getInt("num_fulltime");
                cPartTimers = result.getInt("num_parttime");
                industry = result.getInt("industry");
                cStartDate = result.getString("start_date");
                SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    date = dateformat.parse(cStartDate);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                if (result.getString("current_stage") != null) {
                    currentstage = Integer.parseInt(result.getString("current_stage"));
                }
                cLogo = result.getBlob("company_logo");
                if (cLogo != null) {
                    companyLogo = cLogo.getBytes(1, (int) cLogo.length());
                } else {
                    companyLogo = null;
                }

                productDiff = result.getString("product_differentiation");
                revenueModel = result.getString("revenue_model");
                traction = result.getString("traction");
                deployOfFunds = result.getString("deployment_of_funds");

                cAcraFile = result.getBlob("acra_file");
                if (cAcraFile != null) {
                    acraFile = cAcraFile.getBytes(1, (int) cAcraFile.length());
                } else {
                    acraFile = null;
                }

                cBizSlides = result.getBlob("business_slides");
                if (cBizSlides != null) {
                    bizSlides = cBizSlides.getBytes(1, (int) cBizSlides.length());
                } else {
                    bizSlides = null;
                }

                cAgreementForm = result.getBlob("agreement_form");
                if (cAgreementForm != null) {
                    agreementForm = cAgreementForm.getBytes(1, (int) cAgreementForm.length());
                } else {
                    agreementForm = null;
                }
                String[] stakeholders = null;
                if (cFounders != null) {
                    stakeholders = cFounders.split(",");
                }

                c = new Company(cID, cName, cDescription, stakeholders, cFullTimers, cPartTimers, industry, date, currentstage, companyLogo, productDiff, revenueModel, traction, deployOfFunds, acraFile, bizSlides, agreementForm);

                companies.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return companies;
    }

    public static ArrayList<String> getAllCompanyNames(ArrayList<Integer> companyIDs) {
        ArrayList<String> companyNames = new ArrayList<String>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int company_id = 0;
        String company_name = "";

        for (Integer i : companyIDs) {
            try {
                conn = ConnectionManager.getConnection();
                stmt = conn.prepareStatement("SELECT `company_name` FROM `Company` WHERE `company_id` = ? ");
                stmt.setInt(1, i);
                result = stmt.executeQuery();

                while (result.next()) {
                    company_name = result.getString("company_name");
                    companyNames.add(company_name);
                }

            } catch (SQLException ex) {
                Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                ConnectionManager.close(conn, stmt, result);
            }
        }
        return companyNames;
    }

    public static int editCompanyDetails(Company c) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;

        int result = 0;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String[] company_founders = c.getStakeholders();
        String stakeholders = "";
        for (int x = 0; x < company_founders.length; x++) {
            String s = company_founders[x].trim();
            if (x == (company_founders.length - 1)) {
                stakeholders += s;
            } else {
                stakeholders += s + ",";
            }

        }

        try {
            conn = ConnectionManager.getConnection();

            String status = "";

            stmt = conn.prepareStatement("UPDATE Company SET  company_name = ?, company_description = ?, founders = ?, num_fulltime = ?, num_parttime = ?, industry = ?, start_date = ?, current_stage = ?, company_logo = ?, product_differentiation = ?, revenue_model = ?, traction = ?, deployment_of_funds = ?, business_slides = ? WHERE company_id = ?;");
            stmt.setString(1, c.getName());
            stmt.setString(2, c.getDescription());
            stmt.setString(3, stakeholders);
            stmt.setInt(4, c.getFullTimers());
            stmt.setInt(5, c.getPartTimers());
            stmt.setInt(6, c.getIndustry());
            stmt.setString(7, df.format(c.getStartDate()));
            stmt.setInt(8, c.getCurrentStage());

            if (c.getCompanyLogo() != null) {
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(c.getCompanyLogo());

                stmt.setBlob(9, blob);
            } else {
                stmt.setBlob(9, (Blob) null);
            }

            stmt.setString(10, c.getProductDiff());
            stmt.setString(11, c.getRevenueModel());
            stmt.setString(12, c.getTraction());
            stmt.setString(13, c.getDeployOfFunds());

            if (c.getBizFile() != null) {
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(c.getBizFile());

                stmt.setBlob(14, blob);
            } else {
                stmt.setBlob(14, (Blob) null);
            }

            stmt.setInt(15, c.getId());

            result = stmt.executeUpdate();
            //task = new Task(taskName, desc, deadline, stage,companyID, isCompleted);

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }

    public static String addCompany(Company c) {
        String status = "";

        int id = c.getId();
        String cName = c.getName();
        String cDescription = c.getDescription();
        String[] cFounders = c.getStakeholders();
        String stakeholders = "";
        for (int x = 0; x < cFounders.length; x++) {
            String s = cFounders[x].trim();
            if (x == (cFounders.length - 1)) {
                stakeholders += s;
            } else {
                stakeholders += s + ",";
            }

        }
        Date cStartDate = c.getStartDate();
        int cCurrentStage = c.getCurrentStage();
        byte[] companyLogo = c.getCompanyLogo();
        String productDiff = c.getProductDiff();
        String revenueModel = c.getRevenueModel();
        String traction = c.getTraction();
        String deployOfFunds = c.getDeployOfFunds();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getConnection();

            //insert company to database
            stmt = conn.prepareStatement("Insert into Company values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            //set id
            stmt.setInt(1, id);

            //set cName
            stmt.setString(2, cName);

            //set cDescription
            stmt.setString(3, cDescription);

            //set stakeholders
            stmt.setString(4, stakeholders);

            stmt.setInt(5, c.getFullTimers());
            stmt.setInt(6, c.getPartTimers());
            stmt.setInt(7, c.getIndustry());
            if(c.getStartDate()!=null){
                stmt.setString(8, df.format(c.getStartDate()));
            }else{
                stmt.setString(8, null);
            }
            
            stmt.setInt(9, c.getCurrentStage());

            if (companyLogo != null) {
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(companyLogo);

                stmt.setBlob(10, blob);
            } else {
                stmt.setBlob(10, (Blob) null);
            }

            stmt.setString(11, productDiff);
            stmt.setString(12, revenueModel);
            stmt.setString(13, traction);
            stmt.setString(14, deployOfFunds);

            if (c.getAcraFile() != null) {
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(c.getAcraFile());

                stmt.setBlob(15, blob);
            } else {
                stmt.setBlob(15, (Blob) null);
            }

            if (c.getBizFile() != null) {
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(c.getBizFile());

                stmt.setBlob(16, blob);
            } else {
                stmt.setBlob(16, (Blob) null);
            }

            if (c.getAgreementForm() != null) {
                //convert byte[] to Blob object before putting into db
                Blob blob = new SerialBlob(c.getAgreementForm());

                stmt.setBlob(17, blob);
            } else {
                stmt.setBlob(17, (Blob) null);
            }

            int numRecordsUpdated = stmt.executeUpdate();

            if (numRecordsUpdated == 1) {
                status = "Success!";
            } else {
                status = "Fail!";
            }

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
        return status;
    }

    public static int getNextCompanyID() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet count = null;        
        
        DateFormat dateFormat = new SimpleDateFormat("ddMM");
        Date date = new Date();
        String nextStr = dateFormat.format(date);
        
        int counter = 0;
        try{
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select count(*) from company;");
            count = stmt.executeQuery();
            count.next();
            nextStr += count.getInt(1)+1;
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, count);
        }
        
        int companyID = Integer.parseInt(nextStr);
        return companyID;
    }

    public static boolean deleteCompany(int companyID) {

        Connection conn = null;
        int numRecordsUpdated = 0;

        PreparedStatement stmt0 = null;

        try {
            conn = ConnectionManager.getConnection();

            //check the number of bids made by the student
            stmt0 = conn.prepareStatement("DELETE FROM company WHERE company_id = ?");
            stmt0.setInt(1, companyID);

            numRecordsUpdated = stmt0.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (conn != null) {
                    conn.close();

                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (numRecordsUpdated != 1) {
            return false;
        }
        return true;
    }

    public static int changeCompanyStage(int stage, int companyID) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;

        int result = 0;

        try {
            conn = ConnectionManager.getConnection();

            String status = "";

            stmt = conn.prepareStatement("UPDATE Company SET  current_stage = ? WHERE company_id = ?;");

            stmt.setInt(1, stage);
            stmt.setInt(2, companyID);

            result = stmt.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt);
        }
        return result;
    }

    public static ArrayList<Integer> getAllCompanyIDsByIndustry(int industryCode) {
        ArrayList<Integer> companyIDs = new ArrayList<Integer>();

        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int companyID = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select company_id from Company where industry = ?;");
            stmt.setInt(1, industryCode);
            result = stmt.executeQuery();

            while (result.next()) {
                companyID = Integer.parseInt(result.getString("company_id"));
                companyIDs.add(companyID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }

        return companyIDs;
    }

    public static ArrayList<Integer> getAllCompanyIDs() {
        ArrayList<Integer> companyIDs = new ArrayList<Integer>();

        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int companyID = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select company_id from Company;");
            result = stmt.executeQuery();

            while (result.next()) {
                companyID = Integer.parseInt(result.getString("company_id"));
                companyIDs.add(companyID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }

        return companyIDs;
    }

    public static ArrayList<Integer> getConfirmedCompanyIDs() {
        ArrayList<Integer> companyIDs = new ArrayList<Integer>();

        Company c = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int companyID = 0;

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select company_id from Company where current_stage>0 and current_stage<5;");
            result = stmt.executeQuery();

            while (result.next()) {
                companyID = Integer.parseInt(result.getString("company_id"));
                companyIDs.add(companyID);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }

        return companyIDs;
    }

    public static void main(String[] args) {
//        ArrayList<Integer> companyIDs = CompanyDAO.getAllCompanyIDs();
//        for (Integer i : companyIDs) {
//            System.out.println(i);
//        }

//        String[] stringArray = new String[2];
//        String[] founders = new String[]{"mentor1@gmail.com","bla@abc.com"};
//        Company c = new Company(10, "comany cName", "sell food looajdvjvn..",founders, 11, 12, 302020, new Date(), 2, null, "hi", "hi1", "hi2", "hi3", null, null, null);
//        int result = CompanyDAO.editCompanyDetails(c);
//        System.out.println(result);
        int companyID = CompanyDAO.getNextCompanyID();
        System.out.println(companyID);
    }
}
