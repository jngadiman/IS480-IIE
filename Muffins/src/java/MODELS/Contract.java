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
    private byte[] contractFile;

    public Contract(int rlsID, byte[] contractFile) {
        this.rlsID = rlsID;
        this.contractFile = contractFile;
    }

    public int getRlsID() {
        return rlsID;
    }

    public void setRlsID(int rlsID) {
        this.rlsID = rlsID;
    }

    public byte[] getContractFile() {
        return contractFile;
    }

    public void setContractFile(byte[] contractFile) {
        this.contractFile = contractFile;
    }

}
