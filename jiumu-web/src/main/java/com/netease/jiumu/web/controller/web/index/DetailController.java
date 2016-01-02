package com.netease.jiumu.web.controller.web.index;

import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Category;
import com.netease.jiumu.app.model.Goods;
import com.netease.jiumu.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/1/2.
 */
@Controller
public class DetailController extends BaseController {
    @Resource
    private CategoryService categoryService;
    @Resource
    private GoodsService goodsService;
    @RequestMapping(value = "/goods/{id}",method = RequestMethod.GET)
    public String toIndex(@PathVariable Long id,ModelMap model)
    {
        List<Category> categoryList = categoryService.getCategoryList(null);
        model.addAttribute("categoryList",categoryList);
        Goods goods = goodsService.getGoods(id);
        model.addAttribute("goods",goods);
        return "web/detail";
    }
}
