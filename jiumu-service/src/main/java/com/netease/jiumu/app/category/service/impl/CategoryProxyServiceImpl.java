package com.netease.jiumu.app.category.service.impl;

import com.netease.jiumu.app.category.dao.CategoryDao;
import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.category.service.CategoryProxyService;
import com.netease.jiumu.app.model.Category;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
    代理类 保证了service dao的自动生成 有改动业务 直接写在此类处
*/
@Component("categoryProxyService")
public class CategoryProxyServiceImpl implements CategoryProxyService{

    @Resource(name="categoryService")
    private CategoryService categoryService;

}
