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
public class HocVienModel {
    private long maHV;
    private String tenHV;
    private Date ngaySinhHV;
    private Boolean gioiTinhHV;
    private String diaChiHV;
    private long sdtHV;
    private int UserID;

    public HocVienModel() {
    }

    public HocVienModel(long maHV, String tenHV, Date ngaySinhHV, Boolean gioiTinhHV, String diaChiHV, long sdtHV, int UserID) {
        this.maHV = maHV;
        this.tenHV = tenHV;
        this.ngaySinhHV = ngaySinhHV;
        this.gioiTinhHV = gioiTinhHV;
        this.diaChiHV = diaChiHV;
        this.sdtHV = sdtHV;
        this.UserID = UserID;
    }

    public long getMaHV() {
        return maHV;
    }

    public void setMaHV(long maHV) {
        this.maHV = maHV;
    }

    public String getTenHV() {
        return tenHV;
    }

    public void setTenHV(String tenHV) {
        this.tenHV = tenHV;
    }

    public Date getNgaySinhHV() {
        return ngaySinhHV;
    }

    public void setNgaySinhHV(Date ngaySinhHV) {
        this.ngaySinhHV = ngaySinhHV;
    }

    public Boolean getGioiTinhHV() {
        return gioiTinhHV;
    }

    public void setGioiTinhHV(Boolean gioiTinhHV) {
        this.gioiTinhHV = gioiTinhHV;
    }

    public String getDiaChiHV() {
        return diaChiHV;
    }

    public void setDiaChiHV(String diaChiHV) {
        this.diaChiHV = diaChiHV;
    }

    public long getSdtHV() {
        return sdtHV;
    }

    public void setSdtHV(long sdtHV) {
        this.sdtHV = sdtHV;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }
    
    
}
