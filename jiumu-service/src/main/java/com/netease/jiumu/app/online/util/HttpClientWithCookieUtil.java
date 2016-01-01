package com.netease.jiumu.app.online.util;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.List;

public class HttpClientWithCookieUtil {

    public static String[] doGet(String httpUrl,List<BasicNameValuePair> request,String cookie) {
        String status="";
        String returnResponse = "";
        HttpClient httpClient = HttpClientBuilder.create().build();
        StringBuffer dataURL = new StringBuffer("?");
        if(request!=null && request.size()>=0){
            for (BasicNameValuePair basicNameValuePair : request) {
                dataURL.append(basicNameValuePair.getName()).append("=").append(basicNameValuePair.getValue()).append("&");
            }
        }
        HttpGet get = new HttpGet(httpUrl + dataURL.substring(0, dataURL.length() - 1));
        RequestConfig requestConfig = RequestConfig.custom()
                .setSocketTimeout(4000).setConnectTimeout(4000).build();//设置请求和传输超时时间
        get.setConfig(requestConfig);
        get.addHeader("User-Agent", "http://d.163.com/ contact: su_yan#AT#corp.netease.com");
        get.addHeader("Content-type", "application/json;charset=UTF-8");
        get.addHeader("Accept", "application/json");
        get.addHeader("Cookie",cookie);
        //创建HttpGet实例
        HttpResponse response;
        try {
            response = httpClient.execute(get);
            HttpEntity entity = response.getEntity();
            returnResponse = EntityUtils.toString(entity);
            status = response.getStatusLine().getStatusCode()+"";
            EntityUtils.consume(entity);
        } catch (ClientProtocolException e) {
            status="ClientProtocolException";
            e.printStackTrace();
        } catch (IOException e) {
            status="IOException";
            e.printStackTrace();
        }catch (Exception e) {
            status="Exception";
            e.printStackTrace();
        } finally {
            get.releaseConnection();
            get.abort();
        }
        return new String[]{status,returnResponse};
    }

    public static boolean success200(String status){
        return "200".equals(status);
    }
}
