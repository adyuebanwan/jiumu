package com.netease.jiumu.app.category.dao;

import com.netease.jiumu.app.model.Category;

import java.util.List;
import java.util.Map;
public interface CategoryDao{
    Category getCategory(Map<String, Object> query);
    Long insertCategory(Category entity);
    void batchInsertCategory(List<Category> list);
    void batchUpdateCategory(List<Category> list);
    void updateCategory(Category entity);
    List<Category> getCategoryList(Map<String, Object> query);
    Integer getCategoryListCount(Map<String, Object> query);
    void truncateCategory();
    void deleteCategory(Map<String, Object> query);
    //id list
    void batchDeleteCategory(List<Long> list);
}
