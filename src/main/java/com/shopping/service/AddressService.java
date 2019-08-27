package com.shopping.service;

import com.shopping.pojo.UserAddress;

import java.util.List;

/**
 * @InterfaceName AddressService
 * @Description 地址接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/22 10:10
 * @Version 1.0
 **/
public interface AddressService {

    /**
     * 增加用户地址
     *
     * @param username 用户名
     * @param address  地址
     * @return int
     */
    int addUserAddress(String username, String address);

    /**
     * 查询用户地址
     *
     * @param username 用户名
     * @return java.util.List<java.lang.String>
     */
    List<UserAddress> queryUserAddress(String username);

    /**
     * 删除用户地址
     *
     * @param username      用户名
     * @param userAddressId 用户地址id
     * @return int
     */
    int delUserAddress(String username, int userAddressId);

    /**
     * 查询当前用户地址
     *
     * @param username 用户名
     * @return java.util.List<java.lang.String>
     */
    List<String> queryUserAddressByUsername(String username);
}
