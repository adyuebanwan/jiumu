package com.netease.jiumu.web.controller.web.index;

import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.model.Category;
import com.netease.jiumu.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/1/1.
 */
@Controller
public class IndexController extends BaseController{
    @Resource
    private CategoryService categoryService;
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String toIndex(ModelMap model)
    {
        List<Category> categoryList = categoryService.getCategoryList(null);
        model.addAttribute("categoryList",categoryList);
        return "web/index";
    }

}
