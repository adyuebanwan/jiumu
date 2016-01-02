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
import java.math.BigDecimal;
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
    public String getCartData( HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
        List<CartDto> list =  myCartList(request);
        modelMap.addAttribute("cartList",list);
        modelMap.addAttribute("cartTotalAccount",cartTotalAccount(request));
        return "/web/mycart";
    }

    //购物车总额
    @RequestMapping(value = "/cart_account")
    public void cartAccount(HttpServletRequest request,HttpServletResponse response){
        toJson(response, cartTotalAccount(request));
    }

    //清空购物车
    @RequestMapping(value = "/clean")
    public void clean(HttpServletRequest request,HttpServletResponse response){
        resetCartData(request,new ArrayList<CartDto>());
        toJson(response,"ok");
    }
    //删除一个产品购物车
    @RequestMapping(value = "/delete/{itemId}")
    public void delete(@PathVariable Integer itemId,HttpServletRequest request,HttpServletResponse response){
        List<CartDto> list = myCartList(request);
        if(ListUtils.isNotBlank(list)){
            for(int i=0;i<list.size();i++){
                CartDto cartDto = list.get(i);
                if(itemId.compareTo(cartDto.getItemId())==0){
                    list.remove(i);
                    break;
                }
            }
        }
        toJson(response,"ok");
    }

    //购物车总价
    private BigDecimal cartTotalAccount( HttpServletRequest request){
        List<CartDto> list = myCartList(request);
        BigDecimal total = BigDecimal.ZERO;
        if(ListUtils.isNotBlank(list)){
            for(CartDto cartDto:list){
                total = total.add(cartDto.getSellPrice().multiply(new BigDecimal(cartDto.getBuyCount())));
            }
        }
        return total.setScale(2, BigDecimal.ROUND_HALF_UP);
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
        if(ListUtils.isBlank(list)){
            cartDto.setItemId(1);
        }else {
            cartDto.setItemId(list.get(list.size()-1).getItemId()+1);
        }
        list.add(cartDto);
        resetCartData(request,list);
        toJson(response, "ok");
    }

    private void resetCartData(HttpServletRequest request,List<CartDto> list){
        request.getSession().setAttribute(SESSION_KEY,list);
    }

    //更新购物车数量
    @RequestMapping(value = "/update_cart_num/{itemId}/{goodsId}/{buyCount}")
    public void updateCartNum(@PathVariable Integer itemId,@PathVariable Long goodsId,@PathVariable Integer buyCount,HttpServletRequest request,HttpServletResponse response){
        List<CartDto> list = myCartList(request);
        String result = "ok";
        if(ListUtils.isNotBlank(list)){
            Goods goods = goodsService.getGoods(goodsId);
            for(CartDto cartDto:list){
                if(itemId.compareTo(cartDto.getItemId())==0){
                    if(goods.getStoreNum().compareTo(buyCount)<0){
                        result = "库存不足,最多只能买"+goods.getStoreNum();
                    }else {
                        cartDto.setBuyCount(buyCount);
                    }
                }
            }
        }
        toJson(response, result);
    }

}
