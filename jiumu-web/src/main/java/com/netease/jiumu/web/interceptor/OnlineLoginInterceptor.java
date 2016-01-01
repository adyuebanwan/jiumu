package com.netease.jiumu.web.interceptor;

import com.alibaba.fastjson.JSON;
import com.netease.jiumu.app.online.dto.OnlineUserDto;
import com.netease.jiumu.app.online.util.OnlineContext;
import com.netease.permission.app.dto.AdminUserContextDto;
import com.netease.permission.app.utils.AdminUserContext;
import com.netease.worldhero.core.cache.xmemcached.utils.MemcachedClientUtils;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import com.netease.worldhero.core.spring.admin.AdminLoginPagingController;
import com.netease.worldhero.core.spring.online.OnlineLoginController;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class OnlineLoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		//System.out.println("loginInterceptor-afterCompletion");
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		//System.out.println("loginInterceptor-postHandle");
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res,
							 Object handler) throws Exception {

		HandlerMethod hm = (HandlerMethod)handler;
		Object hmBean = hm.getBean();
		if(hmBean instanceof OnlineLoginController){//验证前台用户登录情况
			OnlineUserDto userDto = OnlineContext.getUserDto(req);
			if(userDto==null){//未登录
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("code",-201);
				map.put("message","未登录");
				byte[] bytes;
				bytes = JSON.toJSONString(map).getBytes("UTF-8");
				res.setCharacterEncoding("UTF-8");
				res.setContentType("text/json;charset=UTF-8");
				res.setContentLength(bytes.length);
				OutputStream writer = res.getOutputStream();
				writer.write(bytes);
				writer.flush();
				return false;
			}
		}
		return true;//无需验证登录
	}

}
