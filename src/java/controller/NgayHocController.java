/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.NgayHocDao;
import model.NgayHocModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ThuCuc
 */
@Controller
@RequestMapping("/ngayhoc")
public class NgayHocController {

    NgayHocDao nhDao = new NgayHocDao();

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getView(ModelMap modelMap) {
        modelMap.put("listNH", nhDao.getListNH());
        return "admin/ngayhoc";
    }

    @RequestMapping(value = "/them-ngay-hoc", method = RequestMethod.GET)
    public String insertNH(ModelMap modelMap) {
        return "admin/ThemNgayHoc";
    }

    @RequestMapping(value = "/them-ngay-hoc", method = RequestMethod.POST)
    public String insertNH(@RequestParam("ngayHoc") String ngayHoc, ModelMap modelMap) {
        Boolean result = nhDao.insertNH(ngayHoc);
        if (result == true) {
            return "redirect:/ngayhoc.html";
        } else {
            modelMap.put("message", "thêm thất bại");
            return "admin/ThemNgayHoc";
        }
    }

    @RequestMapping(value = "/{maNH}/sua-ngay-hoc", method = RequestMethod.GET)
    public String editNH(@PathVariable("maNH") int maNH, ModelMap modelMap) {
        NgayHocModel nh = nhDao.findNgayHoc(maNH);
        modelMap.put("nh", nh);
        return "admin/edit_NgayHoc";
    }

    @RequestMapping(value = "/{maNH}/sua-ngay-hoc", method = RequestMethod.POST)
    public String editNH(@RequestParam("maNH") int maNH, @RequestParam("ngayHoc") String ngayHoc, ModelMap modelMap) {
        Boolean result = nhDao.updateNH(maNH, ngayHoc);
        if (result == true) {
            return "redirect:/ngayhoc.html";
        } else {
            modelMap.put("message", "cập nhật thất bại");
            return "admin/edit_NgayHoc";
        }

    }
}
