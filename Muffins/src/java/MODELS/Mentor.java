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
public class Mentor extends User{
    private String position;
    private String introduction;

    public Mentor(String email, String password, String name, String nric, String profile_pic, String user_type, int company_id, String position, String introduction) {
        super(email, password, name, nric, profile_pic, user_type, company_id);
        this.position = position;
        this.introduction = introduction;
    } 

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
