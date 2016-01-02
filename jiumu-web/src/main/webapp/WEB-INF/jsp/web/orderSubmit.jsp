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
    <div class="welcome">
        <span class="title"><a href="/version4/index.html">您好，欢迎来到本站！</a></span>
        <div class="login_bar login">
        </div>
        <div class="navigation">
            <ul>
                <li class="first">
                    <ul>
                        <li id="cart_bar_wrapper">
                            <a href="/version4/cart.html" class="index-go-cart">购物车(<span class="num">0</span>)件<i class="common-cart-down"></i></a>
                            <div class="cart_content02" style="display:none">
                                <div class="cart_list"><img src="/version4/themes/kaben/images/ajax-loader.gif" class="loading" /></div>
                            </div>
                        </li>
                        <!--购物车下拉菜单结束-->
                    </ul>
                </li>
                <li><a href="/version4/help.html">帮助中心</a></li>
                <li style="background:none;"><a href="#">&nbsp;&nbsp;&nbsp;</a></li>
                <li style="background:none;"><a href="#">&nbsp;&nbsp;&nbsp;</a></li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">


    //加载头部会员信息
    $(".login_bar").load("/version4/common/member_bar.html",function(){
        $("#logout").click(function(){
            $.ajax({
                url:"/version4/api/shop/member!logout.do?ajax=yes",
                dataType:"json",
                cache: false,             //清楚缓存，暂时测试，如果产生冲突，请优先考虑是否是这条语句。
                success:function(result){
                    if(result.result==1){
                        $.alert(result.message);
                        location.href="/version4/index.html";

                    }else{
                        $.alert(result.message);
                    }
                    $.Loading.hide();
                },
                error:function(){
                    $.Loading.hide();
                    $.alert("出错了:(");
                }
            });
            return false;
        })
    });

    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseenter(function(){
        $("#cart_bar_wrapper .cart_content02").slideDown(300);
        $(".common-cart-down").addClass("common-cart-up");
        $(this).addClass("cart-hover");
        //加载购物项
        $("#cart_bar_wrapper .cart_content02").remove(".cart_list");
//	$(".checkout").load("cart/common_totle.html");

    })
    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseleave(function(){
        $("#cart_bar_wrapper .cart_content02").stop(true,true).hide();
        $(".common-cart-down").removeClass("common-cart-up");
        $(this).removeClass("cart-hover");
    })


</script>


<link rel="stylesheet" href="assets/web/css/checkout.css" type="text/css" />

<script src="/version4/themes/kaben/js/Checkout.js" type="text/javascript"></script>
<script src="/version4/themes/kaben/js/checkout_address.js" type="text/javascript"></script>
<style>
    .good_list .title{color:#fff;}
</style>
<div class="h_btm">
    <div class="logo">
        <img src="http://www.javashop.cn/version4/statics/attachment//201512112001371904.jpg" title="logo" />	</div>
    <div class="flow-steps">
        <ol class="cur1">
            <li class="num1">
                <span>我的购物车</span>
                <em>1</em>
            </li>
            <li class="num2">
                <span>收货人信息</span>
                <em>2</em>
            </li>
            <li class="num3">
                <span>成功提交订单</span>
                <em>3</em>
            </li>
            <li class="clear"></li>
        </ol>
    </div>
</div>
<div class="my_checkout_box checkout_box">
    <div class="my_checkout">
        <h6>收货人信息</h6>
        <div style="width:1200px;height:1px;overflow:hidden;clear:both;"></div>

        <div id="checkout_wrapper">
            <div class="pay_frame">
                <form class="validate" id="checkoutform" action="myorder/save" method="post">
                    <h3>输入收货人单位或名称</h3>
                    <div class="box address ">
                        <div class="modify" >
                            <input type="text" value="" size="40" name="userName" class="c_addr">
                        </div>
                    </div>
                    <div class="goods_wrapper">
                        <h3>商品清单<a href="mycart/">[返回购物车修改]</a></h3>
                        <table cellspacing="0" cellpadding="3" width="100%" >
                            <thead>
                            <tr>
                                <th>图片</th>
                                <th>商品名称</th>
                                <th>价格</th>
                                <th>数量</th>
                                <th>备注</th>
                                <th>小计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${cartList==null || cartList.size()<=0}">
                                    <div class="cart-blank">您的购物车中暂无商品，赶快<a href="index.html">挑选心爱的商品</a>吧！</div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${cartList}" var="cart">
                                        <tr itemid="${cart.itemId}" >
                                            <td>
                                                <a target="_blank" href="goods/${cart.goodsId}">
                                                    <span  class="cart-product-img">
                                                        <img src="${cart.goodsPic}" height="50" style="cursor: pointer;" />
                                                    </span>
                                                </a>
                                            </td>
                                            <td style="text-align: left;">
                                                <a target="_blank" href="goods/${cart.goodsId}">${cart.goodsName}</a>
                                            </td>
                                            <td>￥${cart.sellPrice}</td>
                                            <td>${cart.buyCount}</td>
                                            <td><input name="remark" value=""/></td>
                                            <td class="itemTotal">￥${cart.buyCount*cart.sellPrice}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div>订单总额：￥${cartTotalAccount}</div>
                    <div class="order_total btn" disabled="true">
                        <input type="submit" id="createBtn" class="enable green-btn" value="提交订单"/>
                    </div>
                </form>
            </div>
        </div>
        <div id="add_the_address"></div>
    </div>


</div>

<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp" %>

</div>

</body>
</html>

