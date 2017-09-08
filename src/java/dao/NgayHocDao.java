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
import model.NgayHocModel;

/**
 *
 * @author Pham Ngoc Phi
 */
public class NgayHocDao {
    public NgayHocModel findNgayHoc(int maNH){
        String sql = "select * from NgayHoc where MaNH = "+maNH+"";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()) {
                NgayHocModel ngayHoc = new NgayHocModel();
                ngayHoc.setMaNH(rs.getInt("maNH"));
                ngayHoc.setNgayHoc(rs.getString("ngayHoc"));
                return ngayHoc;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<NgayHocModel> getListNH(){
       List<NgayHocModel> listNH = new ArrayList<>();
        String sql = "select * from NgayHoc";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()){
                NgayHocModel nh = new NgayHocModel();
                nh.setMaNH(rs.getInt("maNH"));
                nh.setNgayHoc(rs.getNString("ngayHoc"));
                listNH.add(nh);
            }
            return listNH;
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null; 
    }
    
    public Boolean updateNH(int maNH, String ngayHoc){
        String sql = "UPDATE NgayHoc SET ngayHoc = '"+ngayHoc+"' where maNH = "+maNH+"";
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
    
    public Boolean insertNH(String ngayHoc){
        String sql = "INSERT INTO NgayHoc(ngayHoc) VALUES('"+ngayHoc+"')";
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
