package com.shopping.dao;

import com.shopping.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * @InterfaceName UserDao
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 10:57
 * @Version 1.0
 **/
public interface UserDao {
    User findByUsername(String username);
    void regist(@Param("user")User user);
}
