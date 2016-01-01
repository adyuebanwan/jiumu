package com.netease.jiumu.app.goods.dao.impl;

import com.netease.jiumu.app.goods.dao.GoodsDao;
import com.netease.jiumu.app.model.Goods;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Component("goodsDao")
public class GoodsDaoImpl   implements GoodsDao {

    @Resource(name="sqlSessionTemplate")
    private  SqlSessionTemplate  sqlSessionTemplate;
    @Override
    public Goods getGoods(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("GoodsMapper.getGoods",query);
    }

    @Override
    public void batchInsertGoods(List<Goods> list) {
        sqlSessionTemplate.insert("GoodsMapper.batchInsertGoods",list);
    }

    @Override
    public void batchUpdateGoods(List<Goods> list) {
        sqlSessionTemplate.update("GoodsMapper.batchUpdateGoods",list);
    }

    @Override
    public Long insertGoods(Goods entity) {
        sqlSessionTemplate.insert("GoodsMapper.insertGoods",entity);
        return entity.getId();
    }
    @Override
    public void updateGoods(Goods entity) {
        sqlSessionTemplate.update("GoodsMapper.updateGoods", entity);
    }
    @Override
    public List<Goods> getGoodsList(Map<String, Object> query) {
        return sqlSessionTemplate.selectList("GoodsMapper.getGoodsList", query);
    }
    @Override
    public Integer getGoodsListCount(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("GoodsMapper.getGoodsListCount", query);
    }


    @Override
    public void truncateGoods() {
        sqlSessionTemplate.delete("GoodsMapper.truncateGoods");
    }
    @Override
    public void deleteGoods(Map<String, Object> query) {
        sqlSessionTemplate.delete("GoodsMapper.deleteGoods",query);
    }
    @Override
    public void batchDeleteGoods(List<Long> list) {
        sqlSessionTemplate.delete("GoodsMapper.batchDeleteGoods",list);
    }
}
