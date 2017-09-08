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
public class CaHocModel {
    public int MaCH;
    public String GioHoc;

    public CaHocModel() {
    }

    public CaHocModel(int MaCH, String GioHoc) {
        this.MaCH = MaCH;
        this.GioHoc = GioHoc;
    }
    
    

    public int getMaCH() {
        return MaCH;
    }

    public void setMaCH(int MaCH) {
        this.MaCH = MaCH;
    }

    public String getGioHoc() {
        return GioHoc;
    }

    public void setGioHoc(String GioHoc) {
        this.GioHoc = GioHoc;
    }

    
    
}
