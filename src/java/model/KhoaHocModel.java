/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Pham Ngoc Phi
 */
public class KhoaHocModel {
    public int maKH;
    public String tenKH;
    public int soBuoi;
    public long hocPhi;
    public String moTa;
    public Boolean trangThai;

    public KhoaHocModel() {
    }

    public KhoaHocModel( String tenKH, int soBuoi, long hocPhi, String moTa, Boolean trangThai) {
        this.tenKH = tenKH;
        this.soBuoi = soBuoi;
        this.hocPhi = hocPhi;
        this.moTa = moTa;
        this.trangThai = trangThai;
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public int getSoBuoi() {
        return soBuoi;
    }

    public void setSoBuoi(int soBuoi) {
        this.soBuoi = soBuoi;
    }

    public long getHocPhi() {
        return hocPhi;
    }

    public void setHocPhi(long hocPhi) {
        this.hocPhi = hocPhi;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Boolean getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Boolean trangThai) {
        this.trangThai = trangThai;
    }
    
    
    
    
}
