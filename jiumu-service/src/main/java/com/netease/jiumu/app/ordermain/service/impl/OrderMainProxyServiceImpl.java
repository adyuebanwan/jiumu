package com.netease.jiumu.app.ordermain.service.impl;

import com.netease.jiumu.app.ordermain.dao.OrderMainDao;
import com.netease.jiumu.app.ordermain.service.OrderMainService;
import com.netease.jiumu.app.ordermain.service.OrderMainProxyService;
import com.netease.jiumu.app.model.OrderMain;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
    代理类 保证了service dao的自动生成 有改动业务 直接写在此类处
*/
@Component("orderMainProxyService")
public class OrderMainProxyServiceImpl implements OrderMainProxyService{

    @Resource(name="orderMainService")
    private OrderMainService orderMainService;

}
