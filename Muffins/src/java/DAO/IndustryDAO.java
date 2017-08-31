/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import MODELS.Industry;
import Utility.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hui Min
 */
public class IndustryDAO {
    public static ArrayList<Industry> getAllIndustries(){
        ArrayList<Industry> industries = new ArrayList<Industry>();
        Industry i = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int industry_code = 0;
        String industry_name = "";

        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Industry;");
            result = stmt.executeQuery();

            while (result.next()) {
                industry_code = Integer.parseInt(result.getString("industry_code"));
                industry_name = result.getString("industry_name");
                
                i = new Industry(industry_code, industry_name);
                
                industries.add(i);
            }

        } catch (SQLException ex) {
            Logger.getLogger(IndustryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return industries;
    }
    
    public static Industry getIndustry(int industryCode){
        Industry i = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        int industry_code = 0;
        String industry_name = "";
        
        try {
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from Industry where industry_code = ?;");
            stmt.setInt(1, industryCode);
            result = stmt.executeQuery();

            while (result.next()) {
                industry_code = Integer.parseInt(result.getString("industry_code"));
                industry_name = result.getString("industry_name");
                
                i = new Industry(industry_code, industry_name);
            }
        } catch (SQLException ex) {
            Logger.getLogger(IndustryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, result);
        }
        
        return i;
    }
}
