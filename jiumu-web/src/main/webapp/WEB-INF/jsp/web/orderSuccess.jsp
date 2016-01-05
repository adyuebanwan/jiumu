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
    <style>
        .h_btm .flow-steps ol .num3{
            background: #ff6700;
        }
        .h_btm .flow-steps ol .num3 span{
            color: #ff6700;
        }
        .h_btm .flow-steps ol .num3 em{
            background: #ff6700 none repeat scroll 0 0;
            color: #fff;
        }
    </style>
</head>
<body>
<!--最上导航-->
<div class="top">
    <%@include file="include/top.jsp" %>
</div>
<script type="text/javascript" src="assets/web/app/userAndCart.js"></script>

<link rel="stylesheet" href="assets/web/css/checkout.css" type="text/css" />



<!--正文-->
<div id="main">
    <!--上部填写信息单、购买流程-->
    <div class="h_btm">
        <div class="logo"><img src="assets/web/img/logo.png" title="logo" /></div>
        <div class="flow-steps">
            <ol class="cur1">
                <li class="num1"><span>我的购物车</span> <em>1</em></li>
                <li class="num2"><span>收货人信息</span> <em>2</em></li>
                <li class="num3"><span>成功提交订单</span> <em>3</em></li>
                <li class="clear"></li>
            </ol>
        </div>
    </div>
    <!--上不填写信息单、购买流程结束-->
    <c:if test="${hasSubmit}"></c:if>
    <c:choose>
        <c:when test="${hasSubmit}">
            <div class="encircle">您的订单已经提交过了
                <div class="checkout_order_tools ">
                    <a href="/index" class="go_continue">继续购物</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="encircle">
                <img src="assets/web/img/jstj.jpg" alt="结算提交凭证正确对号图片" />		<div class="checkout_order_right">
                <h1>
                    恭喜，订单提交成功，就差去付款了！<span>应付金额：<i>￥${cartTotalAccount}</i></span>
                </h1>
                <div class="checkout_order_summary">
                    <div class="summary_word" style="display:none">
                        <p>
                            订单号：<span>${orderId}</span>收货信息：<i>${userName}</i><i></i>
                        </p>
                    </div>
                    <a href="javascript:void(0)" class="checkout_order_more"><em>收起</em><i class="order-succes-up"></i></a>
                </div>
                <div class="checkout_order_intro">
                    <div class="checkout_order_same">
                        <p>订单号：</p>
                        <span>${orderId}</span>
                    </div>
                    <div class="checkout_order_same">
                        <p>收货信息：</p>
                        <i>${userName}</i> <i></i>
                        <i></i>
                    </div>

                    <div class="checkout_order_tools ">
                        <a href="/index" class="go_continue">继续购物</a>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

</div>
<!--正文结束-->
<script>
    $(function(){
        $(".checkout_order_more").click(function(){
            if( $(".summary_word").css("display")!='none' ){
                $(this).find("em").text("收起");
                $(this).find("i").addClass("order-succes-up");
            } else{
                $(this).find("em").text("展开");
                $(this).find("i").removeClass("order-succes-up");
            }
            $(".checkout_order_intro").toggle(500);
            $(".summary_word").toggle(500);
        })
    })
</script>
<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp" %>
</div>

</body>
</html>

