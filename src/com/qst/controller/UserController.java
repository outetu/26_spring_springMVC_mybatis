package com.qst.controller;

import com.qst.po.User;
import com.qst.service.FilesServiceImpl;
import com.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;

import static com.qst.service.FilesServiceImpl.PREFIX;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private FilesServiceImpl filesServiceImpl;
        @RequestMapping("login")
        public String login(HttpServletRequest request, User user, ServletResponse response,String ID) throws Exception {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=utf-8");
// System.out.println(user.getUsername());
//            System.out.println(user.getPassword());
           // System.out.println(ID);
            //面包屑导航暂时
//            System.out.println("//面包屑导航第二次username"+user.getUsername());

  //String username = request.getSession().getAttribute(User.NAMESPACE).toString();
    //  System.out.println("username"+ User.NAMESPACE);
//         if ( User.NAMESPACE.equals(ID)){
//             return "index";
//         }
            User exsitUser = userService.findUser(user);
            if (exsitUser != null) {
                HttpSession session = request.getSession();
                session.setAttribute(User.NAMESPACE, exsitUser.getUsername());
                session.setAttribute("totalSize", exsitUser.getTotalSize());
//                String userPath = request.getSession().getServletContext().getRealPath("/") + PREFIX;
//                File file = new File(userPath, user.getUsername());
//                if (!file.exists()){
//                file.mkdir();}
             return"redirect:/index.action";
        }
            else{
//                if (username.equals(ID)){
//                    return "index";
//                }
                    request.setAttribute("msg", "用户名或密码错误");
                    return "login";
                }
            }
    @RequestMapping("/regist")
    public String regist(HttpServletRequest request, User user) throws Exception {
        if(user.getUsername() == null || user.getPassword() == null){
            return "regist";
        }else{
            boolean isSuccess = userService.addUser(user);
            if(isSuccess){
                filesServiceImpl.addNewNameSpace(request, user.getUsername());
                return "login";
            }else{
                request.setAttribute("msg", "注册失败");
                return "regist";
            }
        }
    }
    @RequestMapping("/logout")
    //不足
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }
}
