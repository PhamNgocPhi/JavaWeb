/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.GiaoVienDao;
import dao.UserDao;
import java.sql.Date;
import java.sql.SQLException;
import model.GiaoVienModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/giaovien")
public class GiaoVienCntroller {

    GiaoVienDao gvDao = new GiaoVienDao();

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getAll(ModelMap modelMap) {
        modelMap.put("listGV", gvDao.findAll());
        return "admin/giaovien";
    }

    @RequestMapping(value = "/them-giao-vien", method = RequestMethod.GET)
    public String creatGV(ModelMap modelMap) {
        return "admin/ThemGiaoVien";
    }

    @RequestMapping(value = "/them-giao-vien", method = RequestMethod.POST)
    public String creatGV(@RequestParam("hoten") String hoten, @RequestParam("ngaysinh") Date ngaysinh, @RequestParam("gioitinh") Boolean gioitinh,
            @RequestParam("sdt") String sdt, @RequestParam("email") String email, @RequestParam("pass") String pass, ModelMap modelMap) throws SQLException {
        UserDao userDao = new UserDao();
        Boolean creatUser = userDao.insertUser(email, pass, "GV");
        if (creatUser == true) {
            int userId = userDao.loginUser(email, pass).getUserId();
            Boolean insertGV = gvDao.insertGV(hoten, ngaysinh, gioitinh, sdt, userId, true);
            if (insertGV == true) {
                return "redirect:/giaovien.html";
            } else {
                modelMap.put("message", "Them that bai");
                return "admin/ThemGiaoVien";
            }

        } else {
            modelMap.put("message", "Them that bai");
            return "admin/ThemGiaoVien";
        }
    }

    @RequestMapping(value = "/{id}/sua-giao-vien", method = RequestMethod.POST)
    public String updateGV(@RequestParam("id") long id, @RequestParam("name") String name, @RequestParam("ngaysinh") Date ngaysinh, @RequestParam("sdt") String sdt, @RequestParam("gioitinh") Boolean gioitinh, @RequestParam("tinhtrang") Boolean tinhtrang, ModelMap modelMap) {
        Boolean updateGV = gvDao.updateGV(id, name, ngaysinh, sdt, gioitinh, tinhtrang);
        if (updateGV == true) {
            return "redirect:/giaovien.html";
        } else {
            modelMap.put("message", "Cập nhật thất bại");
            return "admin/edit_GV";
        }

    }

    @RequestMapping(value = "/sua-giao-vien", method = RequestMethod.GET)
    public @ResponseBody ModelAndView updateGV(@RequestParam("id") long id, Model model) {
        GiaoVienModel gv = gvDao.findGVById(id);
        ModelAndView modelAndView = new ModelAndView("admin/edit_GV", "gv", gv);
        return modelAndView;
    }

}
