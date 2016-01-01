package com.netease.jiumu.app.category.service.impl;

import com.netease.jiumu.app.category.dao.CategoryDao;
import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.model.Category;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Component("categoryService")
public class CategoryServiceImpl implements CategoryService{
    @Resource(name="categoryDao")
    private CategoryDao categoryDao;
    @Override
    public Category getCategory(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        return categoryDao.getCategory(query);
    }
    @Override
    public Long insertCategory(Category entity) {
        //校验
        return categoryDao.insertCategory(entity);
    }

    @Override
    public void batchInsertCategory(List<Category> list) {
        //校验
        categoryDao.batchInsertCategory(list);
    }
    @Override
    public void batchUpdateCategory(List<Category> list) {
        //校验
        categoryDao.batchUpdateCategory(list);
    }
    @Override
    public void updateCategory(Category entity) {
        //校验
        categoryDao.updateCategory(entity);
    }
    @Override
    public List<Category> getCategoryList(Map<String, Object> query) {
        return categoryDao.getCategoryList(query);
    }
    @Override
    public Integer getCategoryListCount(Map<String, Object> query) {
        return categoryDao.getCategoryListCount(query);
    }


    @Override
    public void truncateCategory() {
        categoryDao.truncateCategory();
    }
    @Override
    public void deleteCategory(Long id) {
        Map<String,Object> query = new HashMap<String,Object>();
        query.put("id", id);
        categoryDao.deleteCategory(query);
    }
    @Override
    public void batchDeleteCategory(List<Long> list) {
        categoryDao.batchDeleteCategory(list);
    }
}
