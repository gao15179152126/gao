package com.shopping.dao;

import com.shopping.pojo.UserAddress;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName AddressDao
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/22 9:43
 * @Version 1.0
 **/
public interface AddressDao {
    /**
     * 添加用户地址
     *
     * @param username 1
     * @param address  2
     * @return int
     */
    int addUserAddress(@Param("username") String username, @Param("address") String address);

    /**
     * 查询用户地址
     *
     * @param username 1
     * @return java.util.List<java.lang.String>
     */
    List<UserAddress> queryUserAddress(String username);

    /**
     * 删除用户地址
     *
     * @param username      1
     * @param userAddressId 2
     * @return int
     */
    int delUserAddress(@Param("username") String username, @Param("userAddressId") int userAddressId);

    /**
     * 查询当前用户地址
     *
     * @param username 1
     * @return java.util.List<java.lang.String>
     */
    List<String> queryUserAddressByUsername(String username);
}
