package com.netease.jiumu.web.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.netease.worldhero.core.spring.JsonWrite;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.Date;

/**
 * 后台用户必须登录controller
 * @author Administrator
 *
 */
public abstract class BaseController extends JsonWrite {
    static final SerializerFeature[] features = { SerializerFeature.WriteDateUseDateFormat, SerializerFeature.WriteMapNullValue };
    static final SerializeConfig config = new SerializeConfig();

    public void toJson(HttpServletResponse response, Object ajaxData)
    {
        try
        {
            byte[] bytes = JSON.toJSONString(ajaxData, config, features).getBytes("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");//text/html application/json
            response.setContentLength(bytes.length);
            OutputStream writer = response.getOutputStream();
            writer.write(bytes);
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    static
    {
        config.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
    }
}
