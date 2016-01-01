package com.netease.jiumu.app.utils;

import com.netease.worldhero.core.common.utils.MapUtils;

import java.util.Map;

/**
 * Created by hedongyu on 2015/5/22.
 * 799374340@qq.com
 */
public class ProjectUtil {
    public static Map<String,Object> buildMap(String key,Object value ,Object... args){
        return MapUtils.buildMap(key, value, args);
    }
}
