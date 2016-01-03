package com.netease.jiumu.web.controller.web.index;

import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.dto.IndexDto;
import com.netease.jiumu.app.goods.constant.GoodsConstant;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Category;
import com.netease.jiumu.app.model.Goods;
import com.netease.jiumu.web.common.BaseController;
import com.netease.worldhero.core.common.utils.ListUtils;
import com.netease.worldhero.core.common.utils.MapUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/1/1.
 */
@Controller
public class IndexController extends BaseController{
    @Resource
    private CategoryService categoryService;

    @Resource
    private GoodsService goodsService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String toIndex(ModelMap model)
    {
        //列表
        List<Category> categoryList = categoryService.getCategoryList(MapUtil.buildMap("orderBy","sort_num desc"));
        model.addAttribute("categoryList",categoryList);
        //
        List<IndexDto> all = new ArrayList<IndexDto>();
        for(Category category:categoryList){
            IndexDto indexDto = new IndexDto();
            indexDto.setCategory(category);
            List<Goods> topList = goodsService.getGoodsList(MapUtil.buildMap("top", GoodsConstant.GOODS_TOP_INDEX,"oneCategoryId",category.getId(),"limitIndex",0,"limit",6,"whereSql"," and top_categoty!=1 ","orderBy"," update_time desc "));
            List<Goods> topCategoryList = goodsService.getGoodsList(MapUtil.buildMap("topCategoty", GoodsConstant.GOODS_TOP_CATEGORY, "oneCategoryId", category.getId(),"limitIndex",0,"limit",1,"orderBy"," update_time desc "));
            indexDto.setTopList(topList);
            if(ListUtils.isNotBlank(topCategoryList)){
                indexDto.setTopCategory(topCategoryList.get(0));
            }
            all.add(indexDto);
        }
        //
        model.addAttribute("all",all);
        return "web/index";
    }


}
