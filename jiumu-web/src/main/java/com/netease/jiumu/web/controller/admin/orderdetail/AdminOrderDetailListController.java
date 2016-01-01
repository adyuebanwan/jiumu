package com.netease.jiumu.web.controller.admin.orderdetail;

import com.netease.jiumu.app.orderdetail.service.OrderDetailService;
import com.netease.jiumu.app.model.OrderDetail;
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

@RequestMapping({"/admin/orderdetail"})
@Controller
public class AdminOrderDetailListController extends AdminLoginController
{

  @Resource(name="orderDetailService")
  private OrderDetailService orderDetailService;

  @RequestMapping(value={"list"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String list(ModelMap model, HttpServletResponse response)
  {
    return "admin/orderdetail/orderDetailList";
  }

  @RequestMapping(value={"page/{pageIndex}/{pageCount}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void page(@PathVariable Integer pageIndex, @PathVariable Integer pageCount, @RequestParam(required=false, value="orderBy") String orderBy,
          @RequestParam(required=false, value="goodsSerialNum") String goodsSerialNum,
          @RequestParam(required=false, value="goodsName") String goodsName,
          @RequestParam(required = false,value = "createTimeBegin") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date createTimeBegin ,
          @RequestParam(required = false,value = "createTimeEnd") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date createTimeEnd ,
HttpServletResponse response)
  {
    int idx = (pageIndex.intValue() - 1) * 20;
    Map<String,Object> query = ProjectUtil.buildMap("orderBy", orderBy, new Object[] {
            "goodsSerialNum",goodsSerialNum,
            "goodsName",goodsName,
        "createTimeBegin",createTimeBegin ,
        "createTimeEnd",createTimeEnd ,

  "limitIndex",Integer.valueOf(idx),"limit", Integer.valueOf(20) });
    List pageList = this.orderDetailService.getOrderDetailList(query);

    query.remove("orderBy");
    query.remove("limitIndex");
    query.remove("limit");
    if ((pageCount == null) || (pageCount.intValue() == 0)) {
      pageCount = this.orderDetailService.getOrderDetailListCount(query);
    }

    Map ajaxData = new HashMap();
    ajaxData.put("pageList", pageList);
    ajaxData.put("pageCount", pageCount);
    toJson(response, new AjaxData("ok", "success", ajaxData));
  }

  @RequestMapping({"/detail"})
  public String detail(ModelMap model) {
    detailDeal(null, model);
    return "admin/orderdetail/orderDetailDetail";
  }

  @RequestMapping({"/detail/{id}"})
  public String detailId(@PathVariable Long id, ModelMap model) {
    detailDeal(id, model);
    return "admin/orderdetail/orderDetailDetail";
  }
  private void detailDeal(Long id, ModelMap model) {
    OrderDetail entity = new OrderDetail();
    if (id != null) {
      entity = this.orderDetailService.getOrderDetail(id);
    }
    model.addAttribute("orderDetail", entity);
  }

  @RequestMapping(value={"save"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String save(@ModelAttribute OrderDetail orderDetail) {
    if (orderDetail.getId() == null) {
      this.orderDetailService.insertOrderDetail(orderDetail);
    } else {
      OrderDetail entity = this.orderDetailService.getOrderDetail(orderDetail.getId());
      Copyer.copy(orderDetail, entity);
      this.orderDetailService.updateOrderDetail(entity);
    }
    return "redirect:/admin/orderdetail/list";
  }

  @RequestMapping({"/delete/{id}"})
  public void delete(@PathVariable Long id, HttpServletResponse response) {
    this.orderDetailService.deleteOrderDetail(id);
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
            this.orderDetailService.batchDeleteOrderDetail(list);
            toJson(response, new AjaxData("ok", "", ""));
        }
    }else{
        toJson(response, new AjaxData("error", "没有要删除的主键", ""));
    }
  }
}