package dao;

import connectDB.connectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DangKyHocModel;

/**
 *
 * @author Pham Ngoc Phi
 */
public class DangKyHocDao {
    
    public Boolean insertDKHoc(int maHV, long maLH, Boolean dongTien) {
        String sql = "INSERT INTO DKIHOC(maHV, maLH, dongTien) VALUES(" + maHV + "," + maLH + ",'" + dongTien + "')";
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
    
    public Boolean deleteDKHoc(long maLH) {
        String sql = "DELETE FROM DKIHOC where maLH = "+maLH+" ";
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
    
    public DangKyHocModel findByMaHV(int userId) {
        String sql = "select dk.* from DKIHOC dk, hocvien hv, [user]  where dk.maHV = hv.maHV and hv.UserId = [user].UserId and [user].UserId = "+userId+"";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                DangKyHocModel dkHoc = new DangKyHocModel();
                dkHoc.setMaLH(rs.getLong("maLH"));
                dkHoc.setMaHV(rs.getLong("maHV"));
                dkHoc.setDongTien(rs.getBoolean("dongTien"));
                return dkHoc;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
