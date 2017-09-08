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
import model.GiaoVienModel;

/**
 *
 * @author Pham Ngoc Phi
 */
public class GiaoVienDao {
    
    public List<GiaoVienModel> findAll(){
        List<GiaoVienModel> listGV = new ArrayList<>();
        String sql = "select * from GiaoVien";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()){
                GiaoVienModel gv = new GiaoVienModel();
                gv.setMaGV(rs.getLong("maGV"));
                gv.setTenGV(rs.getNString("tenGV"));
                gv.setNgaySinhGV(rs.getDate("ngaySinhGV"));
                gv.setGioiTinhGV(rs.getBoolean("gioiTinhGV"));
                gv.setSdtGV(rs.getString("sdtGV"));
                gv.setUserId(rs.getInt("UserId"));
                gv.setTrangthai(rs.getBoolean("trangthai"));
                listGV.add(gv);
            }
            return listGV;
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public GiaoVienModel findGVById(long id){
        String sql = "select * from GiaoVien where maGV = "+id+"";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()){
                GiaoVienModel gv = new GiaoVienModel();
                gv.setMaGV(rs.getLong("maGV"));
                gv.setTenGV(rs.getNString("tenGV"));
                gv.setNgaySinhGV(rs.getDate("ngaySinhGV"));
                gv.setGioiTinhGV(rs.getBoolean("gioiTinhGV"));
                gv.setSdtGV(rs.getString("sdtGV"));
                gv.setUserId(rs.getInt("UserId"));
                gv.setTrangthai(rs.getBoolean("trangthai"));
                return gv;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Boolean updateGV(long id, String name, Date ng, String sdt, Boolean gioitinh, Boolean tinhtrang){
        String sql = "UPDATE GiaoVien SET tenGV = N'"+name+"', ngaySinhGV = '"+ng+"',"
                +" gioiTinhGV = '"+gioitinh+"' , sdtGV = '"+sdt+"', trangthai = '"+tinhtrang+"' where maGV = "+id+"";
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
    
    public Boolean insertGV(String hoten, Date ngaysinh, Boolean gioitinh, String sdt, int userId, Boolean trangthai) throws SQLException {
        try {
            Connection connection = connectDB.getConnection();
            Statement stt = connection.createStatement();
            String sql = "INSERT INTO GiaoVien(tenGV, ngaySinhGV, gioiTinhGV, sdtGV, UserId, trangthai)"
                    +" VALUES(N'"+hoten+"','"+ngaysinh+"','"+gioitinh+"','"+sdt+"',"+userId+",'"+trangthai+"')";
            stt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
