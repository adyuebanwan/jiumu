<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="logo_area">
    <div class="logo">
        <a href="/">
            <img src="assets/web/img/logo.png" title="logo" />			</a>
    </div>
    <div class="search_area">
        <div class="search">
            <input type="text" class="hunt" id="keyword" value="${keyword}" placeholder="请输入产品关键字等..." />
            <input type="button" name="s_seek" class="s_seek" value="搜 索" id="searchBtn">
        </div>
        <div class="hot_keyword">
            <h1>热门搜索：</h1>
            <ul>
                <!-- 获取CMS数据搜索标签， -->
                <!-- 调用CMS数据搜索标签，并传递所在模型ID参数(es_hot_keyword表.)“3”表示出现三个关键词。 -->
            </ul>
        </div>
    </div>
    <div class="service_tel">
        <img src="assets/web/img/cn.png" alt="承诺图片" />		</div>
</div>