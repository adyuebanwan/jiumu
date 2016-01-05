package com.netease.jiumu.app.category.dto;

import com.netease.jiumu.app.model.Category;

import java.util.List;

/**
 * Created by hzhedongyu on 2016/1/5.
 */
public class CategoryListDto {
    private Category category;
    private List<Category> children;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Category> getChildren() {
        return children;
    }

    public void setChildren(List<Category> children) {
        this.children = children;
    }
}
