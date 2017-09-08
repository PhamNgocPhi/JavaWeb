/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connectDB.connectDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.KhoaHocModel;
import model.LopHocModel;

/**
 *
 * @author Pham Ngoc Phi
 */
public class KhoaHocDao {
    
    public KhoaHocModel findKhoaHocByMa(int maKH){
        String sql = "select * from KhoaHoc where maKH = "+maKH+"";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()) {
                KhoaHocModel khoaHoc = new KhoaHocModel();
                khoaHoc.setMaKH(rs.getInt("maKH"));
                khoaHoc.setTenKH(rs.getString("tenKH"));
                khoaHoc.setSoBuoi(rs.getInt("soBuoi"));
                khoaHoc.setHocPhi(rs.getLong("hocPhi"));
                khoaHoc.setMoTa(rs.getNString("moTa"));
                khoaHoc.setTrangThai(rs.getBoolean("trangThai"));
                return khoaHoc;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    public List<KhoaHocModel> getAllKH(){
        String sql = "select * from KhoaHoc";
        List<KhoaHocModel> listKH = new ArrayList<>();
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()) {
                KhoaHocModel khoaHoc = new KhoaHocModel();
                khoaHoc.setMaKH(rs.getInt("maKH"));
                khoaHoc.setTenKH(rs.getString("tenKH"));
                khoaHoc.setSoBuoi(rs.getInt("soBuoi"));
                khoaHoc.setHocPhi(rs.getLong("hocPhi"));
                khoaHoc.setMoTa(rs.getNString("moTa"));
                khoaHoc.setTrangThai(rs.getBoolean("trangThai"));
                listKH.add(khoaHoc);
            }
            return listKH;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Boolean updateKH(int maKH, String tenKH, int soBuoi, Long hocPhi, String moTa, Boolean trangThai){
        String sql = "UPDATE KhoaHoc SET tenKH = '"+tenKH+"', soBuoi = "+soBuoi+", hocPhi = "+hocPhi+","
                +" moTa = '"+moTa+"', trangThai ='"+trangThai+"' where maKH = "+maKH+" ";
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
    
    public Boolean insertKH(String tenKH, int soBuoi, long hocPhi, String moTa, Boolean trangThai){
        try {
            Connection connection = connectDB.getConnection();
            Statement stt = connection.createStatement();
            String sql = "INSERT INTO KhoaHoc(tenKH, soBuoi, hocPhi, moTa, trangThai)"
                    +" VALUES('"+tenKH+"',"+soBuoi+","+hocPhi+",'"+moTa+"','"+trangThai+"')";
            stt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
