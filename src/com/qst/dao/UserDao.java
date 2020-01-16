package com.qst.dao;

import com.qst.po.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDao {
    User findUser(User user) throws Exception;
    void addUser(User user) throws Exception;
    void reSize(@Param("username") String username, @Param("formatSize") String formatSize) throws Exception;
//    User findUserByUserName(String username) throws Exception;
    String getCountSize(String username) ;
}
