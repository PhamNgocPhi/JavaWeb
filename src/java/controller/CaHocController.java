/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CaHocDao;
import dao.NgayHocDao;
import java.util.List;
import model.CaHocModel;
import model.NgayHocModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Pham Ngoc Phi
 */
@Controller
@RequestMapping("/cahoc")
public class CaHocController {
    
    CaHocDao chDao = new CaHocDao();
    NgayHocDao nhDao = new NgayHocDao();
    
    @RequestMapping(value="", method=RequestMethod.GET)
    public String getView(ModelMap modelMap){
        List<CaHocModel> listCH = chDao.getListCH();
        modelMap.put("listCH",listCH );
        return "admin/cahoc";
    }
    @RequestMapping(value="/{maCH}/sua-ca-hoc", method=RequestMethod.GET)
    public String editCH(@PathVariable("maCH") int maCH ,ModelMap modelMap){
        CaHocModel ch = chDao.findCaHoc(maCH);
        modelMap.put("ch", ch);
        return "admin/edit_CaHoc";
    }
    
    @RequestMapping(value="/{maCH}/sua-ca-hoc", method=RequestMethod.POST, produces="application/x-www-form-urlencoded;charset=UTF-8")
    public String editCH(@RequestParam("maCH") int maCH, @RequestParam("gioHoc") String gioHoc ,ModelMap modelMap){
        Boolean result = chDao.updateCH(maCH, gioHoc);
        if(result == true){
            return "redirect:/cahoc.html";
        }
        else {
            modelMap.put("message","cập nhật thất bại");
            return "admin/edit_CaHoc";
        }
        
    }
        @RequestMapping(value="/them-ca-hoc", method = RequestMethod.GET)
    public String insertCH(ModelMap modelMap){
        return "admin/ThemCaHoc";
    }
    
    @RequestMapping(value="/them-ca-hoc", method = RequestMethod.POST)
    public String insertCH(@RequestParam("gioHoc") String gioHoc, ModelMap modelMap){
        Boolean result = chDao.insertCH(gioHoc);
        if(result == true){
            return "redirect:/cahoc.html";
        }
        else{
            modelMap.put("message", "thêm thất bại");
            return "admin/ThemCaHoc";
        }
       
    }
}
