/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.MeetingDAO;
import DAO.MeetingMinutesDAO;
import DAO.PayslipDAO;
import DAO.RelationshipDAO;
import MODELS.Company;
import MODELS.Meeting;
import MODELS.MeetingMinutes;
import MODELS.Mentor;
import MODELS.Payslip;
import MODELS.Relationship;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServlet;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;



/**
 *
 * @author Hui Min
 */
public class paymentController {
    
    
    public static int getCountOfMonthYearByMentorNCompany(int month, int year, int company, String mentor_email){
        
        ArrayList<MeetingMinutes> mins = minutesController.getMeetingMinutesByMonthNYear(month, year, company, mentor_email);
        int count = 0;
        for(MeetingMinutes m: mins){
            count++;
        }
        return count;
    }
    //generate one payslip of one company, one mentor ending month year DO LATER
    public static Payslip generatePayslip(int month, int year, String mentor_email, int company_id){
        
        //get voucher id
        int voucher_no = PayslipDAO.getLastPaymentVoucherID();
        System.out.println("LAST VOUCHER NUMBER "+voucher_no);
        //setting the start and end date of month and year
        LocalDate startMonth = YearMonth.of(year,month).atDay(1); //2015-12-01
        LocalDate endMonth = YearMonth.of(year,month).atEndOfMonth(); //2015-12-31
        Date startDate = java.sql.Date.valueOf(startMonth) ; //start of month
        Date endDate = java.sql.Date.valueOf(endMonth) ; //end of month
        
        //getting the actual period payment is for
        Relationship current = null;
        //ArrayList<Date
        ArrayList<Relationship> relationships = RelationshipDAO.getRelationshipsForMentorNCompany(mentor_email, company_id);
        if(relationships!=null){
            for(Relationship rls: relationships){
                
                
                if(rls.getStatus().equals("assigned")){
                    current = rls;
                }
            }
        }
        //get the number of meeting minutes count within the period
        int count = paymentController.getCountOfMonthYearByMentorNCompany(month, year, company_id, mentor_email);
        //get where voucher number = 0 which stores the base amount
        double base_amount = PayslipDAO.getPayslip(0).getAmount();
        double amount = count*base_amount;
        Payslip payslip = new Payslip(voucher_no,mentor_email,company_id, current.getStart_date(), current.getEnd_date(), amount, "");
        //add the payslip into the db
        PayslipDAO.addPayslip(payslip);
        relationshipController.changeRelationshipStatus(current.getRelationshipID(), "over");
        return payslip;
    }
    
    public static String printPayslip(Payslip payslip, String realPath)throws FileNotFoundException, IOException {
        
        String voucherPath = "";
        ArrayList<String> returnMsg = new ArrayList<String>();
        String result = "";
        int voucher_no = payslip.getVoucherNumber();
        String mentor_email = payslip.getMentor_email();
        Mentor mentor = mentorController.getMentor(mentor_email);
        String mentor_name = "";
        String bank_acc_str = "";
        if (mentor!= null){
            mentor_name = mentor.getName();
            bank_acc_str = mentor.getBankAccount();
        }
        String [] bank_details = bank_acc_str.split(";");
        System.out.println("BANK DETAILS ARRAY IN PAYMENT CONROLLER ---- "+ bank_details);
        
        String mail_address = "";
        String account_name = "";
        String account_no = "";
        String bank_name = "";
        String swift_code = "";
        String bank_address = "";
        if (bank_details!=null && bank_details.length!=0){
            mail_address = bank_details[0];
            account_name = bank_details[1];
            account_no = bank_details[2];
            bank_name = bank_details[3];
            swift_code = bank_details[4];
            bank_address = bank_details[5];
        }
        
        int mentee_company = payslip.getMentee_company();
        Company mentee = companyController.getCompany(mentee_company);
        String company_name = "";
        if(mentee!=null){
            company_name = mentee.getName();
        }
        
        SimpleDateFormat df = new  SimpleDateFormat("yyyy-MM-dd");
        Date start_period = payslip.getStart_period();
        Date end_period = payslip.getEnd_period();
        
        String start ="";
        String end ="";
        
        if(start_period!=null && end_period!=null){
            start = df.format(start_period);
            end = df.format(end_period);
        }
        
        double amount = payslip.getAmount();
        String amt = Double.toString(amount);
        
        
        POIFSFileSystem fsfilesystem = null;
        HWPFDocument hwpfdoc = null;
        //Business Mentorship Payment –  (name of mentee company) for period dd mm yyyy to dd mm yyyy
        
        InputStream resourceAsStream = new FileInputStream(realPath+ "\\iiedocuments\\MentorPaymentVoucherTemplate.doc");
        //new BufferedInputStream(resourceAsStream);
        
        try {
            
            fsfilesystem = new POIFSFileSystem(resourceAsStream );
            hwpfdoc = new HWPFDocument(fsfilesystem);
            Range range = hwpfdoc.getRange();
            range.replaceText("${payee_name}",mentor_name);
            range.replaceText("${payee_address}",mail_address);
            range.replaceText("${event}","Business Mentorship Payment –  (");
            range.replaceText("${mentee_company}",company_name);
            range.replaceText("${for_period}",") for period ");
            range.replaceText("${period}",start+" to "+end);
            range.replaceText("${bank_account_name}",account_name);
            range.replaceText("${bank_account_number}",account_no);
            range.replaceText("${branch_name}",bank_name);
            range.replaceText("${swift_code}",swift_code);
            range.replaceText("${bank_address}",bank_address);
            range.replaceText("${amount}",amt);
            
            SimpleDateFormat todayFomatter = new  SimpleDateFormat("yyyyMMdd");
            String today = todayFomatter.format(new Date());
            voucherPath = "\\iiedocuments\\PaymentVouchers\\VN"+today+voucher_no+".doc";
            returnMsg.add(voucherPath);
            FileOutputStream fos = new FileOutputStream(realPath+voucherPath);
            hwpfdoc.write(fos);
            fos.flush();
            fos.close();
            result = "Success!";
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            result = "FAILED FILE NOT FOUND!";
        } catch (IOException e) {
            e.printStackTrace();
            result = "FAILED IO EXCEPTION!";
        }
        returnMsg.add(result);
        return voucherPath;
    }
    
    public static String addVoucherPath(int voucherNo, String voucherPath){
        
        return PayslipDAO.addVoucherPath(voucherNo, voucherPath);
    }
    
    public static double getBaseAmount(){
        //get the base amount of the payslip
        double baseAmount = 0.0;
        Payslip p = PayslipDAO.getPayslip(0);
        if(p!=null){
            baseAmount = p.getAmount();
        }
        return baseAmount;
    }
    
    public static void main(String[] args) throws IOException{
        //String payslip = paymentController.printPayslip(new Payslip(6,"mentor1@hotmail.com",5,new Date(), new Date(),23.5), "C:\\Users\\JJAY\\Desktop\\SMU\\FYP\\IS480\\Muffins\\web\\");
        //String numMM = paymentController.printPayslip(payslip);
        //System.out.println(numMM);
    }
}
