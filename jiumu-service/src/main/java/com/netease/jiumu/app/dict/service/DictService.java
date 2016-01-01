package com.netease.jiumu.app.dict.service;


import com.netease.jiumu.app.model.dict.Dict;

import java.util.List;

public interface DictService {

	List<Dict> getAllDict();
	void refresh();
}
