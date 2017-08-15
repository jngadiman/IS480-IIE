/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.RequestDAO;
import MODELS.Request;
import java.util.ArrayList;

/**
 *
 * @author Hui Min
 */
public class requestController {
    public static ArrayList<Request> getRequestsOfCompany(int company_id){
        ArrayList<Request> requestsOfCompany = RequestDAO.getRequestByCompany(company_id);
        return requestsOfCompany;
    }
    
    public static String addRequest(Request r){
        String status = "";
        int result = RequestDAO.addRequest(r);
        
        if(result == 1){
            status = "Mentor has been requested for!";
        }else{
            status = "Please try again!";
        }
        return status;
    }
    
    public static int getNextRequestID(){
        int requestID = RequestDAO.getNextRequestID();
        return requestID;
    }
    
    public static int updateRequest(int requestID, String status){
        String updateStatus = "";
        
        int result = RequestDAO.updateRequest(requestID, status);
        
        return result;
    }
    
    public static ArrayList<Request> getAllRequestsByStatus (String status){
        ArrayList<Request> requests = RequestDAO.getAllRequestsByStatus(status);
        
        return requests;
    }
    
    public static ArrayList<Request> getAllRequests(){
        ArrayList<Request> requests = RequestDAO.getAllRequests();
        
        return requests;
    }
    
    public static Request getRequest(int requestID){
        Request r = RequestDAO.getRequestByRequestID(requestID);
        return r;
    }
}
