package com.netease.jiumu.web.controller.admin;

import com.netease.permission.app.admin.constant.AdminConstant;
import com.netease.permission.app.dto.AdminUserContextDto;
import com.netease.permission.app.dto.AdminUserDto;
import com.netease.permission.app.model.AdminUser;
import com.netease.permission.app.service.AdminUserService;
import com.netease.worldhero.core.cache.ehcache.utils.EhcacheUtils;
import com.netease.worldhero.core.cache.xmemcached.utils.MemcachedClientUtils;
import com.netease.worldhero.core.common.safe.SqlInjectFilter;
import com.netease.worldhero.core.common.safe.XssHtmlFilter;
import com.netease.worldhero.core.common.utils.ListUtils;
import com.netease.worldhero.core.common.utils.copy.Copyer;
import com.netease.worldhero.core.identifyingcode.CreateIdentifyingCode;
import com.netease.worldhero.core.identifyingcode.IdentifyingCodeConstant;
import net.rubyeye.xmemcached.exception.MemcachedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeoutException;

/**
 * 后台人员登录
 *hdy qq:799374340
 *2013-6-8 下午5:05:27
 */
@Controller
public class AdminLoginAction {
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;

    @RequestMapping(value="/admin/login")
    public String login(HttpServletRequest request,HttpServletResponse response,ModelMap model){
        setCheckCodeCookie(request, response);
        return "admin/login";
    }
    private void setCheckCodeCookie(HttpServletRequest request,HttpServletResponse response){
        Cookie sessionCookie = new Cookie(IdentifyingCodeConstant.CHECK_CODE_SESSION_KEY,request.getSession().getId());
        sessionCookie.setPath("/");
        response.addCookie(sessionCookie);
    }

    @RequestMapping(value="/admin")
	public String execute(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
        //验证码
        String checkCode = request.getParameter("checkCode");
        String sessionId = request.getSession().getId();
        try {
            CreateIdentifyingCode code = new CreateIdentifyingCode();
            String cookieKey = code.getCookieKey(request);

//            String sesionCheckCode = MemcachedClientUtils.get().get(IdentifyingCodeConstant.CHECK_CODE_SESSION_KEY+cookieKey);
            String sesionCheckCode = (String)request.getSession().getAttribute(IdentifyingCodeConstant.CHECK_CODE_SESSION_KEY);
            if(checkCode==null || sesionCheckCode==null || !checkCode.toLowerCase().equals(sesionCheckCode.toLowerCase())){
                setCheckCodeCookie(request, response);
                return "admin/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //验证登陆
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        XssHtmlFilter xss1 = new XssHtmlFilter();
        if(!xss1.isContainXss(userName) && !SqlInjectFilter.isContainSqlInject(userName) &&
                !xss1.isContainXss(password) && !SqlInjectFilter.isContainSqlInject(password)){
        }else{
            setCheckCodeCookie(request, response);
            return "admin/login";
        }
		//查询库 验证此用户是否合法
        Map<String,Object> query = new HashMap<String, Object>();
        query.put("userName",userName);
        List<AdminUser> userList = adminUserService.getAdminUserList(query);
        if(ListUtils.isBlank(userList)){
            model.addAttribute("alert","用户名不存在");
            setCheckCodeCookie(request, response);
            return "admin/login";
        }

        AdminUser adminUser = userList.get(0);
        String passwd = adminUser.getPassword();
        if(!passwd.equals(password)){
            model.addAttribute("alert","用户名密码不正确");
            setCheckCodeCookie(request, response);
            return "admin/login";
        }
        //保护密码
        adminUser.setPassword("***");
        //cookie

        Cookie sessionCookie = new Cookie(AdminConstant.ADMIN_LOGIN_COOKIE_KEY,sessionId);
        sessionCookie.setPath("/");
        response.addCookie(sessionCookie);
        AdminUserContextDto adminUserContextDto = new AdminUserContextDto();
        AdminUserDto adminUserDto = new AdminUserDto();
        Copyer.copy(adminUser,adminUserDto);
        adminUserContextDto.setAdminUser(adminUserDto);
        //存储到缓存
//        EhcacheUtils.resetCache(sessionId,AdminConstant.ADMIN_LOGIN_TIMEOUT,adminUser);
//        MemcachedClientUtils.resetCache(sessionId, AdminConstant.ADMIN_LOGIN_TIMEOUT, adminUserContextDto);
        request.getSession().setAttribute(sessionId,adminUserContextDto);
//        MemcachedClientUtils.resetCache(sessionId, AdminConstant.ADMIN_LOGIN_TIMEOUT, adminUserContextDto);
        return "redirect:admin/index";//index.jsp 后台主页
	}

}
