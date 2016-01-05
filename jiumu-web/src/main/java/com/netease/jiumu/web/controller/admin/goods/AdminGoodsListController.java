package com.netease.jiumu.web.controller.admin.goods;

import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Category;
import com.netease.jiumu.app.model.Goods;
import com.netease.jiumu.app.utils.ProjectUtil;
import com.netease.worldhero.core.common.utils.ListUtils;
import com.netease.worldhero.core.common.utils.MapUtil;
import com.netease.worldhero.core.common.utils.StringUtils;
import com.netease.worldhero.core.common.dto.AjaxData;
import com.netease.worldhero.core.common.utils.copy.Copyer;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping({"/admin/goods"})
@Controller
public class AdminGoodsListController extends AdminLoginController
{

  @Resource(name="goodsService")
  private GoodsService goodsService;

    @Resource(name="categoryService")
    private CategoryService categoryService;


    @RequestMapping(value={"list"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String list(ModelMap model, HttpServletResponse response)
  {
    return "admin/goods/goodsList";
  }

  @RequestMapping(value={"page/{pageIndex}/{pageCount}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void page(@PathVariable Integer pageIndex, @PathVariable Integer pageCount, @RequestParam(required=false, value="orderBy") String orderBy,
          @RequestParam(required=false, value="name") String name,
          @RequestParam(required=false, value="serialNum") String serialNum,
          @RequestParam(required=false, value="publishStatus") Integer publishStatus,
          @RequestParam(required=false, value="sellPrice") BigDecimal sellPrice,
          @RequestParam(required=false, value="buyPrice") BigDecimal buyPrice,
          @RequestParam(required = false,value = "createTimeBegin") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date createTimeBegin ,
          @RequestParam(required = false,value = "createTimeEnd") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date createTimeEnd ,
          @RequestParam(required=false, value="top") Integer top,
          @RequestParam(required=false, value="topCategoty") Integer topCategoty,
HttpServletResponse response)
  {
    int idx = (pageIndex.intValue() - 1) * 20;
    Map<String,Object> query = ProjectUtil.buildMap("orderBy", orderBy, new Object[] {
            "name",name,
            "serialNum",serialNum,
            "publishStatus",publishStatus,
            "sellPrice",sellPrice,
            "buyPrice",buyPrice,
        "createTimeBegin",createTimeBegin ,
        "createTimeEnd",createTimeEnd ,
            "top",top,
            "topCategoty",topCategoty,

  "limitIndex",Integer.valueOf(idx),"limit", Integer.valueOf(20) });
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

  @RequestMapping({"/detail"})
  public String detail(ModelMap model) {
    detailDeal(null, model);
    return "admin/goods/goodsDetail";
  }

  @RequestMapping({"/detail/{id}"})
  public String detailId(@PathVariable Long id, ModelMap model) {
    detailDeal(id, model);
    return "admin/goods/goodsDetail";
  }
  private void detailDeal(Long id, ModelMap model) {
    Goods entity = new Goods();
    if (id != null) {
      entity = this.goodsService.getGoods(id);
    }
    model.addAttribute("goods", entity);

      List<Category> parentList = categoryService.getCategoryList(MapUtil.buildMap("parentId",0L));

  }

  @RequestMapping(value={"save"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String save(@ModelAttribute Goods goods) {
    if (goods.getId() == null) {
      this.goodsService.insertGoods(goods);
    } else {
      Goods entity = this.goodsService.getGoods(goods.getId());
      Copyer.copy(goods, entity);
      this.goodsService.updateGoods(entity);
    }
    return "redirect:/admin/goods/list";
  }

  @RequestMapping({"/delete/{id}"})
  public void delete(@PathVariable Long id, HttpServletResponse response) {
    this.goodsService.deleteGoods(id);
    toJson(response, new AjaxData("ok", "", ""));
  }
  @RequestMapping({"/batchdelete/{ids}"})
  public void batchDelete(@PathVariable String ids, HttpServletResponse response) {
    if(StringUtils.isNotBlank(ids)){
        String[] idArr = ids.split(",");
        List<Long> list = new ArrayList<Long>();
        for(String id:idArr){
            if(StringUtils.isNotBlank(id)){
                list.add(Long.valueOf(id));
            }
        }
        if(ListUtils.isNotBlank(list)){
            this.goodsService.batchDeleteGoods(list);
            toJson(response, new AjaxData("ok", "", ""));
        }
    }else{
        toJson(response, new AjaxData("error", "没有要删除的主键", ""));
    }
  }
}