package com.netease.jiumu.app.dict.service.impl;

import com.netease.jiumu.app.dict.dao.DictDao;
import com.netease.jiumu.app.dict.service.DictService;
import com.netease.jiumu.app.model.dict.Dict;
import com.netease.jiumu.app.model.dict.Dictionary;
import com.netease.worldhero.core.common.utils.ListUtils;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("dictService")
public class DictServiceImpl implements DictService {
	@Resource(name="dictDao")
	private DictDao dictDao;

	@Override
	public List<Dict> getAllDict() {
		return dictDao.getAllDict();
	}

	@Override
	public void refresh() {
		System.out.println("手动：数据库字典初始化...");
		Dictionary.flush();
		List<Dict> allDict = getAllDict(); 
		if(ListUtils.isNotBlank(allDict)){
			for(Dict dict : allDict){
				Dictionary.autoInit(dict);
			}
		}
		System.out.println("手动：数据库字典初始化完成^ ^");
	}
	
}
