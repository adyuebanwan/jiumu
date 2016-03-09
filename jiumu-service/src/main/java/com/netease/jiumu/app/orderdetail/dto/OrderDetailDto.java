package com.netease.jiumu.app.orderdetail.dto;

import com.netease.jiumu.app.model.OrderDetail;

import java.math.BigDecimal;

/**
* Created by www.magicalcoder.com.
* 799374340@qq.com
*/
public class OrderDetailDto extends OrderDetail {
    private BigDecimal totalAmount;

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }
}
