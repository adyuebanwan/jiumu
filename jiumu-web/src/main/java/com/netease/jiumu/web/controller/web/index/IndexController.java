package com.netease.jiumu.web.controller.web.index;

import com.netease.jiumu.web.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2016/1/1.
 */
@Controller
public class IndexController extends BaseController{
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String toIndex(){
        return "web/index";
    }

}
