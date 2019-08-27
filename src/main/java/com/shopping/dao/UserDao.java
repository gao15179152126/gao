package com.shopping.dao;

import com.shopping.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName UserDao
 * @Description 用户数据接口
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/23 10:57
 * @Version 1.0
 **/
public interface UserDao {

    /**
     * 检查用户名是否存在
     *
     * @param username 用户名
     * @return int
     */
    int checkUsernameExist(String username);

    /**
     * 新用户注册
     *
     * @param user 用户
     * @return int
     */
    int register(@Param("user") User user);

    /**
     * 根据用户名查询密码
     *
     * @param username 用户名
     * @return java.lang.String
     */
    String queryPassword(String username);

    /**
     * 修改用户密码
     *
     * @param username 用户名
     * @param password 密码
     * @return int
     */
    int changePassword(@Param("username") String username, @Param("password") String password);

    /**
     * 根据用户名重新查询用户信息以更新session中的user
     *
     * @param username 用户名
     * @return com.shopping.pojo.User
     */
    User updateUserInformation(String username);

    /**
     * 根据用户id重新查询用户信息以更新session中的user
     *
     * @param id 用户id
     * @return com.shopping.pojo.User
     */
    User updateUserInformationById(int id);

    /**
     * 根据用户名查询用户余额
     *
     * @param username 用户名
     * @return double
     */
    double queryUserBalance(String username);

    /**
     * 改变用户余额
     *
     * @param username 用户名
     * @param money    金额
     * @return int
     */
    int changeUserBalance(@Param("username") String username, @Param("money") double money);

    /**
     * 改变用户积分
     *
     * @param username 用户名
     * @param point    积分
     * @return int
     */
    int changeUserPoint(@Param("username") String username, @Param("point") double point);

    /**
     * 通过用户id改变用户积分
     *
     * @param id    用户id
     * @param point 积分
     * @return int
     */
    int changeUserPointById(@Param("id") int id, @Param("point") double point);

    /**
     * 计算所有用户数
     *
     * @return int
     */
    int countAllUser();

    /**
     * 根据页码查询用户信息
     *
     * @param start 页码
     * @param row   行
     * @return java.util.List<com.shopping.pojo.User>
     */
    List<User> queryAllUserByPage(@Param("start") int start, @Param("row") int row);

    /**
     * 计算所有相关用户数
     *
     * @param username 用户名
     * @return int
     */
    int countAllUserByUsername(String username);

    /**
     * 根据页码查询相关用户名的用户信息
     *
     * @param start    页码
     * @param row      行
     * @param username 用户名
     * @return java.util.List<com.shopping.pojo.User>
     */
    List<User> queryAllUserByPageAndName(@Param("start") int start, @Param("row") int row, @Param("username") String username);

    /**
     * 改变用户状态
     *
     * @param id     用户id
     * @param status 用户状态
     * @return int
     */
    int changeUserStatus(@Param("id") int id, @Param("status") String status);

    /**
     * 用户积分清零
     *
     * @param id 用户id
     * @return int
     */
    int clearUserPoint(int id);

    /**
     * 改变用户余额
     *
     * @param id    用户id
     * @param money 金额
     * @return int
     */
    int updateUserBalance(@Param("id") int id, @Param("money") double money);

    /**
     * 升级用户vip
     *
     * @param id 用户id
     * @return int
     */
    int addUserVip(int id);

    /**
     * 查询用户积分
     *
     * @param id 用户id
     * @return double
     */
    double queryUserPointById(int id);

    /**
     * 查询用户vip
     *
     * @param id 用户id
     * @return int
     */
    int queryUserVipById(int id);

    /**
     * 根据用户名查询用户状态
     *
     * @param username 用户名
     * @return java.lang.String
     */
    String queryUserStatusByUsername(String username);
}
