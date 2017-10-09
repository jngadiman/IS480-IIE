/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

import java.util.*;

/**
 *
 * @author JJAY
 */
public class Contract {
    
    private int rlsID;
    private String mentor;
    private String admin;
    private byte[] contractFile;
    private Date signedDate;

    public Contract(int rlsID, String mentor, String admin, byte[] contractFile, Date signedDate) {
        this.rlsID = rlsID;
        this.mentor = mentor;
        this.admin = admin;
        this.contractFile = contractFile;
        this.signedDate = signedDate;
    }

    public int getRlsID() {
        return rlsID;
    }

    public void setRlsID(int rlsID) {
        this.rlsID = rlsID;
    }

    public String getMentor() {
        return mentor;
    }

    public void setMentor(String mentor) {
        this.mentor = mentor;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public byte[] getContractFile() {
        return contractFile;
    }

    public void setContractFile(byte[] contractFile) {
        this.contractFile = contractFile;
    }

    public Date getSignedDate() {
        return signedDate;
    }

    public void setSignedDate(Date signedDate) {
        this.signedDate = signedDate;
    }
}
