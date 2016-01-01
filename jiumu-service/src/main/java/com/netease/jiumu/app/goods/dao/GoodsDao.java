package com.netease.jiumu.app.goods.dao;

import com.netease.jiumu.app.model.Goods;

import java.util.List;
import java.util.Map;
public interface GoodsDao{
    Goods getGoods(Map<String, Object> query);
    Long insertGoods(Goods entity);
    void batchInsertGoods(List<Goods> list);
    void batchUpdateGoods(List<Goods> list);
    void updateGoods(Goods entity);
    List<Goods> getGoodsList(Map<String, Object> query);
    Integer getGoodsListCount(Map<String, Object> query);
    void truncateGoods();
    void deleteGoods(Map<String, Object> query);
    //id list
    void batchDeleteGoods(List<Long> list);
}
