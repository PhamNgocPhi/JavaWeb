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
public class GiaoVienModel {
    
    private long maGV;
    private String tenGV;
    private Date ngaySinhGV;
    private Boolean gioiTinhGV;
    private String sdtGV;
    private int UserId;
    private Boolean trangthai;

    public GiaoVienModel() {
    }

    public GiaoVienModel(long maGV, String tenGV, Date ngaySinhGV, Boolean gioiTinhGV, String sdtGV, int UserId, Boolean trangthai) {
        this.maGV = maGV;
        this.tenGV = tenGV;
        this.ngaySinhGV = ngaySinhGV;
        this.gioiTinhGV = gioiTinhGV;
        this.sdtGV = sdtGV;
        this.UserId = UserId;
        this.trangthai = trangthai;
    }

    public long getMaGV() {
        return maGV;
    }

    public void setMaGV(long maGV) {
        this.maGV = maGV;
    }

    public String getTenGV() {
        return tenGV;
    }

    public void setTenGV(String tenGV) {
        this.tenGV = tenGV;
    }

    public Date getNgaySinhGV() {
        return ngaySinhGV;
    }

    public void setNgaySinhGV(Date ngaySinhGV) {
        this.ngaySinhGV = ngaySinhGV;
    }

    public Boolean getGioiTinhGV() {
        return gioiTinhGV;
    }

    public void setGioiTinhGV(Boolean gioiTinhGV) {
        this.gioiTinhGV = gioiTinhGV;
    }

    public String getSdtGV() {
        return sdtGV;
    }

    public void setSdtGV(String sdtGV) {
        this.sdtGV = sdtGV;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    public Boolean getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(Boolean trangthai) {
        this.trangthai = trangthai;
    }
    
    
}
