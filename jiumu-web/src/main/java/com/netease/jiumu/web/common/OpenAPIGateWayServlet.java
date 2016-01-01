package com.netease.jiumu.web.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.netease.worldhero.core.common.dto.AjaxData;
import com.netease.worldhero.core.common.exception.BusinessException;
import com.netease.worldhero.core.common.utils.StringUtils;
import com.netease.worldhero.core.common.utils.log.Log4jUtils;
import com.netease.worldhero.core.spring.SpringContainer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

public class OpenAPIGateWayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String reqApiName = "api";// 通用参数 请求api
	private String reqFormatTo = "format";// 通用参数 返回值格式化

	static final SerializerFeature[] features = new SerializerFeature[]{SerializerFeature.WriteDateUseDateFormat, SerializerFeature. WriteMapNullValue};
	static final SerializeConfig config = new SerializeConfig();
	static {
		config.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String api = req.getParameter(reqApiName);
		String format = req.getParameter(reqFormatTo);
		AjaxData ajaxData = null;
		Map<String, String> reqMap = getParams(req);
		if (StringUtils.isNotBlank(api)) {
			try {
				OpenApi apiObj = SpringContainer.getBean(api, OpenApi.class);
				if (apiObj != null) {
					reqMap.remove(reqApiName);// 此参数不需要
					ajaxData = apiObj.execute(reqMap,req,resp);
				} else {
					ajaxData = new AjaxData("SYS-00404", "此API不存在，请输入正确的API", null);
				}
			} catch (BusinessException e) {// 通用业务异常
//				e.printStackTrace();
				Log4jUtils.getLog(OpenAPIGateWayServlet.class).error(e.getMessage());
				ajaxData = new AjaxData(e.getErrorCode(), e.getMessage(), null);
			} catch (Exception e) {// 系统异常
//				e.printStackTrace();
				Log4jUtils.getLog(OpenAPIGateWayServlet.class).error(e.getMessage());
				ajaxData = new AjaxData("SYS-00403", e.getMessage(), null);
			}
		} else {
			if (api == null) {
				ajaxData = new AjaxData("SYS-00401", "入参api为必传参数",null);
			} else {
				ajaxData = new AjaxData("SYS-00402", "入参api不能为空字符串",null);
			}
		}
        Log4jUtils.getLog(OpenAPIGateWayServlet.class).info("本次请求参数：" + reqMap + "");
//        Log4jUtils.getLog(OpenAPIGateWayServlet.class).info("本次请求参数：" + reqMap + "\r\n本次返回参数：" + JSON.toJSONString(ajaxData));
		json(resp, format, ajaxData);
	}

	private Map<String, String> getParams(HttpServletRequest req) {
		Map<String, String> result = new HashMap<String, String>();
		@SuppressWarnings("unchecked")
		Map<String, String[]> reqMap = req.getParameterMap();
		for (Map.Entry<String, String[]> e : reqMap.entrySet()) {
			result.put(e.getKey(), e.getValue()[0]);
		}
		return result;
	}

	private void json(HttpServletResponse response, String format, AjaxData ajaxData) throws IOException {
        // if(format==null || "".equals(format)){
        // }//暂时使用json格式
        format = "json";// 不传默认使用json格式
        byte[] bytes ;
        if(StringUtils.isBlank(ajaxData.getJsonp())){
            bytes = JSON.toJSONString(ajaxData,config,features).getBytes("UTF-8");
        }else{
            bytes = (ajaxData.getJsonp()+"("+JSON.toJSONString(ajaxData,config,features)+")").getBytes("UTF-8");
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/" + format + ";charset=UTF-8");
        response.setContentLength(bytes.length);
        OutputStream writer = response.getOutputStream();
        writer.write(bytes);
        writer.flush();
	}
}
