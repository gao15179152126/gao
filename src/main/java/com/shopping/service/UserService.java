package com.shopping.service;

import com.shopping.pojo.User;
import org.springframework.web.multipart.MultipartFile;

/**
 * @InterfaceName UserService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 11:01
 * @Version 1.0
 **/
public interface UserService {

    /**
     * 检查用户名是否存在
     *
     * @param username 1
     * @return int
     */
    int checkUsername(String username);

    /**
     * 新用户注册
     *
     * @param user 1
     * @param file 2
     * @return java.lang.String
     */
    String register(User user, MultipartFile file);

    /**
     * 登录验证
     *
     * @param username 1
     * @param password 1
     * @return java.lang.String
     */
    String checkLogin(String username, String password);

    /**
     * 更新session用户信息
     *
     * @param username 1
     * @return com.shopping.pojo.User
     */
    User updateUserInformation(String username);

    /**
     * 通过id更新session用户信息
     *
     * @param id 1
     * @return com.shopping.pojo.User
     */
    User updateUserInformationById(int id);

    /**
     * 修改密码检查旧密码与新密码是否正确
     *
     * @param username 1
     * @param password 2
     * @return java.lang.String
     */
    String checkOldPassword(String username, String password);

    /**
     * 修改用户密码
     *
     * @param username 1
     * @param password 2
     * @return int
     */
    int changePassword(String username, String password);

    /**
     * 用户充值
     *
     * @param id    1
     * @param money 2
     * @return int
     */
    int investMoney(int id, double money);

    /**
     * 升级用户vip
     *
     * @param id 1
     * @return String
     */
    String addUserVip(int id);
}
