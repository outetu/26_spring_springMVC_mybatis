package com.qst.controller;

import com.qst.po.User;
import com.qst.service.FilesServiceImpl;
import com.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {
    @Autowired
    private UserService userService;
    /**
     * Ö÷Ò³ÃæÒ³Ãæ
     * @param request
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request) throws Exception {
        String username = (String) request.getSession().getAttribute(User.NAMESPACE);
        System.out.println("indexusername"+username);
        String countSize = userService.getCountSize(username);
        request.setAttribute("countSize", countSize);
        System.out.println("countsize:"+countSize);
        return "index";
    }
}


