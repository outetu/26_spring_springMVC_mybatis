package com.qst.service;

import com.qst.po.User;
import org.apache.ibatis.annotations.Param;


public interface UserService {
    User findUser(User user) throws Exception;
    public boolean addUser(User user) throws Exception;
    void reSize(@Param("username") String username, @Param("formatSize") String formatSize) throws Exception;
   // User findUserByUserName(String username) throws Exception;
    String getCountSize(String username) throws Exception;
}
