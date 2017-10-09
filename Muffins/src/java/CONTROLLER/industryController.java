/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.IndustryDAO;
import MODELS.Industry;
import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class industryController {
    public static ArrayList<Industry> getIndustries(){
        ArrayList<Industry> industries = new ArrayList<Industry>();
        
        industries = IndustryDAO.getAllIndustries();
        
        return industries;
    }
    
    public static Industry getIndustry(int industry_code){
        Industry i = null;
        
        i = IndustryDAO.getIndustry(industry_code);
        
        return i;
    }
    public static void main(String[] main){
        Industry i = industryController.getIndustry(302020);
        System.out.println(i.getIndustryCode());
        System.out.println(i.getIndustryName());
    }
}
