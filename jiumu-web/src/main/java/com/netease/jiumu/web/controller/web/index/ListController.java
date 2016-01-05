package com.netease.jiumu.web.controller.web.index;

import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Category;
import com.netease.jiumu.app.utils.ProjectUtil;
import com.netease.jiumu.web.common.BaseController;
import com.netease.worldhero.core.common.dto.AjaxData;
import com.netease.worldhero.core.common.utils.MapUtil;
import com.netease.worldhero.core.common.utils.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/3.
 */
@Controller
public class ListController extends BaseController {

    @Resource(name="goodsService")
    private GoodsService goodsService;
    @Resource
    private CategoryService categoryService;
    @RequestMapping(value={"/list"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public String list(ModelMap model,HttpServletRequest request, HttpServletResponse response)
    {
        String keyword = request.getParameter("keyword");
        //列表
        ProjectUtil.commonModel(model);

        model.addAttribute("oneCategoryId", null);
        model.addAttribute("twoCategoryId",null);
        model.addAttribute("keyword",keyword);
        return "web/list";
    }


    @RequestMapping(value={"/list/{oneCategoryId}/{twoCategoryId}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public String listCategory(@PathVariable Long oneCategoryId,@PathVariable Long twoCategoryId,ModelMap model, HttpServletResponse response)
    {
        if(oneCategoryId!=null &&oneCategoryId.compareTo(0L)==0){
            oneCategoryId = null;
        }
        if(twoCategoryId!=null &&twoCategoryId.compareTo(0L)==0){
            twoCategoryId = null;
        }
        //列表
        ProjectUtil.commonModel(model);
        List<Category> subCategoryList = categoryService.getCategoryList(MapUtil.buildMap("parentId",oneCategoryId,"orderBy"," sort_num asc"));
        model.addAttribute("subCategoryList", subCategoryList);
        model.addAttribute("oneCategoryId", oneCategoryId);
        model.addAttribute("twoCategoryId",twoCategoryId);
        return "web/list";
    }

    @RequestMapping(value={"list/page/{pageIndex}/{pageCount}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public void page(@PathVariable Integer pageIndex, @PathVariable Integer pageCount, @RequestParam(required=false, value="orderBy") String orderBy,
                     @RequestParam(required=false, value="oneCategoryId") Long oneCategoryId,
                     @RequestParam(required=false, value="twoCategoryId") Long twoCategoryId,
                     @RequestParam(required=false, value="keyword") String keyword,
                     @RequestParam(required=false, value="sellPrice") BigDecimal sellPrice,
                     HttpServletResponse response)
    {
        if(StringUtils.isBlank(orderBy)){
            orderBy = null;
        }
        if(!"sell_price asc".equals(orderBy) && !"sell_price desc".equals(orderBy) ){
            orderBy = null;
        }
        if(oneCategoryId!=null && oneCategoryId.compareTo(0L)==0){
            oneCategoryId = null;
        }
        if(twoCategoryId!=null && twoCategoryId.compareTo(0L)==0){
            twoCategoryId = null;
        }
        int idx = (pageIndex.intValue() - 1) * 20;
        Map<String,Object> query = ProjectUtil.buildMap("orderBy", orderBy, new Object[]{
                "oneCategoryId", oneCategoryId,
                "twoCategoryId", twoCategoryId,
                "sellPrice", sellPrice,
                "nameLike",keyword,
                "limitIndex", Integer.valueOf(idx), "limit", Integer.valueOf(20)});
        List pageList = this.goodsService.getGoodsList(query);

        query.remove("orderBy");
        query.remove("limitIndex");
        query.remove("limit");
        if ((pageCount == null) || (pageCount.intValue() == 0)) {
            pageCount = this.goodsService.getGoodsListCount(query);
        }

        Map ajaxData = new HashMap();
        ajaxData.put("pageList", pageList);
        ajaxData.put("pageCount", pageCount);
        toJson(response, new AjaxData("ok", "success", ajaxData));
    }

}
