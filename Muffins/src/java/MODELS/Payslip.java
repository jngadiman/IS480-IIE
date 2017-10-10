/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.Date;

/**
 *
 * @author Hui Min
 */
public class Payslip {
    private int voucherNumber;
    private String mentor_email; //payee name (mentor name)
    private int mentee_company; 
    private Date start_period; 
    private Date end_period; //Business Mentorship Payment – (name of mentee company) for period dd mm yyyy to dd mm yyyy 
    private String typeOfPayment; 
    private String methodToDeliverCheque; 
    
    private double amount; //amount in payment/payslip
    private String costCentre; //C249 no need?
    private String gstTotalAmtPayable; //NA no need?
    private String internalOrder; //ZIE1MOECA1 no need?
    private String path; // the voucher path
    //private double baseAmount; //store base amount where voucher no = 0

    public Payslip(int voucherNumber, String mentor_email, int mentee_company, Date start_period, Date end_period, double amount, String path) {
        this.voucherNumber = voucherNumber;
        this.mentor_email = mentor_email;
        this.mentee_company = mentee_company;
        this.start_period = start_period;
        this.end_period = end_period;
        this.amount = amount;
        this.path = path;
        this.typeOfPayment = "giro";
        this.methodToDeliverCheque = "NA";
        this.costCentre ="C249";
        this.gstTotalAmtPayable = "NA";
        this.internalOrder = "ZIE1MOECA1";
        
    }

    public int getVoucherNumber() {
        return voucherNumber;
    }

    public void setVoucherNumber(int voucherNumber) {
        this.voucherNumber = voucherNumber;
    }

    public String getMentor_email() {
        return mentor_email;
    }

    public void setMentor_email(String mentor_email) {
        this.mentor_email = mentor_email;
    }

    public int getMentee_company() {
        return mentee_company;
    }

    public void setMentee_company(int mentee_company) {
        this.mentee_company = mentee_company;
    }

    public Date getStart_period() {
        return start_period;
    }

    public void setStart_period(Date start_period) {
        this.start_period = start_period;
    }

    public Date getEnd_period() {
        return end_period;
    }

    public void setEnd_period(Date end_period) {
        this.end_period = end_period;
    }

    public String getTypeOfPayment() {
        return typeOfPayment;
    }

    public void setTypeOfPayment(String typeOfPayment) {
        this.typeOfPayment = typeOfPayment;
    }

    public String getMethodToDeliverCheque() {
        return methodToDeliverCheque;
    }

    public void setMethodToDeliverCheque(String methodToDeliverCheque) {
        this.methodToDeliverCheque = methodToDeliverCheque;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCostCentre() {
        return costCentre;
    }

    public void setCostCentre(String costCentre) {
        this.costCentre = costCentre;
    }

    public String getGstTotalAmtPayable() {
        return gstTotalAmtPayable;
    }

    public void setGstTotalAmtPayable(String gstTotalAmtPayable) {
        this.gstTotalAmtPayable = gstTotalAmtPayable;
    }

    public String getInternalOrder() {
        return internalOrder;
    }

    public void setInternalOrder(String internalOrder) {
        this.internalOrder = internalOrder;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
    

}