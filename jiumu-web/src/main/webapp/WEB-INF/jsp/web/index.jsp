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
                <%--<li><a href="/version4/goods_list.html?cat=1">零食天地</a></li>
                <li><a href="/version4/goods_list.html?cat=4">进口食品</a></li>
                <li><a href="/version4/goods_list.html?cat=38">个人护理</a></li>
                <li><a href="/version4/goods_list.html?cat=35">箱包钟表</a></li>--%>
            </ul>
        </div>
    </div>
</div>
<!--header end-->

<script src="assets/web/js/slider.js" type="text/javascript"></script>
<!-- 获取商品列表标签 -->
<!-- 调用广告标签 -->
<!-- 调用广告信息,传递参数acid:1 -->
<!-- 获取广告列表 -->
<%--<div class="max-adv">
    <div id="index-adv" class="flexslider">
        <ul class="slides">
            <li style="background:transparent url(http://www.javashop.cn/version4/statics/attachment/adv/201512211629309212.jpg) no-repeat scroll center top / cover "/>
            </li>
            <li style="background:transparent url(http://www.javashop.cn/version4/statics/attachment/adv/201512232158274233.jpg) no-repeat scroll center top / cover "/>
            </li>
        </ul>

    </div>
</div>--%>
<script type="text/javascript">
    //计算广告高度
    function advheight() {
        var advBoxHeight = $(window).height() * 0.565;
        $(".slides").css("height", advBoxHeight + "px");
    }
    $(function () {
        $('#index-adv').flexslider({
            animation: "slide",
            direction: "horizontal",
            easing: "swing"
        });

        $(".flexslider").mouseover(function () {
            $(".max-adv .flexslider .flex-direction-nav li a").show(500);
        })

        $(".flexslider").mouseleave(function () {
            $(".max-adv .flexslider .flex-direction-nav li a").hide();
        })
//	advheight();
    });
</script>
<div class="index-main">
    <script>
        $(function () {
            $('#groupbuy').flexslider({
                animation: "slide",
                direction: "horizontal",
                easing: "swing"
            });
        })
    </script>
    <!--  相同楼层 -->
    <c:forEach items="${all}" var="indexDto" varStatus="sta">
    <div class="index-same-fool">
        <div class="index-same-tile index-${sta.index+1}">
            <h1>${indexDto.category.name}<span></span></h1>
            <ul>
            </ul>
        </div>
        <div class="same-box">
            <div class="same-box-left">
                    <div class="index-beand-list">
                          <ul>
                              <li>
                                  <a href="goods_list.html?brand=1">
                                      <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211150124684.jpg"
                                           alt="旺旺" border="0"/> </a>
                              </li>

                              <li>
                                  <a href="goods_list.html?brand=2">
                                      <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211143461491.jpg"
                                           alt="新农哥" border="0"/> </a>
                              </li>

                              <li>
                                  <a href="goods_list.html?brand=7">
                                      <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211200113292.jpg"
                                           alt="天喔" border="0"/> </a>
                              </li>

                              <li>
                                  <a href="goods_list.html?brand=4">
                                      <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211152387107.gif"
                                           alt="百味林" border="0"/> </a>
                              </li>

                              <li>
                                  <a href="goods_list.html?brand=96">
                                      <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240103545878.jpg"
                                           alt="百变猪排" border="0"/> </a>
                              </li>

                              <li>
                                  <a href="goods_list.html?brand=17">
                                      <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221658088525.jpg"
                                           alt="大白兔" border="0"/> </a>
                              </li>

                              <li>
                                  <a href="goods_list.html?brand=16">
                                      <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221654250514.jpg"
                                           alt="阿尔卑斯" border="0"/> </a>
                              </li>

                              <li>
                                  <a href="goods_list.html?brand=10">
                                      <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221035341549.gif"
                                           alt="瑞士莲" border="0"/> </a>
                              </li>
                          </ul>
                      </div>
                      <!-- 创建商品分类标签 -->
                      <!-- 调用商品分类信息 -->
                      <div class="same-cat">
                          <a href="/version4/goods_list.html?cat=6" title="坚果">坚果</a>
                          <a href="/version4/goods_list.html?cat=7" title="蜜饯">蜜饯</a>
                          <a href="/version4/goods_list.html?cat=8" title="肉干">肉干</a>
                          <!--  <a href="search-cat-2.html" class="menu">休闲零食 </a><br/>-->
                          <a href="/version4/goods_list.html?cat=10" title="巧克力">巧克力</a>
                          <a href="/version4/goods_list.html?cat=11" title="糖果">糖果</a>
                          <a href="/version4/goods_list.html?cat=12" title="口香糖">口香糖</a>
                          <!--  <a href="search-cat-3.html" class="menu">糖果/巧克力</a><br/>-->
                          <a href="/version4/goods_list.html?cat=14" title="碳酸饮料">碳酸饮料</a>
                          <a href="/version4/goods_list.html?cat=15" title="茶饮料">茶饮料</a>
                          <a href="/version4/goods_list.html?cat=16" title="果汁">果汁</a>
                          <!--  <a href="search-cat-13.html" class="menu">饮料</a><br/>-->
                          <a href="/version4/goods_list.html?cat=19" title="白酒">白酒</a>
                          <a href="/version4/goods_list.html?cat=20" title="啤酒">啤酒</a>
                          <a href="/version4/goods_list.html?cat=21" title="洋酒">洋酒</a>
                          <!--  <a href="search-cat-18.html" class="menu">酒水</a><br/>-->
                      </div>
                  </div>
                <c:if test="${indexDto.topCategory !=null}">
                    <div class="same-box-middel">
                        <a target="_blank" title="${indexDto.topCategory.name}" href="goods/${indexDto.topCategory.id}">
                            <img src="${indexDto.topCategory.bigPic}" alt="${indexDto.topCategory.name}"border="0"/>
                        </a>
                    </div>
                </c:if>
                <div class="same-box-right">
                    <ul>
                        <c:forEach items="${indexDto.topList}" var="goods">
                            <li>
                                <div class="goods-img">
                                    <a target="_blank" href="goods/${goods.id}">
                                        <img src="${goods.smallPic}"
                                             alt="${goods.name}" class="scrollLoading"/> </a>
                                </div>
                                <div class="goods-name">
                                    <a target="_blank" href="goods/${goods.id}">${goods.name}</a>
                                </div>
                                <div class="goods-price">
                                    <span>￥${goods.sellPrice}</span>
                                    <!--
                                    <del class="original">市场价：￥27.00</del>
                                    -->
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp"%>
</div>

</body>
</html>
