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
public class NgayHocModel {
    public int maNH;
    public String ngayHoc;

    public NgayHocModel() {
    }

    public NgayHocModel(int maNH, String ngayHoc) {
        this.maNH = maNH;
        this.ngayHoc = ngayHoc;
    }

    public int getMaNH() {
        return maNH;
    }

    public void setMaNH(int maNH) {
        this.maNH = maNH;
    }

    public String getNgayHoc() {
        return ngayHoc;
    }

    public void setNgayHoc(String ngayHoc) {
        this.ngayHoc = ngayHoc;
    }

    
    
}
