package com.netease.jiumu.app.cart.service;

import com.netease.jiumu.app.dto.CartDto;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Administrator on 2016/1/2.
 */
public interface CartService {
    /**
     * 购物车总价
     * @param list
     * @return
     */
    BigDecimal cartTotalAccount(  List<CartDto> list);
}
