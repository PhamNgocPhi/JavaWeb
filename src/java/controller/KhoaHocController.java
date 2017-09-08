package controller;

import dao.KhoaHocDao;
import model.KhoaHocModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Pham Ngoc Phi
 */
@Controller
@RequestMapping("/khoahoc")
public class KhoaHocController {
    KhoaHocDao khDao = new KhoaHocDao();
    
    @RequestMapping(value="/danh-sach-khoa-hoc", method = RequestMethod.GET)
    public String getView(ModelMap modelMap){
        modelMap.put("listKH", khDao.getAllKH());
        return "admin/khoahoc";
    }
    
    @RequestMapping(value = "/sua-khoa-hoc", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView updateGV(@RequestParam("id") int id, ModelMap modelMap) {
        KhoaHocModel kh = khDao.findKhoaHocByMa(id);
        ModelAndView modelAndView = new ModelAndView("admin/edit_KH","kh", kh);
        return modelAndView;
    }
    
    @RequestMapping(value = "/{id}/sua-khoa-hoc", method = RequestMethod.POST)
    public String updateGV(@RequestParam("id") int id, @RequestParam("tenKH") String tenKH, @RequestParam("soBuoi") int sobuoi,
            @RequestParam("hocPhi") long hocPhi, @RequestParam("moTa") String moTa, @RequestParam("trangThai") Boolean trangThai, ModelMap modelMap) {
        
        Boolean result = khDao.updateKH(id, tenKH, sobuoi, hocPhi, moTa, trangThai);
        if(result == true){
            return "redirect:/khoahoc/danh-sach-khoa-hoc.html";
        }else{
            modelMap.put("message", "cập nhật thất bại");
           return "admin/edit_KH"; 
        }
    }
    
    @RequestMapping(value="/them-khoa-hoc", method=RequestMethod.GET)
    public String insertKH(ModelMap modelMap){
        return "admin/ThemKhoaHoc";
    }
    
    @RequestMapping(value="/them-khoa-hoc", method=RequestMethod.POST)
    public String insertKH(@RequestParam("tenKH") String tenKH,@RequestParam("soBuoi") int soBuoi, @RequestParam("hocPhi") long hocPhi, @RequestParam("moTa") String moTa,ModelMap modelMap){
        Boolean result = khDao.insertKH(tenKH, soBuoi, hocPhi, moTa, true);
        if(result == true){
            return "redirect:/khoahoc/danh-sach-khoa-hoc.html";
        }
        else{
            modelMap.put("message","thêm thất bại");
            return "admin/ThemKhoaHoc";
        }
        
    }
}
