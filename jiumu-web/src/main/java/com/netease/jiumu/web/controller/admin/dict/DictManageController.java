package com.netease.jiumu.web.controller.admin.dict;

import com.netease.jiumu.app.dict.service.DictService;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
public class DictManageController extends AdminLoginController{
	@Resource(name="dictService")
	private DictService dictService;
  	//刷新数据字典
	@RequestMapping(value = "/admin/dict/refresh", method = RequestMethod.GET)  
    public String cardTool() {
		dictService.refresh();
        return "success";
    }
  	
}
