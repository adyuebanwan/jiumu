package com.netease.jiumu.app.ordermain.service.impl;

import com.netease.jiumu.app.ordermain.dao.OrderMainDao;
import com.netease.jiumu.app.ordermain.service.OrderMainService;
import com.netease.jiumu.app.model.OrderMain;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Component("orderMainService")
public class OrderMainServiceImpl implements OrderMainService{
    @Resource(name="orderMainDao")
    private OrderMainDao orderMainDao;
    @Override
    public OrderMain getOrderMain(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        return orderMainDao.getOrderMain(query);
    }
    @Override
    public Long insertOrderMain(OrderMain entity) {
        //校验
        return orderMainDao.insertOrderMain(entity);
    }

    @Override
    public void batchInsertOrderMain(List<OrderMain> list) {
        //校验
        orderMainDao.batchInsertOrderMain(list);
    }
    @Override
    public void batchUpdateOrderMain(List<OrderMain> list) {
        //校验
        orderMainDao.batchUpdateOrderMain(list);
    }
    @Override
    public void updateOrderMain(OrderMain entity) {
        //校验
        orderMainDao.updateOrderMain(entity);
    }
    @Override
    public List<OrderMain> getOrderMainList(Map<String, Object> query) {
        return orderMainDao.getOrderMainList(query);
    }
    @Override
    public Integer getOrderMainListCount(Map<String, Object> query) {
        return orderMainDao.getOrderMainListCount(query);
    }


    @Override
    public void truncateOrderMain() {
        orderMainDao.truncateOrderMain();
    }
    @Override
    public void deleteOrderMain(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        orderMainDao.deleteOrderMain(query);
    }
    @Override
    public void batchDeleteOrderMain(List<Long> list) {
        orderMainDao.batchDeleteOrderMain(list);
    }
}
