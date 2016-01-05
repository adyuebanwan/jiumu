package com.netease.jiumu.app.utils;

import com.netease.jiumu.app.category.dto.CategoryListDto;
import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.model.Category;
import com.netease.worldhero.core.common.utils.MapUtils;
import com.netease.worldhero.core.spring.SpringContainer;
import org.springframework.ui.ModelMap;

import java.util.List;
import java.util.Map;

/**
 * Created by hedongyu on 2015/5/22.
 * 799374340@qq.com
 */
public class ProjectUtil {
    public static Map<String,Object> buildMap(String key,Object value ,Object... args){
        return MapUtils.buildMap(key, value, args);
    }

    public static void commonModel(ModelMap model){
        CategoryService categoryService = SpringContainer.getBean("categoryService",CategoryService.class);
        List<CategoryListDto> categoryListDtoList = categoryService.list();
        model.addAttribute("categoryList",categoryListDtoList);
    }
}
