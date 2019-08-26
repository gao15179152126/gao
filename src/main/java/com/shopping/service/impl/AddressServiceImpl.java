package com.shopping.service.impl;

import com.shopping.dao.AddressDao;
import com.shopping.pojo.UserAddress;
import com.shopping.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName AddressServiceImpl
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/22 10:11
 * @Version 1.0
 **/
@Service
public class AddressServiceImpl implements AddressService {

    private final AddressDao addressDao;

    @Autowired
    public AddressServiceImpl(AddressDao addressDao) {
        this.addressDao = addressDao;
    }

    @Override
    public int addUserAddress(String username, String address) {
        return addressDao.addUserAddress(username, address);
    }

    @Override
    public List<UserAddress> queryUserAddress(String username) {
        return addressDao.queryUserAddress(username);
    }

    @Override
    public int delUserAddress(String username, int userAddressId) {
        return addressDao.delUserAddress(username, userAddressId);
    }

    @Override
    public List<String> queryUserAddressByUsername(String username) {
        return addressDao.queryUserAddressByUsername(username);
    }
}
