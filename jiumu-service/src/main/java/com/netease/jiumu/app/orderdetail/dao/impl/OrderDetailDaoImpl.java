package com.netease.jiumu.app.orderdetail.dao.impl;

import com.netease.jiumu.app.orderdetail.dao.OrderDetailDao;
import com.netease.jiumu.app.model.OrderDetail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Component("orderDetailDao")
public class OrderDetailDaoImpl   implements OrderDetailDao {

    @Resource(name="sqlSessionTemplate")
    private  SqlSessionTemplate  sqlSessionTemplate;
    @Override
    public OrderDetail getOrderDetail(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("OrderDetailMapper.getOrderDetail",query);
    }

    @Override
    public void batchInsertOrderDetail(List<OrderDetail> list) {
        sqlSessionTemplate.insert("OrderDetailMapper.batchInsertOrderDetail",list);
    }

    @Override
    public void batchUpdateOrderDetail(List<OrderDetail> list) {
        sqlSessionTemplate.update("OrderDetailMapper.batchUpdateOrderDetail",list);
    }

    @Override
    public Long insertOrderDetail(OrderDetail entity) {
        sqlSessionTemplate.insert("OrderDetailMapper.insertOrderDetail",entity);
        return entity.getId();
    }
    @Override
    public void updateOrderDetail(OrderDetail entity) {
        sqlSessionTemplate.update("OrderDetailMapper.updateOrderDetail", entity);
    }
    @Override
    public List<OrderDetail> getOrderDetailList(Map<String, Object> query) {
        return sqlSessionTemplate.selectList("OrderDetailMapper.getOrderDetailList", query);
    }
    @Override
    public Integer getOrderDetailListCount(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("OrderDetailMapper.getOrderDetailListCount", query);
    }


    @Override
    public void truncateOrderDetail() {
        sqlSessionTemplate.delete("OrderDetailMapper.truncateOrderDetail");
    }
    @Override
    public void deleteOrderDetail(Map<String, Object> query) {
        sqlSessionTemplate.delete("OrderDetailMapper.deleteOrderDetail",query);
    }
    @Override
    public void batchDeleteOrderDetail(List<Long> list) {
        sqlSessionTemplate.delete("OrderDetailMapper.batchDeleteOrderDetail",list);
    }
}
