package com.netease.jiumu.app.dict.listener;

import com.netease.jiumu.app.dict.service.DictService;
import com.netease.jiumu.app.model.dict.Dict;
import com.netease.jiumu.app.model.dict.Dictionary;
import com.netease.worldhero.core.common.utils.ListUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import javax.annotation.Resource;
import java.util.List;


public class DictionaryListener implements ApplicationListener<ContextRefreshedEvent> {
	@Resource(name="dictService")
	private DictService dictService;
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		System.out.println("数据库字典初始化...");
		List<Dict> allDict = this.dictService.getAllDict();
		if(ListUtils.isNotBlank(allDict)){
			for(Dict dict : allDict){
				Dictionary.autoInit(dict);
			}
		}
		System.out.println("数据库字典初始化完成^ ^");
	}


}
