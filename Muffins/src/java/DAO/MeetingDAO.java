/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Meeting;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiatung.lim
 */
public class MeetingDAO {
    public static Meeting getMeeting(int meetingID) {
   
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        Meeting meeting = null;
        String meetingName = "";
        String meetingType = "";
        Date startTime = null;
        Date endTime = null;
        String stringAttendees = "";
        String [] attendees = null;
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:ss");
        boolean status = false;
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Meeting where meetingID = ?;");
            stmt.setInt(1,meetingID);
            
            result = stmt.executeQuery();

            while (result.next()) {
                meetingID = Integer.parseInt(result.getString("meeting_id"));
                meetingName = result.getString("meeting_name");
                meetingType = result.getString("meeting_type");
                
                try {
                    startTime = dateformat.parse(result.getString("start_time"));
                    endTime = dateformat.parse(result.getString("end_time"));
                }catch(ParseException e){
                    e.printStackTrace();
                }
                stringAttendees = result.getString("attendees");
                attendees = stringAttendees.split(",");
                String statusString = result.getString("status");
                if(statusString.toUpperCase().equals("approved")){
                    status = true;
                }else{
                    status = false;
                }
                meeting = new Meeting(meetingID, meetingName, meetingType, startTime, endTime, attendees, status);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TaskDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        return meeting;
    }
}
