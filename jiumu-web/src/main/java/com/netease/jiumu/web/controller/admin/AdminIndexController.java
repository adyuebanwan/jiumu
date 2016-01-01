package com.netease.jiumu.web.controller.admin;

import com.netease.permission.app.dto.AdminUserContextDto;
import com.netease.permission.app.dto.AdminUserDto;
import com.netease.permission.app.model.AdminUser;
import com.netease.permission.app.utils.AdminUserContext;
import com.netease.worldhero.core.cache.ehcache.utils.EhcacheUtils;
import com.netease.worldhero.core.cache.xmemcached.utils.MemcachedClientUtils;
import com.netease.worldhero.core.common.dto.AjaxData;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import net.rubyeye.xmemcached.exception.MemcachedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeoutException;

/**
 * Created by hedongyu on 14-8-20.
 * 799374340@qq.com
 */
@Controller
public class AdminIndexController extends AdminLoginController{

    @RequestMapping(value = "/admin/index", method = RequestMethod.GET)
    public String index(HttpServletRequest request,ModelMap model) {
        return "admin/index";
    }

    @RequestMapping(value = "/admin/loginMessage", method = RequestMethod.GET)
    public void loginMessage(HttpServletRequest request,HttpServletResponse response,ModelMap model){
        String sessionId = AdminUserContext.getSessionKey();
        AdminUserDto adminUser = null;
        try {
            AdminUserContextDto adminUserContextDto = MemcachedClientUtils.get().get(sessionId);
            adminUser = adminUserContextDto.getAdminUser();
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (MemcachedException e) {
            e.printStackTrace();
        }
        Map<String,String> map = new HashMap<String,String>();
        map.put("userName",adminUser.getUserName());
        toJson(response, new AjaxData("",map));
    }

    @RequestMapping(value="/admin/loginOut")
    public String loginOut(HttpServletRequest request,HttpServletResponse response,ModelMap model){
        String sessionId = AdminUserContext.getSessionKey();
//        EhcacheUtils.removeCache(sessionId);
        try {
            MemcachedClientUtils.get().delete(sessionId);
            return "admin/login";
        } catch (TimeoutException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (MemcachedException e) {
            e.printStackTrace();
        }
        return "admin/index";
    }
}
