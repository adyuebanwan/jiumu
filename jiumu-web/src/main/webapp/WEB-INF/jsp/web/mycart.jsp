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
                            <a href="/version4/cart.html" class="index-go-cart">购物车(<span class="num">0</span>)件<i
                                    class="common-cart-down"></i></a>

                            <div class="cart_content02" style="display:none">
                                <div class="cart_list"><img src="assets/web/images/ajax-loader.gif"
                                                            class="loading"/></div>
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
    $(".login_bar").load("/version4/common/member_bar.html", function () {
        $("#logout").click(function () {
            $.ajax({
                url: "/version4/api/shop/member!logout.do?ajax=yes",
                dataType: "json",
                cache: false,             //清楚缓存，暂时测试，如果产生冲突，请优先考虑是否是这条语句。
                success: function (result) {
                    if (result.result == 1) {
                        $.alert(result.message);
                        location.href = "/version4/index.html";

                    } else {
                        $.alert(result.message);
                    }
                    $.Loading.hide();
                },
                error: function () {
                    $.Loading.hide();
                    $.alert("出错了:(");
                }
            });
            return false;
        })
    });

    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseenter(function () {
        $("#cart_bar_wrapper .cart_content02").slideDown(300);
        $(".common-cart-down").addClass("common-cart-up");
        $(this).addClass("cart-hover");
        //加载购物项
        $("#cart_bar_wrapper .cart_content02").remove(".cart_list");
//	$(".checkout").load("cart/common_totle.html");

    })
    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseleave(function () {
        $("#cart_bar_wrapper .cart_content02").stop(true, true).hide();
        $(".common-cart-down").removeClass("common-cart-up");
        $(this).removeClass("cart-hover");
    })


</script>


<link rel="stylesheet" href="assets/web/css/cart.css" type="text/css"/>
<style>
    .good_list .title {
        color: #fff;
    }
</style>
<div class="h-btm">
    <div class="logo">
        <img src="http://www.javashop.cn/version4/statics/attachment//201512112001371904.jpg" title="logo"/></div>
    <div class="flow-steps">
        <ol class="cur1">
            <li class="num1">
                <span>我的购物车</span>
                <em>1</em>
            </li>
            <li class="num2">
                <span>核对订单信息</span>
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
<div class="mycar-index">
    <h1>购物车</h1>

    <div style="width:1200px;height:1px;overflow:hidden;clear:both;"></div>
    <script type="text/javascript">
        var isLogin = false;
    </script>
    <div id="cart-wrapper">
        <c:choose>
            <c:when test="${cartList==null || cartList.size()<=0}">
                <div class="cart-blank">您的购物车中暂无商品，赶快<a href="index.html">挑选心爱的商品</a>吧！</div>
            </c:when>
            <c:otherwise>
                <table cellspacing="0" cellpadding="3" width="100%">
                    <thead>
                    <tr>
                        <th style="width:650px;">商品名称</th>
                        <th>商品积分</th>
                        <th>销售价格</th>
                        <th>优惠价格</th>
                        <th>数量</th>
                        <th style="width:100px;">小计</th>
                        <th class="cart_last" style="width:100px;">删除</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${cartList}" var="cart">
                        <tr itemid="199" productid="${cart.goodsId}" price="${cart.sellPrice}">
                            <td style="width:650px;">
                                <a target="_blank" href="goods/${cart.goodsId}" class="cart_list_img">
                                    <img src="${CTX}${cart.goodsPic}"
                                         height="50" style="cursor: pointer;" width="36"/> </a>

                                <p><a target="_blank" href="goods/${cart.goodsId}"></a>
                                </p>
                            </td>
                            <td style="font-weight:bold; font-size:14px;">0</td>
                            <td class=" mktprice1" style="font-weight:bold; font-size:14px;">￥19.80</td>
                            <td>￥${cart.sellPrice}</td>
                            <td class="cart-quantity" style="text-align:center;">
                                <div id="num" class="Numinput" value="${cart.buyCount}" itemid="199" productid="${cart.goodsId}">
                                    <span class="numadjust decrease">-</span>
                                    <input size="5" name="num" autocomplete="off" type="text" value="${cart.buyCount}">
                                    <span class="numadjust increase">+</span>
                                </div>
                            </td>
                            <td class="itemTotal" style=" color:#ff6700;font-size: 14px;font-weight: bold;width:100px;">￥${cart.buyCount*cart.sellPrice}</td>
                            <td class="cart_last" style="width:100px;"><a href="javascript:;" class="delete"></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 总价 -->
                <div class="cart-wrapper">
                    <div class="yes_bonded">
                <span class="c08">
                    商品总价
                    <input type="hidden" value="79.2" id="bonded_price">
                    <span class="color02">(不含运费及税费)</span>：
                    <span class="color03">￥79.20</span>
                </span>
                    </div>
                    <div class="cart_tools">
                        <div class="btn">
                            <input type="button" class="clean_btn white-btn" value="清空购物车">
                        </div>
                        <div class="btn">
                            <input type="button" class="returnbuy_btn yellow-btn" value="继续购物"/>
                        </div>

                        <div class="btn">
                            <input type="button" class="checkout-btn green-btn" value="去结算"/>
                        </div>
                    </div>
                </div>
                <div id="login_tip" style="display:none">
                    <div class="message">
                        您当前是游客身份，游客身份购买不能获得积分，<br>
                        确定以游客身份购买吗？
                    </div>
                    <div class="button-wrapper">
                        <div class="btn">
                            <input type="button" class="small-green to-login-btn go-next-button" value="马上登录">
                        </div>

                        <div class="btn">
                            <input type="button" class="small-yellow to-checkout-btn go-next-button" value="立即注册">
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp" %>
</div>
</body>
</html>
</html>
