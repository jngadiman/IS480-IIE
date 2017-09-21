package Utility;


import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hui Min
 */
public class EmailSender {
    public static boolean sendMail(String from, String password, String message, String[] to, String subject){
        String host = "smtp.gmail.com";
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", password);
        props.put("mail.smtp.port",587);
        props.put("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage mimeMessage = new MimeMessage(session);
        try{
            mimeMessage.setFrom(new InternetAddress(from));
            
            InternetAddress[] toAddress = new InternetAddress[to.length];
            System.out.println("LENGTH OF ADDRESSES: "+to.length);
            for(int i = 0; i < to.length; i++){
                toAddress[i] = new InternetAddress(to[i]);
                System.out.println("SENDING TO: "+toAddress[i]);
            }
            System.out.println("LENGTH OF ADDRESSES ALREADY ADDED TO INTERNET ADDRESS: "+toAddress.length);
            for(int i = 0; i < toAddress.length; i++){
               mimeMessage.addRecipients(Message.RecipientType.TO, toAddress[i].getAddress());
               System.out.println("SET MIMEMESSAGE RECEPIENT: "+i);
            }
           
            System.out.println("SIZE OF ALL RECEIPIENTS: "+mimeMessage.getAllRecipients().length);
//            Address[] all = mimeMessage.getAllRecipients();
//            for(Address a: all){
//                
//            }
            
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, password);
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            transport.close();
            return true;
        }catch(MessagingException me){
            me.printStackTrace();
        }
        
        return false;
    }
    
    public static void main(String[] args){
        //if(EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", companyName+ " have been accepted into IIE Incubation.", admin, "IIE Portal Notification")){
        String notSplit = "jiatung1218@gmail.com,jiatung.lim.2014@sis.smu.edu.sg";
        String [] split = notSplit.split(",");
        String [] to = {"jiatung1218@gmail.com","jiatung.lim.2014@sis.smu.edu.sg"};
        EmailSender.sendMail("incogiieportal@gmail.com", "iieportal2017", "message for testing ", to, "testing2017");
    }
}
