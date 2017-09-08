/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connectDB.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.userModel;

/**
 *
 * @author Pham Ngoc Phi
 */
public class UserDao {

    public Boolean insertUser(String email, String pass, String roleName) throws SQLException {
        try {
            Connection connection = connectDB.getConnection();
            Statement stt = connection.createStatement();
            String sql = "INSERT INTO [user](Email, Pass, roleName) VALUES('" + email + "','" + pass + "','" + roleName + "')";
            stt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public userModel loginUser(String email, String pass) throws SQLException {
        Connection connection = connectDB.getConnection();
        userModel u = new userModel();
        String sql = "select * from [user] where Email = '" + email + "' and Pass = '" + pass + "'";
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = connection.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                userModel user = new userModel();
                user.setUserId(rs.getInt("UserId"));
                user.setEmail(rs.getString("Email"));
                user.setPass(rs.getString("Pass"));
                user.setRoleName(rs.getString("roleName"));
                connection.close();
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Boolean insertHV(String tenHV, long sdtHV, int UserId) throws SQLException {
        try {
            Connection connection = connectDB.getConnection();
            Statement stt = connection.createStatement();
            String sql = "INSERT INTO HocVien(sdtHV, UserId, tenHV) VALUES ("+sdtHV+","+UserId+",'"+tenHV+"')";
            stt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Boolean checkEmail(String email){
        Connection connection = connectDB.getConnection();
        String sql = "SELECT Email FROM [User] where Email = '"+email+"'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
