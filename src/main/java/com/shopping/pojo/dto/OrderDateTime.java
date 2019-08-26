package com.shopping.pojo.dto;

import java.util.Date;

/**
 * @ClassName orderDateTime
 * @Description TODO
 * @Author Zhaohui.Gao
 * @DateTime 2019/8/13 17:25
 * @Version 1.0
 **/
public class OrderDateTime {
    /**
     * 订单号
     */
    private String orderNo;
    /**
     * 订单时间
     */
    private Date dateTime;

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }
}
