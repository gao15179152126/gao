package com.shopping.service.impl;

import com.shopping.dao.CartDao;
import com.shopping.pojo.Cart;
import com.shopping.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName OrderServiceImpl
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/7/31 19:44
 * @Version 1.0
 **/
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    @Override
    public void addCart(String username, int productId) {
        cartDao.addCart(username,productId);
    }

    @Override
    public List<Cart> queryCart(String username) {
        return cartDao.queryCart(username);
    }

    @Override
    public void deleteCart(String username, int productId) {
        cartDao.deleteCart(username,productId);
    }

    @Override
    public String getProductNameById(int productId) {
        return cartDao.getProductNameById(productId);
    }
}
