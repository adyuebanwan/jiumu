package com.netease.jiumu.app.category.service.impl;

import com.netease.jiumu.app.category.dao.CategoryDao;
import com.netease.jiumu.app.category.dto.CategoryListDto;
import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.model.Category;
import com.netease.worldhero.core.common.utils.ListUtils;
import com.netease.worldhero.core.common.utils.MapUtil;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
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

    @Override
    public List<CategoryListDto> list() {
        List<Category> categoryList = getCategoryList(MapUtil.buildMap("parentId",0L,"orderBy"," sort_num asc"));
        List<Category> childList = getCategoryList(MapUtil.buildMap("whereSql"," and parent_id != 0 ","orderBy"," sort_num asc"));
        List<CategoryListDto> list = new ArrayList<CategoryListDto>();
        if(ListUtils.isNotBlank(categoryList)){
            for(Category category:categoryList){
                CategoryListDto dto = new CategoryListDto();
                dto.setCategory(category);
                List<Category> chidren = new ArrayList<Category>();
                for(Category child:childList){
                    if(child.getParentId().compareTo(category.getId())==0){
                        chidren.add(child);
                    }
                }
                dto.setChildren(chidren);
                list.add(dto);
            }
        }

        return list;
    }
}
