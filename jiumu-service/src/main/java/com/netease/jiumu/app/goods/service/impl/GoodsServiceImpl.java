package com.netease.jiumu.app.goods.service.impl;

import com.netease.jiumu.app.goods.dao.GoodsDao;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Goods;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Component("goodsService")
public class GoodsServiceImpl implements GoodsService{
    @Resource(name="goodsDao")
    private GoodsDao goodsDao;
    @Override
    public Goods getGoods(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        return goodsDao.getGoods(query);
    }
    @Override
    public Long insertGoods(Goods entity) {
        //校验
        return goodsDao.insertGoods(entity);
    }

    @Override
    public void batchInsertGoods(List<Goods> list) {
        //校验
        goodsDao.batchInsertGoods(list);
    }
    @Override
    public void batchUpdateGoods(List<Goods> list) {
        //校验
        goodsDao.batchUpdateGoods(list);
    }
    @Override
    public void updateGoods(Goods entity) {
        //校验
        goodsDao.updateGoods(entity);
    }
    @Override
    public List<Goods> getGoodsList(Map<String, Object> query) {
        return goodsDao.getGoodsList(query);
    }
    @Override
    public Integer getGoodsListCount(Map<String, Object> query) {
        return goodsDao.getGoodsListCount(query);
    }


    @Override
    public void truncateGoods() {
        goodsDao.truncateGoods();
    }
    @Override
    public void deleteGoods(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        goodsDao.deleteGoods(query);
    }
    @Override
    public void batchDeleteGoods(List<Long> list) {
        goodsDao.batchDeleteGoods(list);
    }
}
