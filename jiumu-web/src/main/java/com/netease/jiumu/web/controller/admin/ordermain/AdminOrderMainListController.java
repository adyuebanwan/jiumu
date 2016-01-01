package com.netease.jiumu.web.controller.admin.ordermain;

import com.netease.jiumu.app.ordermain.service.OrderMainService;
import com.netease.jiumu.app.model.OrderMain;
import com.netease.jiumu.app.utils.ProjectUtil;
import com.netease.worldhero.core.common.utils.ListUtils;
import com.netease.worldhero.core.common.utils.StringUtils;
import com.netease.worldhero.core.common.dto.AjaxData;
import com.netease.worldhero.core.common.utils.copy.Copyer;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping({"/admin/ordermain"})
@Controller
public class AdminOrderMainListController extends AdminLoginController
{

  @Resource(name="orderMainService")
  private OrderMainService orderMainService;

  @RequestMapping(value={"list"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String list(ModelMap model, HttpServletResponse response)
  {
    return "admin/ordermain/orderMainList";
  }

  @RequestMapping(value={"page/{pageIndex}/{pageCount}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void page(@PathVariable Integer pageIndex, @PathVariable Integer pageCount, @RequestParam(required=false, value="orderBy") String orderBy,
          @RequestParam(required=false, value="id") Long id,
          @RequestParam(required=false, value="buyerName") String buyerName,
          @RequestParam(required=false, value="buyerAdress") String buyerAdress,
          @RequestParam(required = false,value = "createTimeBegin") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date createTimeBegin ,
          @RequestParam(required = false,value = "createTimeEnd") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date createTimeEnd ,
          @RequestParam(required=false, value="operator") String operator,
          @RequestParam(required=false, value="orderStatus") Integer orderStatus,
HttpServletResponse response)
  {
    int idx = (pageIndex.intValue() - 1) * 20;
    Map<String,Object> query = ProjectUtil.buildMap("orderBy", orderBy, new Object[] {
            "id",id,
            "buyerName",buyerName,
            "buyerAdress",buyerAdress,
        "createTimeBegin",createTimeBegin ,
        "createTimeEnd",createTimeEnd ,
            "operator",operator,
            "orderStatus",orderStatus,

  "limitIndex",Integer.valueOf(idx),"limit", Integer.valueOf(20) });
    List pageList = this.orderMainService.getOrderMainList(query);

    query.remove("orderBy");
    query.remove("limitIndex");
    query.remove("limit");
    if ((pageCount == null) || (pageCount.intValue() == 0)) {
      pageCount = this.orderMainService.getOrderMainListCount(query);
    }

    Map ajaxData = new HashMap();
    ajaxData.put("pageList", pageList);
    ajaxData.put("pageCount", pageCount);
    toJson(response, new AjaxData("ok", "success", ajaxData));
  }

  @RequestMapping({"/detail"})
  public String detail(ModelMap model) {
    detailDeal(null, model);
    return "admin/ordermain/orderMainDetail";
  }

  @RequestMapping({"/detail/{id}"})
  public String detailId(@PathVariable Long id, ModelMap model) {
    detailDeal(id, model);
    return "admin/ordermain/orderMainDetail";
  }
  private void detailDeal(Long id, ModelMap model) {
    OrderMain entity = new OrderMain();
    if (id != null) {
      entity = this.orderMainService.getOrderMain(id);
    }
    model.addAttribute("orderMain", entity);
  }

  @RequestMapping(value={"save"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String save(@ModelAttribute OrderMain orderMain) {
    if (orderMain.getId() == null) {
      this.orderMainService.insertOrderMain(orderMain);
    } else {
      OrderMain entity = this.orderMainService.getOrderMain(orderMain.getId());
      Copyer.copy(orderMain, entity);
      this.orderMainService.updateOrderMain(entity);
    }
    return "redirect:/admin/ordermain/list";
  }

  @RequestMapping({"/delete/{id}"})
  public void delete(@PathVariable Long id, HttpServletResponse response) {
    this.orderMainService.deleteOrderMain(id);
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
            this.orderMainService.batchDeleteOrderMain(list);
            toJson(response, new AjaxData("ok", "", ""));
        }
    }else{
        toJson(response, new AjaxData("error", "没有要删除的主键", ""));
    }
  }
}