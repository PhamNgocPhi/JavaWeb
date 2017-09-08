
package controller;

import dao.DangKyHocDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Pham Ngoc Phi
 */
@Controller
@RequestMapping(value="/home")
public class HomeController {
    @RequestMapping(method=RequestMethod.GET)
    public String home(Model model){
        return "client/home";
    }
    @RequestMapping(value="/cam-nhan-cua-hoc-vien",method=RequestMethod.GET)
    public String camNhan(Model model){
        return "client/camnhan";
    }
    
    @RequestMapping(value="/doi-ngu-su-gia",method=RequestMethod.GET)
    public String suGia(Model model){
        return "client/sugia";
    }
    
    @RequestMapping(value="/trang-ca-nhan",method=RequestMethod.GET)
    public String trangCaNhan(ModelMap modelMap){
        return "client/trangcanhan";
    }
    
    @RequestMapping(value="/huyDangKy",method=RequestMethod.POST)
    public String huyDangKy(@RequestParam("id") long id,ModelMap modelMap){
        DangKyHocDao dkDao = new DangKyHocDao();
        Boolean result = dkDao.deleteDKHoc(id);
        if(result == true) return "redirect:/home/trang-ca-nhan.html";
        return "redirect:/home/trang-ca-nhan.html";
    }
    
}
