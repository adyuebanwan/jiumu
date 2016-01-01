package com.netease.jiumu.app.goods.service;

import com.netease.jiumu.app.model.Goods;

import java.util.List;
import java.util.Map;
public interface GoodsService{
    Goods getGoods(Long id);
    Long insertGoods(Goods entity);
    void batchInsertGoods(List<Goods> list);
    void batchUpdateGoods(List<Goods> list);
    void updateGoods(Goods entity);
    List<Goods> getGoodsList(Map<String, Object> query);
    Integer getGoodsListCount(Map<String, Object> query);

    void truncateGoods();
    void deleteGoods(Long id);
    void batchDeleteGoods(List<Long> list);
}
