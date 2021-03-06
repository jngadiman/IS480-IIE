/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.MentorDAO;
import DAO.RelationshipDAO;
import MODELS.Mentor;
import MODELS.Relationship;
import java.util.ArrayList;

/**
 *
 * @author JJAY
 */
public class relationshipController {

    public static ArrayList<Relationship> getRlsOfCompany(int company_id) {
        ArrayList<Relationship> requestsOfCompany = RelationshipDAO.getRelationshipsByCompany(company_id);
        return requestsOfCompany;
    }

    public static String addRelationship(Relationship r) {
        String status = "";
        int result = RelationshipDAO.addRelationship(r);

        if (result == 1) {
            status = "Mentor has been assigned to Mentee!";
        } else {
            status = "Please try again!";
        }
        return status;
    }

    public static int getNextRlsID() {
        int requestID = RelationshipDAO.getNextRelationshipID();
        return requestID;
    }

    public static int changeRelationshipStatus(int rlsID, String status) {
        int resultRS = RelationshipDAO.changeRelationshipStatus(rlsID, status);
        int company = 0;
        String mentor = "";
        if (resultRS == 1) {
            Relationship rls = RelationshipDAO.getRelationship(rlsID);
            company = rls.getCompanyID();
            mentor = rls.getMentorEmail();
        }
        int resultMenteeUpdate = menteeController.updateMentorEmail(company, mentor);
        int result = 0;
        if (resultRS == 1 && resultMenteeUpdate == 1) {
            result = 1;
        }
        return result;
    }

    public static ArrayList<Relationship> getAllRelationshipByStatus(String status) {
        ArrayList<Relationship> relationship = RelationshipDAO.getAllRelationshipsByStatus(status);

        return relationship;
    }

    public static ArrayList<Relationship> getAllRelationship() {
        ArrayList<Relationship> relationship = RelationshipDAO.getAllRelationships();

        return relationship;
    }

    public static Relationship getRelationship(int rlsID) {
        Relationship r = RelationshipDAO.getRelationship(rlsID);
        return r;
    }

    public static ArrayList<Relationship> getAssignedRelationshipsOfMonthYear(int month, int year) {
        ArrayList<Relationship> rls = new ArrayList<Relationship>();
        ArrayList<Relationship> all = RelationshipDAO.getRelationshipsEndingInMonthYear(month, year);
        for (Relationship r : all) {
            if (!r.getStatus().equals("requesting")) {
                rls.add(r);
            }
        }
        return rls;
    }

    public static ArrayList<Relationship> getConfirmedRelationshipsEndingMonthYear(int month, int year) {
        ArrayList<Relationship> rls = new ArrayList<Relationship>();
        ArrayList<Relationship> all = RelationshipDAO.getRelationshipsEndingInMonthYear(month, year);
        for (Relationship r : all) {
            if (r.getStatus().equals("assigned")) {
                System.out.println("CONFIRMED RELATIONSHIP OF THAT MONTH AND YEAR " + r.getRelationshipID());
                rls.add(r);
            }
        }
        return rls;
    }

    public static ArrayList<Relationship> getRelationshipsOfMentorInArrayList(ArrayList<Relationship> relationships, String mentor_email) {
        ArrayList<Relationship> rls = new ArrayList<Relationship>();
        for (Relationship r : relationships) {
            if (r.getMentorEmail().equals(mentor_email)) {
                rls.add(r);
            }
        }

        return rls;
    }

    public static Mentor getCurrentMentorOfCompany(int company_id) {
        Mentor m = null;

        String mentorEmail = RelationshipDAO.getCurrentMentorOfCompany(company_id);
        if (mentorEmail != null && !mentorEmail.isEmpty()) {
            m = MentorDAO.getMentorByEmail(mentorEmail);
        }

        return m;
    }

    public static void main(String[] args) {
        Mentor m = relationshipController.getCurrentMentorOfCompany(7);
        System.out.println(m);
    }
}
