
package controller;

import dao.HocVienDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 *
 * @author Pham Ngoc Phi
 */
@Controller
@RequestMapping("/hocvien")
public class HocVienController {
    HocVienDao hvDao = new HocVienDao();
    
    @RequestMapping(value="/danh-sach-hoc-vien", method=RequestMethod.GET)
    public String getView(ModelMap modelMap){
        modelMap.put("listHV", hvDao.findAll());
        return "admin/HocVien";
    }
}
