package controller;

import dao.CaHocDao;
import dao.GiaoVienDao;
import dao.KhoaHocDao;
import dao.LopHocDao;
import dao.NgayHocDao;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import model.CaHocModel;
import model.GiaoVienModel;
import model.KhoaHocModel;
import model.LopHocModel;
import model.NgayHocModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Pham Ngoc Phi
 */
@Controller
@RequestMapping("/lophoc")
public class LopHocController {
    
    LopHocDao lhDao = new LopHocDao();
    
    @RequestMapping(value="/danh-sach-lop-hoc")
    public String getView(ModelMap modelMap){
        modelMap.put("listLH", lhDao.getAllLopHoc() );
        return "admin/lophoc";
    }
    
    @RequestMapping(value = "/sua-lop-hoc", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView suaLopHoc(@RequestParam("id") int id, ModelMap modelMap) {
        LopHocModel lh = lhDao.findLopById(id);
        List<KhoaHocModel> listKH = new KhoaHocDao().getAllKH();
        List<CaHocModel> listCH = new CaHocDao().getListCH();
        List<NgayHocModel> listNH = new NgayHocDao().getListNH();
        List<GiaoVienModel> listGV = new GiaoVienDao().findAll();
        modelMap.put("listKH", listKH);
        modelMap.put("listCH", listCH);
        modelMap.put("listNH", listNH);
        modelMap.put("listGV", listGV);
        //ModelAndView modelAndView = new ModelAndView("admin/edit_LopHoc", "lh", lh);
        ModelAndView modelAndView = new ModelAndView("admin/edit_LopHoc","lh", lh);
        return modelAndView;
    }

    @RequestMapping(value = "/{id}/sua-lop-hoc", method = RequestMethod.POST)
    public String suaLopHoc(@RequestParam("id") long id, @RequestParam("maKH") int maKH, @RequestParam("tenLop") String tenLop, @RequestParam("ngayBD") Date ngayBD,
            @RequestParam("ngayKT") Date ngayKT, @RequestParam("maGV") int maGV, @RequestParam("maCH") int maCH, @RequestParam("maNH") int maNH, @RequestParam("trangThai") String trangThai, ModelMap modelMap) throws ParseException {
        LopHocDao lopHocDao = new LopHocDao();
        Boolean suaLH = lopHocDao.suaLopHoc(id, maKH, tenLop, ngayBD, ngayKT, maGV, maCH, maNH, trangThai);
        if (suaLH == true) {
            return "redirect:/lophoc/danh-sach-lop-hoc.html";
        } else {
            modelMap.put("message", "Sửa thông tin lớp học thất bại");
            return "admin/edit_LopHoc";
        }

    }

    @RequestMapping(value = "/them-lop-hoc", method = RequestMethod.GET)
    public String themLopHoc(ModelMap modelMap) {
        List<KhoaHocModel> listKH = new KhoaHocDao().getAllKH();
        List<CaHocModel> listCH = new CaHocDao().getListCH();
        List<NgayHocModel> listNH = new NgayHocDao().getListNH();
        modelMap.put("listKH", listKH);
        modelMap.put("listCH", listCH);
        modelMap.put("listNH", listNH);
        return "admin/ThemLopHoc";
    }

    @RequestMapping(value = "/them-lop-hoc", method = RequestMethod.POST)
    public String themLopHoc(@RequestParam("maKH") int maKH, @RequestParam("tenLop") String tenLop, @RequestParam("ngayBD") Date ngayBD,
            @RequestParam("ngayKT") Date ngayKT, @RequestParam("maGV") int maGV, @RequestParam("maCH") int maCH, @RequestParam("maNH") int maNH, ModelMap modelMap) throws SQLException, ParseException {
        LopHocDao lopHocDao = new LopHocDao();
        Boolean themLH = lopHocDao.themLopHoc(maKH, tenLop, ngayBD, maCH, maNH, "2");
        if (themLH == true) {

            return "redirect:/lophoc/danh-sach-lop-hoc.html";

        } else {
            modelMap.put("message", "Thêm lớp học thất bại");
            return "admin/ThemLopHoc";
        }

    }

    @RequestMapping(value = "/in-bang-diem", method = RequestMethod.GET)
    public String inBangDiem(ModelMap modelMap) {
        List<KhoaHocModel> listKH = new KhoaHocDao().getAllKH();
        List<LopHocModel> listLH = new LopHocDao().findLopByTTKhoaHoc(1, "2");
        //       List<KetQuaModel> listKQ = lhDao.inBangDiem(id);
        //     modelMap.put("listKQ", listKQ);
        modelMap.put("listKH", listKH);
        modelMap.put("listLH", listLH);
        return "admin/inbangdiem";
    }

//    @RequestMapping(value = "/{maKhoa}", method = RequestMethod.GET)
//    public ResponseEntity<List<LopHocModel>> getAllLopHocByMaKhoa(@PathVariable("maKhoa") int maKhoa) {
//        List<LopHocModel> listLH = new LopHocDao().getAllLopHocByMaKhoaHoc(maKhoa);
//        return (listLH != null) ? new ResponseEntity<List<LopHocModel>>(listLH, HttpStatus.OK) : new ResponseEntity<List<LopHocModel>>(HttpStatus.NOT_FOUND);
//    }
//
//    @RequestMapping(value = "/xyz/khoaHoc", method = RequestMethod.GET)
//    public ResponseEntity<List<KhoaHocModel>> getAllKhoaHocBy() {
//        List<KhoaHocModel> listKH = new KhoaHocDao().getAllKH();
//        return (listKH != null) ? new ResponseEntity<List<KhoaHocModel>>(listKH, HttpStatus.OK) : new ResponseEntity<List<KhoaHocModel>>(HttpStatus.NOT_FOUND);
//    }

}
