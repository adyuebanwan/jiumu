package com.netease.jiumu.app.dict;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;



public class DictionaryListener implements ApplicationListener<ContextRefreshedEvent> {
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		System.out.println("数据库字典初始化...");
		System.out.println("数据库字典初始化完成^ ^");
	}


}
