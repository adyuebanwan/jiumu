package com.netease.jiumu.app.dto;

import com.netease.jiumu.app.model.Category;
import com.netease.jiumu.app.model.Goods;

import java.util.List;

/**
 * Created by Administrator on 2016/1/3.
 */
public class IndexDto {
    private List<Goods> topList;
    private Goods topCategory;
    private Category category;

    public List<Goods> getTopList() {
        return topList;
    }

    public void setTopList(List<Goods> topList) {
        this.topList = topList;
    }

    public Goods getTopCategory() {
        return topCategory;
    }

    public void setTopCategory(Goods topCategory) {
        this.topCategory = topCategory;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
