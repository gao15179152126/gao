package com.shopping.service;

import com.shopping.pojo.User;

/**
 * @InterfaceName UserService
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 11:01
 * @Version 1.0
 **/
public interface UserService {
    User checkLogin(String username,String password);
    void regist(User user);
}
