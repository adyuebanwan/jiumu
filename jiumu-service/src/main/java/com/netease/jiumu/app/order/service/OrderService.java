package com.netease.jiumu.app.order.service;

import com.netease.jiumu.app.dto.CartDto;

import java.util.List;

/**
 * Created by Administrator on 2016/1/2.
 */
public interface OrderService {

    Long  userSubmitOrder(List<CartDto> cartDtoList,String userName);
}
