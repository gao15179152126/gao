package com.shopping.trigger;

import com.shopping.dao.OrderDao;
import com.shopping.dao.ProductDao;
import com.shopping.pojo.OrderDetail;
import com.shopping.pojo.dto.OrderDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @ClassName OrderCheck
 * @Description 订单定时器
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/13 16:42
 * @Version 1.0
 **/

@Component
public class OrderCheck {

    private final OrderDao orderDao;
    private final ProductDao productDao;

    @Autowired
    public OrderCheck(OrderDao orderDao, ProductDao productDao) {
        this.orderDao = orderDao;
        this.productDao = productDao;
    }

    @Transactional(rollbackFor = Exception.class)
    @Scheduled(cron = "*/1 * * * * ?")
    public void orderCheckTime(){
        List<OrderDateTime> orderDateTimeList = orderDao.queryAllOrderTime();
        for (OrderDateTime orderDateTime:orderDateTimeList){
            Date date = new Date();
            if(date.getTime() - orderDateTime.getDateTime().getTime() > 120000){
                orderDao.changeOrderStatus(orderDateTime.getOrderNo(),"已取消");
                List<OrderDetail> orderDetailList = orderDao.queryOrderDetailByNo(orderDateTime.getOrderNo());
                for (OrderDetail orderDetail:orderDetailList){
                    productDao.changeProductNumberById(orderDetail.getProductId(),orderDetail.getProductNumber());
                }
            }
        }
    }
}
