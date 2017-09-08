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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CaHocModel;

/**
 *
 * @author Pham Ngoc Phi
 */

public class CaHocDao {
    
    public CaHocModel findCaHoc(int maCH){
        String sql = "select * from CaHoc where MaCH = "+maCH+"";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()) {
                CaHocModel caHoc = new CaHocModel();
                caHoc.setMaCH(rs.getInt("MaCH"));
                caHoc.setGioHoc(rs.getNString("GioHoc"));
                return caHoc;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<CaHocModel> getListCH() {
        List<CaHocModel> listCH = new ArrayList<>();
        String sql = "select * from CaHoc";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                CaHocModel ch = new CaHocModel();
                ch.setMaCH(rs.getInt("MaCH"));
                ch.setGioHoc(rs.getNString("GioHoc"));
                listCH.add(ch);
            }
            return listCH;
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Boolean updateCH(int maCH, String gioHoc){
        String sql = "UPDATE CaHoc SET GioHoc = '"+gioHoc+"' where MaCH = "+maCH+" ";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Boolean insertCH(String gioHoc){
        String sql = "insert into CaHoc(GioHoc) values('"+gioHoc+"')";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            stmt.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
            
}
