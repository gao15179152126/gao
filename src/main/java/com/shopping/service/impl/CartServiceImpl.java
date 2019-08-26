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

    private final CartDao cartDao;

    @Autowired
    public CartServiceImpl(CartDao cartDao) {
        this.cartDao = cartDao;
    }

    //添加商品到购物车
    @Override
    public void addCart(String username, int productId, int productNumber) {
        if (cartDao.productIsOrNotExistCart(username, productId) > 0) {
            cartDao.cartProductNumberAdd(username, productId, productNumber);
        } else {
            cartDao.addCart(username, productId, productNumber);
        }
    }

    @Override
    public List<Cart> queryCart(String username) {
        return cartDao.queryCart(username);
    }

    //从购物车删除商品
    @Override
    public void deleteCart(String username, int productId) {
        cartDao.deleteCart(username, productId);
    }

    @Override
    public String getProductNameById(int productId) {
        return cartDao.getProductNameById(productId);
    }

    //商品数量加减
    @Override
    public void cartProductNumberAdd(String username, int productId, int cartNumber) {
        cartDao.cartProductNumberAdd(username, productId, cartNumber);
    }
}
