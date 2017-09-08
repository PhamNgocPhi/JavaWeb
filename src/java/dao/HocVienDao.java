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
import model.GiaoVienModel;
import model.HocVienModel;

/**
 *
 * @author Pham Ngoc Phi
 */
public class HocVienDao {
    public List<HocVienModel> findAll(){
        List<HocVienModel> listHV = new ArrayList<>();
        String sql = "select * from HocVien";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()){
                HocVienModel hv = new HocVienModel();
                hv.setMaHV(rs.getLong("maHV"));
                hv.setTenHV(rs.getNString("tenHV"));
                hv.setNgaySinhHV(rs.getDate("ngaySinhHV"));
                hv.setGioiTinhHV(rs.getBoolean("gioiTinhHV"));
                hv.setSdtHV(rs.getLong("sdtHV"));
                hv.setUserID(rs.getInt("UserId"));
                listHV.add(hv);
            }
            return listHV;
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public HocVienModel findByUserID(int id){
        String sql = "select * from HocVien where UserId = "+id+"";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
         
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next()){
                HocVienModel hv = new HocVienModel();
                hv.setMaHV(rs.getLong("maHV"));
                hv.setTenHV(rs.getNString("tenHV"));
                hv.setNgaySinhHV(rs.getDate("ngaySinhHV"));
                hv.setGioiTinhHV(rs.getBoolean("gioiTinhHV"));
                hv.setSdtHV(rs.getLong("sdtHV"));
                hv.setDiaChiHV(rs.getNString("diaChiHV"));
                hv.setUserID(rs.getInt("UserId"));
                return hv;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GiaoVienDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
