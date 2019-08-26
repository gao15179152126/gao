package com.shopping.controller;

import com.shopping.pojo.User;
import com.shopping.pojo.UserAddress;
import com.shopping.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName addressController
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/22 9:37
 * @Version 1.0
 **/
@Controller
@RequestMapping("address")
public class AddressController {

    private final AddressService addressService;

    @Autowired
    public AddressController(AddressService addressService) {
        this.addressService = addressService;
    }

    /**
     * 添加用户地址
     */
    @RequestMapping("addUserAddress")
    @ResponseBody
    public int addUserAddress(String address, HttpSession session) {
        String username = ((User) session.getAttribute("user")).getUsername();
        return addressService.addUserAddress(username, address);
    }

    /**
     * 查询用户地址
     */
    @RequestMapping("viewUserAddress")
    @ResponseBody
    public Map viewUserAddress(HttpSession session) {
        String username = ((User) session.getAttribute("user")).getUsername();
        Map<String, List<UserAddress>> map = new HashMap<>(1);
        map.put("result", addressService.queryUserAddress(username));
        return map;
    }

    /**
     * 删除用户地址
     */
    @RequestMapping("delUserAddress")
    @ResponseBody
    public int delUserAddress(int userAddressId, HttpSession session) {
        String username = ((User) session.getAttribute("user")).getUsername();
        return addressService.delUserAddress(username, userAddressId);
    }
}
