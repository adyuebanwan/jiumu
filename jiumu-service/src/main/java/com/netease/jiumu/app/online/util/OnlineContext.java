package com.netease.jiumu.app.online.util;

import com.alibaba.fastjson.JSON;
import com.netease.jiumu.app.online.dto.OnlineUserDto;
import com.netease.worldhero.core.cache.xmemcached.utils.MemcachedClientUtils;
import com.netease.worldhero.core.common.utils.StringUtils;
import com.netease.worldhero.core.common.utils.SysPropertiesUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by hedongyu on 2015/6/23.
 * 799374340@qq.com
 */
public class OnlineContext {
    //TODO 这个值需要根据实际情况来设置 也可能是多个
    private static  final String cookieKey = "session";
    public static OnlineUserDto getUserDto(HttpServletRequest request){
        String key = getCookieKey(request);
        /*if(true){
            return new OnlineUserDto(1l);
        }*/

        if(StringUtils.isBlank(key)){
            return null;
        }
        try {
            Object obj = MemcachedClientUtils.get().get(key);
            if(obj == null){
                //正式环境
                String userCheckLoginUrlOnline = SysPropertiesUtil.getProperty("KA_HOST")+"/ka/api/app/user/info";
                //测试环境
                String userCheckLoginUrlTest = SysPropertiesUtil.getProperty("KA_HOST_TEST")+"/ka/api/app/user/info";

                String kaHostTestCheck = SysPropertiesUtil.getProperty("KA_HOST_TEST_CHECK");
                OnlineUserDto dto = null;
                if("onlineOrTest".equals(kaHostTestCheck)){//先去正式环境验证登陆 登陆就ok 没登录 再去测试环境验证下
                    dto = requestUserDto(request,userCheckLoginUrlOnline);
                    if(dto==null){// @TODO
                        dto = requestUserDto(request,userCheckLoginUrlTest);
                    }
                }else if("online".equals(kaHostTestCheck)){//只去正式环境验证登陆
                    dto = requestUserDto(request,userCheckLoginUrlOnline);
                }else if("test".equals(kaHostTestCheck)){//只去测试环境验证登陆
                    dto = requestUserDto(request,userCheckLoginUrlTest);
                }

                if(dto!=null){
                    //重设登录信息在缓存
                    MemcachedClientUtils.resetCache(key,Integer.valueOf(SysPropertiesUtil.getProperty("LOGIN_TIME_OUT_SECONDS")),dto);
                    return dto;
                }

            }else{
                return (OnlineUserDto)obj;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static OnlineUserDto requestUserDto(HttpServletRequest request,String userCheckLoginUrl){
        String[] result = HttpClientWithCookieUtil.doGet(userCheckLoginUrl,null,getCookieStr(request));
        if(HttpClientWithCookieUtil.success200(result[0])){
            return coverToUserDto(result[1]);
        }
        return null;
    }

    private static String getCookieKey(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies!=null && cookies.length>0){
            for(Cookie cookie : cookies){
                if(cookieKey.equals(cookie.getName())){
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
    private static String getCookieStr(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        StringBuffer sb = new StringBuffer();
        if(cookies!=null && cookies.length>0){
            for(Cookie cookie : cookies){
                sb.append(" ").append(cookie.getName()).append("=").append(cookie.getValue()).append(";");
            }
        }
        return sb.toString();
    }
    private static OnlineUserDto coverToUserDto(String userJson){
        Map<String,Object> userMap = (Map<String,Object>)JSON.parse(userJson);
        String code = ""+userMap.get("code");
        if("0".equals(code)){
            Map<String,Object> infoMap = (Map<String,Object>)userMap.get("info");
            Integer id = (Integer)infoMap.get("id");
            String nickName = (String)infoMap.get("nickname");
            String province = (String)infoMap.get("province");
            String city = (String)infoMap.get("city");
            Integer gender = (Integer)infoMap.get("gender");
            String smallLogoUrl = (String)infoMap.get("small_logo_url");
            String middleLogoUrl = (String)infoMap.get("middle_logo_url");
            String largeLogoUrl = (String)infoMap.get("large_logo_url");
            String birthday = (String)infoMap.get("birthday");
            OnlineUserDto dto = new OnlineUserDto();
            dto.setId(Long.valueOf(id));
            dto.setNickName(nickName);
            dto.setProvince(province);
            dto.setCity(city);
            dto.setGender(gender);
            dto.setSmallLogoUrl(smallLogoUrl);
            dto.setMiddleLogoUrl(middleLogoUrl);
            dto.setLargeLogoUrl(largeLogoUrl);
            dto.setBirthday(birthday);
            return dto;
        }
        return null;
    }
}
