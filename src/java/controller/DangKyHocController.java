/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DangKyHocDao;
import dao.KhoaHocDao;
import dao.LopHocDao;
import java.text.DecimalFormat;
import javax.servlet.http.HttpServletRequest;
import model.LopHocModel;
import model.userModel;
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
@RequestMapping("/dang-ky-hoc")
public class DangKyHocController {
    
    LopHocDao lh = new LopHocDao();
    KhoaHocDao kh = new KhoaHocDao();
    DangKyHocDao dkDao = new DangKyHocDao();
    
    @RequestMapping(value="", method = RequestMethod.GET)
    public String getView(ModelMap modelMap){
        modelMap.put("listMaKH",lh.getMaKHinLH("2"));
        return "client/dangkyhoc";
    }
    
    @RequestMapping(value = "/loadModal", method = RequestMethod.GET)
    public @ResponseBody ModelAndView showModal(@RequestParam("id") long id, ModelMap modelMap, HttpServletRequest request) {
        LopHocModel lopHoc = lh.findLopById(id);
        ModelAndView modelAndView = new ModelAndView("client/modal_dkhoc", "lop", lopHoc);
        return modelAndView;
    }
    
    @RequestMapping(value = "/loadModal", method = RequestMethod.POST)
    public String dangKyHoc(@RequestParam("maHV") int maHV, @RequestParam("maLH") long maLH, ModelMap modelMap){
        Boolean result = dkDao.insertDKHoc(maHV, maLH, false);
        if(result == true){
            return "redirect:/dang-ky-hoc.html";
        } else {
            return "redirect:/dang-ky-hoc.html";
        }
    }
}
