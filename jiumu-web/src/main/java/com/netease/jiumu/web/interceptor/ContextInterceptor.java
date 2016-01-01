package com.netease.jiumu.web.interceptor;

import com.netease.worldhero.core.common.utils.SysPropertiesUtil;
import com.netease.worldhero.core.spring.ControllerContext;
import com.netease.worldhero.core.spring.PagingController;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import com.netease.worldhero.core.spring.admin.AdminLoginPagingController;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * qq:799374340
 * 
 * @author hdy 2013-7-25上午10:11:56 上下文拦截器
 */
public class ContextInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HandlerMethod hm = (HandlerMethod)handler;
		Object hmBean = hm.getBean();
		if(	hmBean instanceof AdminLoginController){
			ControllerContext.getContext().setController(hm.getBean());
			ControllerContext.getContext().setHttpServletRequest(request);
			ControllerContext.getContext().setHttpServletResponse(response);
		}
		request.setAttribute("CTX", SysPropertiesUtil.getProperty("CTX"));

		return true;
	}
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//        System.out.println(1);
    }

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
        //释放资源 避免内存溢出
        HandlerMethod hm = (HandlerMethod)handler;
        Object hmBean = hm.getBean();
        if(	hmBean instanceof AdminLoginController) {
            ControllerContext.remove();
        }
	}
	
}
