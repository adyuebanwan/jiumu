package com.netease.jiumu.app.cart.service.impl;

import com.netease.jiumu.app.cart.service.CartService;
import com.netease.jiumu.app.dto.CartDto;
import com.netease.worldhero.core.common.utils.ListUtils;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2016/1/2.
 */
@Component("cartService")
public class CartServiceImpl implements CartService {
    @Override
    public BigDecimal cartTotalAccount(List<CartDto> list) {
        BigDecimal total = BigDecimal.ZERO;
        if(ListUtils.isNotBlank(list)){
            for(CartDto cartDto:list){
                total = total.add(cartDto.getSellPrice().multiply(new BigDecimal(cartDto.getBuyCount())));
            }
        }
        return total.setScale(2, BigDecimal.ROUND_HALF_UP);
    }
}
