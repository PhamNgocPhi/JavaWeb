/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Pham Ngoc Phi
 */
public class LopHocModel {
    private long maLH;
    private int maKH;
    private String tenLop;
    private Date ngayBD;
    private Date ngayKT;
    private int siSo;
    private long maGV;
    private int maCH;
    private int maNH;
    private String trangThai;

    public LopHocModel() {
    }

    public LopHocModel(long maLH, int maKH, String tenLop, Date ngayBD, Date ngayKT, int siSo, long maGV, int maCH, int maNH, String trangThai) {
        this.maLH = maLH;
        this.maKH = maKH;
        this.tenLop = tenLop;
        this.ngayBD = ngayBD;
        this.ngayKT = ngayKT;
        this.siSo = siSo;
        this.maGV = maGV;
        this.maCH = maCH;
        this.maNH = maNH;
        this.trangThai = trangThai;
    }

    public long getMaLH() {
        return maLH;
    }

    public void setMaLH(long maLH) {
        this.maLH = maLH;
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public String getTenLop() {
        return tenLop;
    }

    public void setTenLop(String tenLop) {
        this.tenLop = tenLop;
    }

    public Date getNgayBD() {
        return ngayBD;
    }

    public void setNgayBD(Date ngayBD) {
        this.ngayBD = ngayBD;
    }

    public Date getNgayKT() {
        return ngayKT;
    }

    public void setNgayKT(Date ngayKT) {
        this.ngayKT = ngayKT;
    }

    public int getSiSo() {
        return siSo;
    }

    public void setSiSo(int siSo) {
        this.siSo = siSo;
    }

    public long getMaGV() {
        return maGV;
    }

    public void setMaGV(long maGV) {
        this.maGV = maGV;
    }

    public int getMaCH() {
        return maCH;
    }

    public void setMaCH(int maCH) {
        this.maCH = maCH;
    }

    public int getMaNH() {
        return maNH;
    }

    public void setMaNH(int maNH) {
        this.maNH = maNH;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    
    
    
}
