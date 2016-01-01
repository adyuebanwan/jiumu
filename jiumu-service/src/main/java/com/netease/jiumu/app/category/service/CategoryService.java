package com.netease.jiumu.app.category.service;

import com.netease.jiumu.app.model.Category;

import java.util.List;
import java.util.Map;
public interface CategoryService{
    Category getCategory(Long id);
    Long insertCategory(Category entity);
    void batchInsertCategory(List<Category> list);
    void batchUpdateCategory(List<Category> list);
    void updateCategory(Category entity);
    List<Category> getCategoryList(Map<String, Object> query);
    Integer getCategoryListCount(Map<String, Object> query);

    void truncateCategory();
    void deleteCategory(Long id);
    void batchDeleteCategory(List<Long> list);
}
