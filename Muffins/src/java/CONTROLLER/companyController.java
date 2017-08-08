/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.CompanyDAO;
import DAO.UserDAO;
import MODELS.Company;
import MODELS.User;
import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class companyController {
    public static ArrayList<Company> getLightCompanies(){
        ArrayList<Company> companies = new ArrayList<>();
        ArrayList<Integer> companyIDs = UserDAO.getLightCompanyIDs();
        
        for(int company_id: companyIDs){
            Company c = CompanyDAO.getCompany(company_id);
            companies.add(c);
        }
        return companies;
    }

    public static ArrayList<Company> getRegularCompanies(){
        ArrayList<Company> companies = new ArrayList<>();
        ArrayList<Integer> companyIDs = UserDAO.getRegularCompanyIDs();
        
        for(int company_id: companyIDs){
            Company c = CompanyDAO.getCompany(company_id);
            companies.add(c);
        }
        return companies;
    }
    
    public static void main(String[] args){
        ArrayList<Company> companies = companyController.getRegularCompanies();
        for(Company c: companies){
            System.out.println(c.getId());
            System.out.println(c.getName());
            System.out.println(c.getDescription());
            System.out.println(c.getVision());
            System.out.println(c.getMission());
            System.out.println(c.getIndustry());
            System.out.println(c.getStartDate());
            System.out.println(c.getCurrentStage());
            System.out.println(c.getCompanyLogo());
        }
    }
}