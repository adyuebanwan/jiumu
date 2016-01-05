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

<link rel="stylesheet" href="assets/web/css/checkout.css" type="text/css" />

<%--<script src="/version4/themes/kaben/js/Checkout.js" type="text/javascript"></script>
<script src="/version4/themes/kaben/js/checkout_address.js" type="text/javascript"></script>--%>
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

