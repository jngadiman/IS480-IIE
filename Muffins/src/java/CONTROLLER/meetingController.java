/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import DAO.*;
import MODELS.*;
import java.util.ArrayList;

/**
 *
 * @author jiatung.lim
 */
public class meetingController {
    //get the Meeting object given the Meeting ID
    public static Meeting getMeetingByMeetingID(int meeting_id){
        return MeetingDAO.getMeeting(meeting_id);
    }
}
