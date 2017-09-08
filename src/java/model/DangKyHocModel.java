package model;

/**
 *
 * @author Pham Ngoc Phi
 */
public class DangKyHocModel {
    private long maHV;
    private long maLH;
    private Boolean dongTien;

    public DangKyHocModel() {
    }

    public DangKyHocModel(int maHV, long maLH, Boolean dongTien) {
        this.maHV = maHV;
        this.maLH = maLH;
        this.dongTien = dongTien;
    }

    public long getMaHV() {
        return maHV;
    }

    public void setMaHV(long maHV) {
        this.maHV = maHV;
    }

    public long getMaLH() {
        return maLH;
    }

    public void setMaLH(long maLH) {
        this.maLH = maLH;
    }

    public Boolean getDongTien() {
        return dongTien;
    }

    public void setDongTien(Boolean dongTien) {
        this.dongTien = dongTien;
    }
    
    
}
