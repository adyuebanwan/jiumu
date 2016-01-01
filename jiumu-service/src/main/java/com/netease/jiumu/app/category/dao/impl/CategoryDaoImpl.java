package com.netease.jiumu.app.category.dao.impl;

import com.netease.jiumu.app.category.dao.CategoryDao;
import com.netease.jiumu.app.model.Category;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Component("categoryDao")
public class CategoryDaoImpl   implements CategoryDao {

    @Resource(name="sqlSessionTemplate")
    private  SqlSessionTemplate  sqlSessionTemplate;
    @Override
    public Category getCategory(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("CategoryMapper.getCategory",query);
    }

    @Override
    public void batchInsertCategory(List<Category> list) {
        sqlSessionTemplate.insert("CategoryMapper.batchInsertCategory",list);
    }

    @Override
    public void batchUpdateCategory(List<Category> list) {
        sqlSessionTemplate.update("CategoryMapper.batchUpdateCategory",list);
    }

    @Override
    public Long insertCategory(Category entity) {
        sqlSessionTemplate.insert("CategoryMapper.insertCategory",entity);
        return entity.getId();
    }
    @Override
    public void updateCategory(Category entity) {
        sqlSessionTemplate.update("CategoryMapper.updateCategory", entity);
    }
    @Override
    public List<Category> getCategoryList(Map<String, Object> query) {
        return sqlSessionTemplate.selectList("CategoryMapper.getCategoryList", query);
    }
    @Override
    public Integer getCategoryListCount(Map<String, Object> query) {
        return sqlSessionTemplate.selectOne("CategoryMapper.getCategoryListCount", query);
    }


    @Override
    public void truncateCategory() {
        sqlSessionTemplate.delete("CategoryMapper.truncateCategory");
    }
    @Override
    public void deleteCategory(Map<String, Object> query) {
        sqlSessionTemplate.delete("CategoryMapper.deleteCategory",query);
    }
    @Override
    public void batchDeleteCategory(List<Long> list) {
        sqlSessionTemplate.delete("CategoryMapper.batchDeleteCategory",list);
    }
}
