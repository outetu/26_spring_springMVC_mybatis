package com.qst.service;

import javax.servlet.http.HttpServletRequest;

import static org.aspectj.weaver.NameMangler.PREFIX;

public class UP {
    public String getRootPath(HttpServletRequest request) {

        String rootPath = request.getSession().getServletContext().getRealPath("/") + PREFIX;
        return rootPath;
    }
}
