package controller;

import dao.HocVienDao;
import dao.UserDao;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import model.userModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Pham Ngoc Phi
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping(value = "/dang-nhap-va-dang-ky", method = RequestMethod.GET)
    public String getView(ModelMap modelMap) {
        return "client/signup";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String singin(@RequestParam(value = "email", required = true) String email, @RequestParam(value = "pass", required = true) String pass, ModelMap modelMap, HttpServletRequest request) throws SQLException {
        userModel u = new userModel();
        UserDao userDao = new UserDao();
        u = userDao.loginUser(email, pass);

        if (u != null) {
            request.getSession().setAttribute("userSession", u);
            String uRole = u.getRoleName();
            String result = "";
            switch (uRole) {
                case "USER":
                    result = "redirect:/home.html";
                    break;
                case "GV":
                    result = "redirect:/home.html";
                    break;
                case "ADMIN":
                    result = "redirect:/hocvien/danh-sach-hoc-vien.html";
                    break;
            }
            return result;

        } else {
            modelMap.put("message", "Địa chỉ email hoặc mật khẩu không đúng");
            return "client/signup";
        }
    }

    @RequestMapping(value = "/dang-ky-tai-khoan", method = RequestMethod.POST)
    public String signupHV(@RequestParam(value = "hoten") String hoten, @RequestParam(value = "email") String email, @RequestParam(value = "pass") String pass, @RequestParam(value = "sdt") long sdt, ModelMap modelMap) throws SQLException {
        UserDao userDao = new UserDao();
        userModel u = new userModel();
        String resultString;
        Boolean result = userDao.insertUser(email, pass, "USER");
        if (result == true) {
            u = userDao.loginUser(email, pass);
            int UserId = u.getUserId();
            Boolean insertResult = userDao.insertHV(hoten, sdt, UserId);
            if (insertResult == true) {
                resultString = "redirect:/home.html";
            } else {
                modelMap.put("message", "Đăng ký không thành công");
                resultString = "client/signup";
            }
        } else {
            modelMap.put("message", "Đăng ký không thành công");
            resultString = "client/signup";
        }
        return resultString;
    }
    
    @RequestMapping(value="checkEmail", method = RequestMethod.POST)
    public int checkEmail(@RequestParam(value = "email") String email){
        UserDao userDao = new UserDao();
        Boolean result = userDao.checkEmail(email);
        if(result == true) return 1;
        return 0;
    }
    
    @RequestMapping(value = "/logout", method=RequestMethod.GET)
    public String logout(ModelMap modelMap, HttpServletRequest request) {
        request.getSession().removeAttribute("userSession");
        return "redirect:/user/dang-nhap-va-dang-ky.html";
    }
}
