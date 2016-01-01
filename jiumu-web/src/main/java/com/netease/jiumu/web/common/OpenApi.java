package com.netease.jiumu.web.common;

import com.netease.worldhero.core.common.dto.AjaxData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;



/**
 * qq:799374340
 * @author hdy
 * 2013-7-16上午10:53:02
 */
public interface OpenApi {
	AjaxData execute(Map<String,String> reqMap,HttpServletRequest req, HttpServletResponse resp);
}
