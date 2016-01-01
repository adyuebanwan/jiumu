package com.netease.jiumu.app.orderdetail.service.impl;

import com.netease.jiumu.app.orderdetail.dao.OrderDetailDao;
import com.netease.jiumu.app.orderdetail.service.OrderDetailService;
import com.netease.jiumu.app.orderdetail.service.OrderDetailProxyService;
import com.netease.jiumu.app.model.OrderDetail;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
    代理类 保证了service dao的自动生成 有改动业务 直接写在此类处
*/
@Component("orderDetailProxyService")
public class OrderDetailProxyServiceImpl implements OrderDetailProxyService{

    @Resource(name="orderDetailService")
    private OrderDetailService orderDetailService;

}
