/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODELS;

/**
 *
 * @author Xinyao
 */
public class Industry {
    private int industryCode;
    private String industryName;

    public Industry(int industryCode, String industryName) {
        this.industryCode = industryCode;
        this.industryName = industryName;
    }

    public int getIndustryCode() {
        return industryCode;
    }

    public String getIndustryName() {
        return industryName;
    }

    public void setIndustryCode(int industryCode) {
        this.industryCode = industryCode;
    }

    public void setIndustryName(String industryName) {
        this.industryName = industryName;
    }
    
    
}
