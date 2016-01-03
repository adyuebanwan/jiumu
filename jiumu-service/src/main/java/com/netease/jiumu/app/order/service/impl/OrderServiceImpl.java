package com.netease.jiumu.app.order.service.impl;

import com.netease.jiumu.app.cart.service.CartService;
import com.netease.jiumu.app.dto.CartDto;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.model.Goods;
import com.netease.jiumu.app.model.OrderDetail;
import com.netease.jiumu.app.model.OrderMain;
import com.netease.jiumu.app.order.service.OrderService;
import com.netease.jiumu.app.orderdetail.service.OrderDetailService;
import com.netease.jiumu.app.ordermain.constant.OrderMainConstant;
import com.netease.jiumu.app.ordermain.service.OrderMainService;
import com.netease.worldhero.core.common.utils.ListUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/1/2.
 */
@Component("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderMainService orderMainService;
    @Resource
    private OrderDetailService orderDetailService;
    @Resource
    private GoodsService goodsService;
    @Resource
    private CartService cartService;
    @Override
    @Transactional
    public Long userSubmitOrder(List<CartDto> cartDtoList, String userName) {
        if(ListUtils.isNotBlank(cartDtoList)){
            Date now = new Date();
            BigDecimal account = cartService.cartTotalAccount(cartDtoList);
            OrderMain orderMain = new OrderMain();
            orderMain.setAccount(account);
            orderMain.setRealPay(account);
            orderMain.setBuyerName(userName);
            orderMain.setCreateTime(now);
            orderMain.setUpdateTime(now);
            orderMain.setOrderStatus(OrderMainConstant.ORDER_STATUS_INIT);
            Long orderId = orderMainService.insertOrderMain(orderMain);//订单号
            for(CartDto cartDto:cartDtoList){
                Long goodsId = cartDto.getGoodsId();
                Goods goods = goodsService.getGoods(goodsId);
                if(goods!=null){
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setUpdateTime(now);
                    orderDetail.setCreateTime(now);
                    orderDetail.setBuyCount(cartDto.getBuyCount());
                    orderDetail.setDanwei(goods.getDanwei());
                    orderDetail.setGoodsId(goodsId);
                    orderDetail.setGoodsName(goods.getName());
                    orderDetail.setGoodsSerialNum(goods.getSerialNum());
                    orderDetail.setGuigeOne(cartDto.getGuige());
                    orderDetail.setMark(cartDto.getRemark());
                    orderDetail.setOrderMainId(orderId);
                    orderDetail.setPrice(goods.getSellPrice());
                    orderDetailService.insertOrderDetail(orderDetail);
                }
            }
            return orderId;
        }
        return null;
    }


}
