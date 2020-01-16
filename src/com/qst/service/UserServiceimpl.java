package com.qst.service;
import com.qst.dao.UserDao;
import com.qst.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceimpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User findUser(User user) throws Exception {
        User exsitUser = userDao.findUser(user);
        return exsitUser;
    }

    @Override
    public boolean addUser(User user) throws Exception {
         userDao.addUser(user);
        return true;
    }

    @Override
    public void reSize(String username, String formatSize) throws Exception {
        userDao.reSize(username,formatSize);
    }

    @Override
    public String getCountSize(String username) {
            String countSize = null;
            try {
                countSize = userDao.getCountSize(username);
            } catch (Exception e) {
                e.printStackTrace();
                return countSize;
            }
            return countSize;
        }
    }


