package com.netease.jiumu.web.controller.web.index;

import com.netease.jiumu.app.cart.service.CartService;
import com.netease.jiumu.app.dto.CartDto;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Goods;
import com.netease.jiumu.app.order.service.OrderService;
import com.netease.jiumu.web.common.BaseController;
import com.netease.worldhero.core.common.utils.ListUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/1/2.
 */
@Controller
@RequestMapping(value = "/myorder")
public class OrderSuccessController extends BaseController {

    private static final String SESSION_KEY = "MY_CART";
    @Resource
    private CartService cartService;
    @Resource
    private OrderService orderService;
    //到我的购物车
    @RequestMapping(value = "/userinfo")
    public String submit( HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
        List<CartDto> list =  myCartList(request);
        modelMap.addAttribute("cartList",list);
        modelMap.addAttribute("cartTotalAccount",cartService.cartTotalAccount(list));
        return "/web/orderSubmit";
    }
    //到我的购物车
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String success( HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
        String userName = request.getParameter("userName");
        String buyerAdress = request.getParameter("buyerAdress");
        String buyerPhone = request.getParameter("buyerPhone");
        String[] remarks = request.getParameterValues("remark");
        List<CartDto> list =  myCartList(request);
        Long orderId = null;
        if(ListUtils.isBlank(list)){
            modelMap.addAttribute("hasSubmit",true);
        }else {//保存订单表 详情表
            for(int i=0;i<list.size();i++){
                CartDto cartDto = list.get(i);
                if(remarks.length>=i+1){
                    cartDto.setRemark(remarks[i]);
                }
            }
            orderId = orderService.userSubmitOrder(list,userName,buyerAdress,buyerPhone);
            //清空购物车
            resetCartData(request, new ArrayList<CartDto>());
            modelMap.addAttribute("hasSubmit",false);
        }
        modelMap.addAttribute("cartTotalAccount",cartService.cartTotalAccount(list));
        modelMap.addAttribute("orderId",orderId);
        modelMap.addAttribute("userName",userName);
        return "/web/orderSuccess";
    }

    private List<CartDto> myCartList(HttpServletRequest request){
        List<CartDto> list = (List<CartDto>)request.getSession().getAttribute(SESSION_KEY);
        if(ListUtils.isBlank(list)){
            list = new ArrayList<CartDto>();
        }
        return list;
    }
    private void resetCartData(HttpServletRequest request,List<CartDto> list){
        request.getSession().setAttribute(SESSION_KEY,list);
    }

}
