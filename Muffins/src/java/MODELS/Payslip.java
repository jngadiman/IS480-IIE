/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

/**
 *
 * @author Hui Min
 */
public class Payslip {
    private String mentorName;
    private String staffIdOrNRIC;
    private String address;
    private String eventName;
    private String typeOfPayment;
    private String methodToDeliverCheque;
    private String accountName;
    private String bankAcctNo;
    private String branch;
    private String swiftCode;
    private String bankAddress;
    private double amount;
    private String costCentre;
    private String gstTotalAmtPayable;
    private String internalOrder;
    private String reasons;
    
    public Payslip(String mentorName, String staffIdOrNRIC, String address, String eventName, String typeOfPayment, String methodToDeliverCheque, String accountName, String bankAcctNo, String branch, String swiftCode, String bankAddress, double amount, String costCentre, String gstTotalAmtPayable, String internalOrder, String reasons) {
        this.mentorName = mentorName;
        this.staffIdOrNRIC = staffIdOrNRIC;
        this.address = address;
        this.eventName = eventName;
        this.typeOfPayment = typeOfPayment;
        this.methodToDeliverCheque = methodToDeliverCheque;
        this.accountName = accountName;
        this.bankAcctNo = bankAcctNo;
        this.branch = branch;
        this.swiftCode = swiftCode;
        this.bankAddress = bankAddress;
        this.amount = amount;
        this.costCentre = costCentre;
        this.gstTotalAmtPayable = gstTotalAmtPayable;
        this.internalOrder = internalOrder;
        this.reasons = reasons;
    }
    
    public String getMentorName() {
        return mentorName;
    }

    public void setMentorName(String mentorName) {
        this.mentorName = mentorName;
    }

    public String getStaffIdOrNRIC() {
        return staffIdOrNRIC;
    }

    public void setStaffIdOrNRIC(String staffIdOrNRIC) {
        this.staffIdOrNRIC = staffIdOrNRIC;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
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

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getBankAcctNo() {
        return bankAcctNo;
    }

    public void setBankAcctNo(String bankAcctNo) {
        this.bankAcctNo = bankAcctNo;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getSwiftCode() {
        return swiftCode;
    }

    public void setSwiftCode(String swiftCode) {
        this.swiftCode = swiftCode;
    }

    public String getBankAddress() {
        return bankAddress;
    }

    public void setBankAddress(String bankAddress) {
        this.bankAddress = bankAddress;
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

    public String getReasons() {
        return reasons;
    }

    public void setReasons(String reasons) {
        this.reasons = reasons;
    }
}
