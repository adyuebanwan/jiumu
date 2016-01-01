package com.netease.jiumu.app.orderdetail.service;

import com.netease.jiumu.app.model.OrderDetail;

import java.util.List;
import java.util.Map;
public interface OrderDetailService{
    OrderDetail getOrderDetail(Long id);
    Long insertOrderDetail(OrderDetail entity);
    void batchInsertOrderDetail(List<OrderDetail> list);
    void batchUpdateOrderDetail(List<OrderDetail> list);
    void updateOrderDetail(OrderDetail entity);
    List<OrderDetail> getOrderDetailList(Map<String, Object> query);
    Integer getOrderDetailListCount(Map<String, Object> query);

    void truncateOrderDetail();
    void deleteOrderDetail(Long id);
    void batchDeleteOrderDetail(List<Long> list);
}
