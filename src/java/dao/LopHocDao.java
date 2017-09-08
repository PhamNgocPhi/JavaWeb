package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.LopHocModel;
import model.KetQuaModel;
import connectDB.connectDB;
import java.sql.Date;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Pham Ngoc Phi
 */
public class LopHocDao {

    public List<LopHocModel> findLopByTTKhoaHoc(int maKH, String tinhTrang) {
        List<LopHocModel> listLopHoc = new ArrayList<>();
        String sql = "select lh.* "
                + "from KhoaHoc kh, LopHoc lh, CaHoc ch, NgayHoc nh "
                + "where kh.maKH = lh.maKH and ch.MaCH=lh.maCH and lh.maNH = nh.MaNH "
                + "and lh.trangThai = '" + tinhTrang + "' and kh.maKH = '" + maKH + "'";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                LopHocModel lopHoc = new LopHocModel();
                lopHoc.setMaLH(rs.getLong("maLH"));
                lopHoc.setMaKH(rs.getInt("maKH"));
                lopHoc.setTenLop(rs.getString("tenLop"));
                lopHoc.setNgayBD(rs.getDate("ngayBD"));
                lopHoc.setNgayKT(rs.getDate("ngayKT"));
                lopHoc.setSiSo(rs.getInt("siSo"));
                lopHoc.setMaGV(rs.getLong("maGV"));
                lopHoc.setMaCH(rs.getInt("maCH"));
                lopHoc.setMaNH(rs.getInt("maNH"));
                lopHoc.setTrangThai(rs.getString("trangThai"));
                listLopHoc.add(lopHoc);
            }
            return listLopHoc;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Integer> getMaKHinLH(String trangThai){
        List<Integer> listMaKH = new ArrayList<>();
        String sql = "select distinct maKH from LopHoc where trangThai = '"+trangThai+"'";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int maKH;
                maKH = rs.getInt("maKH");
                listMaKH.add(maKH);
            }
            return listMaKH;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<LopHocModel> getAllLopHoc() {
        List<LopHocModel> listLopHoc = new ArrayList<>();
        String sql = "select * from LopHoc";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                LopHocModel lopHoc = new LopHocModel();
                lopHoc.setMaLH(rs.getLong("maLH"));
                lopHoc.setMaKH(rs.getInt("maKH"));
                lopHoc.setTenLop(rs.getString("tenLop"));
                lopHoc.setNgayBD(rs.getDate("ngayBD"));
                lopHoc.setNgayKT(rs.getDate("ngayKT"));
                lopHoc.setSiSo(rs.getInt("siSo"));
                lopHoc.setMaGV(rs.getLong("maGV"));
                lopHoc.setMaCH(rs.getInt("maCH"));
                lopHoc.setMaNH(rs.getInt("maNH"));
                lopHoc.setTrangThai(rs.getString("trangThai"));
                listLopHoc.add(lopHoc);
            }
            return listLopHoc;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public LopHocModel findLopById(long maLH) {
        String sql = "select * from LopHoc where maLH = " + maLH + "";
        Connection connect = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connect = connectDB.getConnection();
            stmt = connect.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                LopHocModel lopHoc = new LopHocModel();
                lopHoc.setMaLH(rs.getLong("maLH"));
                lopHoc.setMaKH(rs.getInt("maKH"));
                lopHoc.setTenLop(rs.getString("tenLop"));
                lopHoc.setNgayBD(rs.getDate("ngayBD"));
                lopHoc.setNgayKT(rs.getDate("ngayKT"));
                lopHoc.setSiSo(rs.getInt("siSo"));
                lopHoc.setMaGV(rs.getLong("maGV"));
                lopHoc.setMaCH(rs.getInt("maCH"));
                lopHoc.setMaNH(rs.getInt("maNH"));
                lopHoc.setTrangThai(rs.getString("trangThai"));
                return lopHoc;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Boolean themLopHoc(int maKH, String tenLop, Date ngayBD, int maCH, int maNH, String trangThai) throws ParseException, SQLException {
        try {
            Connection connection = connectDB.getConnection();
            String sql = "INSERT INTO LopHoc(maKH, tenLop, ngayBD, maCH, maNH, trangThai)"
                    + " VALUES(" + maKH + ",'" + tenLop + "','" + ngayBD + "'," + maCH + "," + maNH + ",'" + trangThai + "')";
            Statement stt = connection.createStatement();
            stt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Boolean suaLopHoc(long maLH, int maKH, String tenLop, Date ngayBD, Date ngayKT, int maGV, int maCH, int maNH, String trangThai) throws ParseException {
        String sql = "update LopHoc"
                + " set maKH = " + maKH + ", tenLop = '" + tenLop + "', ngayBD= '" + ngayBD + "',"
                + " ngayKT = '" + ngayKT + "', maGV = " + maGV + ", maCH = " + maCH + ", maNH = " + maNH + ", trangThai = '" + trangThai + "'"
                + " where maLH = " + maLH + "";
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

    public ArrayList<KetQuaModel> inBangDiem(int maLH) {
        try {
            Connection connection = connectDB.getConnection();

            String sql = "select * from KetQua where maLH = '" + maLH + "'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<KetQuaModel> listKQ = new ArrayList<>();
            while (rs.next()) {
                KetQuaModel ketQuaModel = new KetQuaModel();
                ketQuaModel.setMaLH(rs.getInt("maLH"));
                ketQuaModel.setMaHV(rs.getInt("maHV"));
                ketQuaModel.setDiem(rs.getInt("Diem"));
                listKQ.add(ketQuaModel);
            }
            return listKQ;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
