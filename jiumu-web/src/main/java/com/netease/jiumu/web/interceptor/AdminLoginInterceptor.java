package com.netease.jiumu.web.interceptor;

import com.netease.permission.app.dto.AdminUserContextDto;
import com.netease.permission.app.model.AdminUser;
import com.netease.permission.app.utils.AdminUserContext;
import com.netease.worldhero.core.cache.ehcache.utils.EhcacheUtils;
import com.netease.worldhero.core.cache.xmemcached.utils.MemcachedClientUtils;
import com.netease.worldhero.core.common.utils.StringUtils;
import com.netease.worldhero.core.common.utils.SysPropertiesUtil;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import com.netease.worldhero.core.spring.admin.AdminLoginPagingController;
import org.apache.http.HttpRequest;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AdminLoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res,
			Object handler) throws Exception {
        req.setAttribute("ctxPath", SysPropertiesUtil.getProperty("ctxPath"));
        HandlerMethod hm = (HandlerMethod)handler;
        Object hmBean = hm.getBean();
        if(hmBean instanceof AdminLoginController
                || hmBean instanceof AdminLoginPagingController){//验证后台用户登录情况
            String sessionId = AdminUserContext.getSessionKey();
            if(StringUtils.isBlank(sessionId)){
                RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp");
                dispatcher .forward(req, res);
                return false;
            }
//            AdminUserContextDto  adminUserContextDto = MemcachedClientUtils.get().get(sessionId);
            AdminUserContextDto  adminUserContextDto = (AdminUserContextDto) req.getSession().getAttribute(sessionId);
            if(adminUserContextDto==null){//未登录
                RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp");
                dispatcher .forward(req, res);
                return false;
            }

        }
        return true;//无需验证登录

    }

}
