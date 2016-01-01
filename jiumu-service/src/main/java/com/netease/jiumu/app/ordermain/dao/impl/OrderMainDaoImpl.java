package com.netease.jiumu.app.ordermain.dao.impl;

import com.netease.jiumu.app.ordermain.dao.OrderMainDao;
import com.netease.jiumu.app.model.OrderMain;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Component("orderMainDao")
public class OrderMainDaoImpl   implements OrderMainDao {

    @Resource(name="sqlSessionTemplate")
    private  SqlSessionTemplate  sqlSessionTemplate;
    @Override
    public OrderMain getOrderMain(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("OrderMainMapper.getOrderMain",query);
    }

    @Override
    public void batchInsertOrderMain(List<OrderMain> list) {
        sqlSessionTemplate.insert("OrderMainMapper.batchInsertOrderMain",list);
    }

    @Override
    public void batchUpdateOrderMain(List<OrderMain> list) {
        sqlSessionTemplate.update("OrderMainMapper.batchUpdateOrderMain",list);
    }

    @Override
    public Long insertOrderMain(OrderMain entity) {
        sqlSessionTemplate.insert("OrderMainMapper.insertOrderMain",entity);
        return entity.getId();
    }
    @Override
    public void updateOrderMain(OrderMain entity) {
        sqlSessionTemplate.update("OrderMainMapper.updateOrderMain", entity);
    }
    @Override
    public List<OrderMain> getOrderMainList(Map<String, Object> query) {
        return sqlSessionTemplate.selectList("OrderMainMapper.getOrderMainList", query);
    }
    @Override
    public Integer getOrderMainListCount(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("OrderMainMapper.getOrderMainListCount", query);
    }


    @Override
    public void truncateOrderMain() {
        sqlSessionTemplate.delete("OrderMainMapper.truncateOrderMain");
    }
    @Override
    public void deleteOrderMain(Map<String, Object> query) {
        sqlSessionTemplate.delete("OrderMainMapper.deleteOrderMain",query);
    }
    @Override
    public void batchDeleteOrderMain(List<Long> list) {
        sqlSessionTemplate.delete("OrderMainMapper.batchDeleteOrderMain",list);
    }
}
