<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../common/head.jsp" %>
    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    </meta>
    <%@include file="include/head.jsp" %>
</head>
<body>
<!--最上导航-->
<div class="top">
    <%@include file="include/top.jsp" %>
</div>
<script type="text/javascript" src="assets/web/app/userAndCart.js"></script>
<script type="text/javascript" src="assets/web/js/common_paging.js"></script>
<script type="text/javascript" src="assets/web/app/list.js"></script>
<!--header-->
<div class="header">
    <%@include file="include/header.jsp"%>
</div>
<div class="common_menu">
    <div class="menu">
        <div class="menu_left">
            <!-- 导航  start -->
            <%@include file="include/category.jsp"%>
            <!-- 导航  end -->
        </div>
        <div class="menu_right">
            <ul>
                <li><a href="/version4/index.html">首 页</a></li>
            </ul>
        </div>
    </div>
</div>
<!--header end-->
<link rel="stylesheet" href="assets/web/css/goods_list.css" type="text/css" />
<!-- 推荐商品 -->

<div class="goodslist_nav">
    <div class="goods_selected_left">
    	<span>
    		<a href="index.html">首页</a>
    	</span>
        <span class="arrow">&gt;</span>
        <span>搜索结果</span>
        <span class="arrow">&gt;</span>
    </div>

    <div class="goods_selected_all">
        <div class="have_chosen have_chosen_cat">
            <ul class="have_chosen_goods top_have_chosen_goods">
                <li class="have_chosen_goods_list cur last" rel=" last">
                    <span class=""><a href="goods_list.html?cat=4" >进口食品、进口牛奶</a></span>
                </li>
            </ul>
        </div>
    </div>
</div>
<div style="width:1200px;height:1px;margin:0px auto;clear:both;"></div>
<div class="goods_clear"></div>
<!-- 新版检索html -->
<div class="goodssearch_new">
    <!-- 已选择 -->

    <script>
        $(function(){
            $(".brand_goods_search_more").click(function(){
                var listhidden = $(this).attr("class");
                if(listhidden=="brand_goods_search_more"){
                    $(this).prev().css("height","auto");
                    $(this).removeClass("brand_goods_search_more");
                    $(this).addClass("brand_goods_search_more1");
                    $(this).text("收起");
                }else{
                    $(this).prev().css("height","52px");
                    $(this).removeClass("brand_goods_search_more1");
                    $(this).addClass("brand_goods_search_more");
                    $(this).text("更多");
                }

            })
        })
    </script>
    <div class="wait_select">
        <div class="wait_left">按分类：</div>
        <div class="wait_right">
            <ul>
            <c:forEach var="item" varStatus="sta" items="${categoryList}">
                <li <c:if test="${item.id == oneCategoryId}">class="current"</c:if> ><a  href="list/${item.id}" >${item.name}</a></li>
            </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script>
    $(function(){
        //搜索结果

        $(".top_have_chosen_goods .have_chosen_goods_list").mouseover(function(){
            var ulwidth = $(this).width()
            var ulwidth_white = parseInt(ulwidth)+parseInt("30");
            var ulborder_width = parseInt(ulwidth)+parseInt("141")   //减去ul的2像素边框
            $(".top_have_chosen_goods .have_chosen_goods_list").find(".goods_list_other").hide();
            $(".top_have_chosen_goods .have_chosen_goods_list").find(".ul_border").hide();
            $(this).find(".goods_list_other").show();
            $(this).find(".ul_border").show();
            $(this).find(".goods_list_other").css("width",ulborder_width);
            $(this).find(".ul_border").css("width",ulwidth_white);
            $(this).css({"border":"1px solid #e4393e","border-bottom":"0px none"});
        })

        $(".top_have_chosen_goods .have_chosen_goods_list").mouseleave(function(){
            $(this).find(".goods_list_other").hide();
            $(this).find(".ul_border").hide();
            $(this).css("border","1px solid #ccc");
        })
    })
</script>

<div class="goods_list_all" >
    <!-- 排序 -->
    <div class="goods_bar">
        <div class="sorting_goods">
            <p>排序方式：</p>
            <ul class="goodslist_sort">
                <li><a href="javascript:{}" onclick="sort(this,'')" class="selected asc" >默认</a></li>
                <li><a href="javascript:{}" onclick="sort(this,'sell_price')" class="">价格</a></li>
            </ul>
        </div>
    </div>
    <!-- 商品列表循环  -->
    <input type="hidden" id="pageCount" value="0">
    <input type="hidden" id="oneCategoryId" value="${oneCategoryId}">
    <input type="hidden" id="orderBy" value="${orderBy}">
    <div class="goodslist_circulate" >
        <ul class="goodslist_all" id="tbody"></ul>
    </div>
    <div class="goods_list_page">
        <!-- 结束 -->
        <div class="page" ><span class="info" ></span>
            <span class="info"></span>
            <ul id="pagination"></ul>
        </div>
    </div>
</div>
<script>
    $(function(){
        $(".goodslist_all li").mouseover(function(){
            $(".goodslist_all li").removeClass("item-hover");
            $(this).addClass("item-hover");
        })
        $(".goodslist_all li").mouseleave(function(){
            $(".goodslist_all li").removeClass("item-hover");
        })
    })
</script>
<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp"%>
</div>

</body>
</html>
