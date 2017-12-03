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
    private String mentorEmail; //payee name (mentor name)
    private int menteeCompany; 
    private Date startPeriod; 
    private Date endPeriod; //Business Mentorship Payment – (name of mentee company) for period dd mm yyyy to dd mm yyyy 
    private String typeOfPayment; 
    private String methodToDeliverCheque; 
    
    private double amount; //amount in payment/payslip
    private String costCentre; // C249 no need?
    private String gstTotalAmtPayable; // NA no need?
    private String internalOrder; // ZIE1MOECA1 no need?
    private String path; // the voucher path
    //private double baseAmount; //store base amount where voucher no = 0

    public Payslip(int voucherNumber, String mentorEmail, int menteeCompany, Date startPeriod, Date endPeriod, double amount, String path) {
        this.voucherNumber = voucherNumber;
        this.mentorEmail = mentorEmail;
        this.menteeCompany = menteeCompany;
        this.startPeriod = startPeriod;
        this.endPeriod = endPeriod;
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

    public String getMentorEmail() {
        return mentorEmail;
    }

    public void setMentorEmail(String mentorEmail) {
        this.mentorEmail = mentorEmail;
    }

    public int getMenteeCompany() {
        return menteeCompany;
    }

    public void setMenteeCompany(int menteeCompany) {
        this.menteeCompany = menteeCompany;
    }

    public Date getStartPeriod() {
        return startPeriod;
    }

    public void setStartPeriod(Date startPeriod) {
        this.startPeriod = startPeriod;
    }

    public Date getEndPeriod() {
        return endPeriod;
    }

    public void setEndPeriod(Date endPeriod) {
        this.endPeriod = endPeriod;
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