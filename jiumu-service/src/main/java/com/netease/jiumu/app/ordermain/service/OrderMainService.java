package com.netease.jiumu.app.ordermain.service;

import com.netease.jiumu.app.model.OrderMain;

import java.util.List;
import java.util.Map;
public interface OrderMainService{
    OrderMain getOrderMain(Long id);
    Long insertOrderMain(OrderMain entity);
    void batchInsertOrderMain(List<OrderMain> list);
    void batchUpdateOrderMain(List<OrderMain> list);
    void updateOrderMain(OrderMain entity);
    List<OrderMain> getOrderMainList(Map<String, Object> query);
    Integer getOrderMainListCount(Map<String, Object> query);

    void truncateOrderMain();
    void deleteOrderMain(Long id);
    void batchDeleteOrderMain(List<Long> list);
}
