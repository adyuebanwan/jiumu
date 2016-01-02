package com.netease.jiumu.web.controller.web.index;

import com.netease.jiumu.app.dto.CartDto;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Goods;
import com.netease.jiumu.web.common.BaseController;
import com.netease.worldhero.core.common.utils.ListUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/1/2.
 */
@Controller
@RequestMapping(value = "/mycart")
public class MyCartController extends BaseController {
    @Resource
    private GoodsService goodsService;
    private static final String SESSION_KEY = "MY_CART";

    //到我的购物车
    @RequestMapping(value = "/")
    private String getCartData( HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
        List<CartDto> list =  myCartList(request);
        modelMap.addAttribute("cartList",list);
        return "/web/mycart";
    }

    private List<CartDto> myCartList(HttpServletRequest request){
        List<CartDto> list = (List<CartDto>)request.getSession().getAttribute(SESSION_KEY);
        if(ListUtils.isBlank(list)){
            list = new ArrayList<CartDto>();
        }
        return list;
    }

    //加入购物车
    @RequestMapping(value = "/join/{goodsId}/{count}")
    public void joinCart(@PathVariable Long goodsId,@PathVariable Integer count,
            HttpServletRequest request,HttpServletResponse response){

        Goods goods = goodsService.getGoods(goodsId);
        if(goods==null){
            return;
        }
        String guigeData = request.getParameter("guigeData");//["",""]//规格
        CartDto cartDto = new CartDto();
        cartDto.setBuyCount(count);
        cartDto.setGoodsId(goodsId);
        cartDto.setGoodsName(goods.getName());
        cartDto.setSellPrice(goods.getSellPrice());
        cartDto.setGuige(guigeData);
        cartDto.setGoodsPic(goods.getThumbnailPic());
        List<CartDto> list =  myCartList(request);
        list.add(cartDto);

        request.getSession().setAttribute(SESSION_KEY,list);

        toJson(response, "ok");
    }



}
