package com.shopping.service.impl;

import com.shopping.dao.UserDao;
import com.shopping.pojo.User;
import com.shopping.service.UserService;
import com.shopping.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * @ClassName UserServiceImpl
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 11:02
 * @Version 1.0
 **/
@Service
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public int checkUsername(String username) {
        return userDao.checkUsernameExist(username);
    }

    @Override
    public String register(User user, MultipartFile file) {
        String headImageName = null;
        try {
            headImageName = UploadUtil.uploadImage(file, "headImage");
        } catch (Exception e) {
            e.printStackTrace();
        }
        user.setHeadImage(headImageName);
        userDao.register(user);
        return "注册成功";
    }

    @Override
    public String checkLogin(String username, String password) {
        String passwordData = userDao.queryPassword(username);
        if ("".equals(passwordData) || passwordData == null) {
            return "用户名不存在";
        } else if (passwordData.equals(password)) {
            String forbidden = "禁用";
            if (forbidden.equals(userDao.queryUserStatusByUsername(username))){
                return "该用户已禁用";
            }
            return "登录成功";
        } else {
            return "密码错误";
        }
    }

    @Override
    public User updateUserInformation(String username) {
        return userDao.updateUserInformation(username);
    }

    @Override
    public User updateUserInformationById(int id) {
        return userDao.updateUserInformationById(id);
    }

    @Override
    public String checkOldPassword(String username, String password) {
        String oldPassword = userDao.queryPassword(username);
        if (password.equals(oldPassword)) {
            return "密码正确";
        } else {
            return "密码错误";
        }
    }

    @Override
    public int changePassword(String username, String password) {
        return userDao.changePassword(username, password);
    }

    @Override
    public int investMoney(int id, double money) {
        return userDao.updateUserBalance(id, money);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String addUserVip(int id) {
        double userPoint = userDao.queryUserPointById(id);
        int userVip = userDao.queryUserVipById(id);
        double upgrade = 200;
        int maxVip = 5;
        if (userPoint < upgrade) {
            return "用户积分不足";
        } else if (userVip > maxVip) {
            return "已经成为最高会员等级";
        } else {
            userDao.changeUserPointById(id, -upgrade);
            userDao.addUserVip(id);
        }
        return "升级成功";
    }
}
