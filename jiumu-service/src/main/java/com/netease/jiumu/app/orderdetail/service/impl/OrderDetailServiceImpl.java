package com.netease.jiumu.app.orderdetail.service.impl;

import com.netease.jiumu.app.orderdetail.dao.OrderDetailDao;
import com.netease.jiumu.app.orderdetail.service.OrderDetailService;
import com.netease.jiumu.app.model.OrderDetail;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Component("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService{
    @Resource(name="orderDetailDao")
    private OrderDetailDao orderDetailDao;
    @Override
    public OrderDetail getOrderDetail(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        return orderDetailDao.getOrderDetail(query);
    }
    @Override
    public Long insertOrderDetail(OrderDetail entity) {
        //校验
        return orderDetailDao.insertOrderDetail(entity);
    }

    @Override
    public void batchInsertOrderDetail(List<OrderDetail> list) {
        //校验
        orderDetailDao.batchInsertOrderDetail(list);
    }
    @Override
    public void batchUpdateOrderDetail(List<OrderDetail> list) {
        //校验
        orderDetailDao.batchUpdateOrderDetail(list);
    }
    @Override
    public void updateOrderDetail(OrderDetail entity) {
        //校验
        orderDetailDao.updateOrderDetail(entity);
    }
    @Override
    public List<OrderDetail> getOrderDetailList(Map<String, Object> query) {
        return orderDetailDao.getOrderDetailList(query);
    }
    @Override
    public Integer getOrderDetailListCount(Map<String, Object> query) {
        return orderDetailDao.getOrderDetailListCount(query);
    }


    @Override
    public void truncateOrderDetail() {
        orderDetailDao.truncateOrderDetail();
    }
    @Override
    public void deleteOrderDetail(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        orderDetailDao.deleteOrderDetail(query);
    }
    @Override
    public void batchDeleteOrderDetail(List<Long> list) {
        orderDetailDao.batchDeleteOrderDetail(list);
    }
}
