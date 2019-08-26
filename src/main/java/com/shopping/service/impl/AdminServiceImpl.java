package com.shopping.service.impl;

import com.shopping.dao.OrderDao;
import com.shopping.dao.ProductDao;
import com.shopping.dao.UserDao;
import com.shopping.pojo.Order;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.Product;
import com.shopping.pojo.User;
import com.shopping.service.AdminService;
import com.shopping.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * @ClassName AdminServiceImpl
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/15 12:16
 * @Version 1.0
 **/
@Service
public class AdminServiceImpl implements AdminService {

    private final int row = 8;
    private final UserDao userDao;
    private final ProductDao productDao;
    private final OrderDao orderDao;

    @Autowired
    public AdminServiceImpl(UserDao userDao, ProductDao productDao, OrderDao orderDao) {
        this.userDao = userDao;
        this.productDao = productDao;
        this.orderDao = orderDao;
    }

    @Override
    public int countPage() {
        int allMount = userDao.countAllUser();
        int totalPage = allMount / row;
        if (allMount % row != 0) {
            totalPage += 1;
        }
        return totalPage;
    }

    @Override
    public List<User> pagedQueryUserByPage(int page) {
        int start = (page - 1) * row;
        return userDao.queryAllUserByPage(start, row);
    }

    @Override
    public int countPageByName(String username) {
        String queryUsername = "%" + username + "%";
        int allMount = userDao.countAllUserByUsername(queryUsername);
        int totalPage = allMount / row;
        if (allMount % row != 0) {
            totalPage += 1;
        }
        return totalPage;
    }

    @Override
    public List<User> pagedQueryUserByPageAndName(int page, String username) {
        int start = (page - 1) * row;
        String queryUsername = "%" + username + "%";
        return userDao.queryAllUserByPageAndName(start, row, queryUsername);
    }

    @Override
    public int changeUserStatus(int id, String status) {
        return userDao.changeUserStatus(id, status);
    }

    @Override
    public int clearUserPoint(int id) {
        return userDao.clearUserPoint(id);
    }

    @Override
    public List<Product> queryProductByType(String type) {
        return productDao.queryProductByType(type);
    }

    @Override
    public int setProductNumberById(int id, int number) {
        return productDao.setProductNumberById(id, number);
    }

    @Override
    public int setProductPriceById(int id, double price) {
        return productDao.setProductPriceById(id, price);
    }

    @Override
    public int setProductNameById(int id, String name) {
        return productDao.setProductNameById(id, name);
    }

    @Override
    public String getProductImageById(int id) {
        return productDao.queryProductImageById(id);
    }

    @Override
    public int updateProductImageById(int id, MultipartFile file) throws Exception {
        String productImagePath = "C:\\upload\\";
        String oldImageName = productDao.queryProductImageById(id);
        String delImagePath = productImagePath + oldImageName;
        File delImageFile = new File(delImagePath);
        delImageFile.delete();
        String newImageName = UploadUtil.uploadImage(file, "");
        return productDao.setProductImageById(id, newImageName);
    }

    @Override
    public List<Order> queryOrderByStatus(String status) {
        List<Order> statusOrders = orderDao.queryOrderByStatus(status);
        for (Order statusOrder : statusOrders) {
            List<OrderDetail> orderDetails = orderDao.queryOrderDetailByNo(statusOrder.getOrderNo());
            for (OrderDetail orderDetail : orderDetails) {
                orderDetail.setProductName(orderDao.queryProductNameById(orderDetail.getProductId()));
            }
            statusOrder.setOrderDetails(orderDetails);
        }
        return statusOrders;
    }

    @Override
    public void finishOrder(String orderNo) {
        orderDao.changeOrderStatus(orderNo, "已完成");
    }

    @Override
    public Order queryOrderByNo(String orderNo) {
        Order order = orderDao.queryOrderByNo(orderNo);
        List<OrderDetail> orderDetails = orderDao.queryOrderDetailByNo(orderNo);
        for (OrderDetail orderDetail : orderDetails) {
            orderDetail.setProductName(orderDao.queryProductNameById(orderDetail.getProductId()));
        }
        if (order != null) {
            order.setOrderDetails(orderDetails);
        }
        return order;
    }

    @Override
    public List<Order> queryOrderByDate(Date startDate, Date endDate) {
        List<Order> dateOrders = orderDao.queryOrderByDate(startDate, endDate);
        for (Order dateOrder : dateOrders) {
            List<OrderDetail> orderDetails = orderDao.queryOrderDetailByNo(dateOrder.getOrderNo());
            for (OrderDetail orderDetail : orderDetails) {
                orderDetail.setProductName(orderDao.queryProductNameById(orderDetail.getProductId()));
            }
            dateOrder.setOrderDetails(orderDetails);
        }
        return dateOrders;
    }

    @Override
    public List<OrderDetail> queryOrderDetailByNo(String orderNo) {
        List<OrderDetail> orderDetails = orderDao.queryOrderDetailByNo(orderNo);
        for (OrderDetail orderDetail : orderDetails) {
            orderDetail.setProductName(orderDao.queryProductNameById(orderDetail.getProductId()));
        }
        return orderDetails;
    }

}
