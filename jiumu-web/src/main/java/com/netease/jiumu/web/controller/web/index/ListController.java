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
    public String list(ModelMap model, HttpServletResponse response)
    {
        //列表
        ProjectUtil.commonModel(model);

        model.addAttribute("oneCategoryId",null);
        return "web/list";
    }

    @RequestMapping(value={"/list/{oneCategoryId}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public String listCategory(@PathVariable Long oneCategoryId,ModelMap model, HttpServletResponse response)
    {
        //列表
        ProjectUtil.commonModel(model);

        model.addAttribute("oneCategoryId",oneCategoryId);
        return "web/list";
    }

    @RequestMapping(value={"list/page/{pageIndex}/{pageCount}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
    public void page(@PathVariable Integer pageIndex, @PathVariable Integer pageCount, @RequestParam(required=false, value="orderBy") String orderBy,
                     @RequestParam(required=false, value="oneCategoryId") Long oneCategoryId,
                     @RequestParam(required=false, value="sellPrice") BigDecimal sellPrice,
                     HttpServletResponse response)
    {
        if(StringUtils.isBlank(orderBy)){
            orderBy = null;
        }
        if(!"sell_price asc".equals(orderBy) && !"sell_price desc".equals(orderBy) ){
            orderBy = null;
        }
        int idx = (pageIndex.intValue() - 1) * 20;
        Map<String,Object> query = ProjectUtil.buildMap("orderBy", orderBy, new Object[]{
                "oneCategoryId", oneCategoryId,
                "sellPrice", sellPrice,
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
