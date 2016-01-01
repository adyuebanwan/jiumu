package com.netease.jiumu.app.goods.service.impl;

import com.netease.jiumu.app.goods.dao.GoodsDao;
import com.netease.jiumu.app.goods.service.GoodsService;
import com.netease.jiumu.app.goods.service.GoodsProxyService;
import com.netease.jiumu.app.model.Goods;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
    代理类 保证了service dao的自动生成 有改动业务 直接写在此类处
*/
@Component("goodsProxyService")
public class GoodsProxyServiceImpl implements GoodsProxyService{

    @Resource(name="goodsService")
    private GoodsService goodsService;

}
