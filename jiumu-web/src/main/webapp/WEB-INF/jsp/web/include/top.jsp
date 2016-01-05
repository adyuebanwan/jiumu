<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="welcome">
    <span class="title"><a href="/">您好，欢迎来到本站！</a></span>
    <div class="login_bar login">
    </div>
    <div class="navigation">
        <ul>
            <li class="first">
                <ul>
                    <li id="cart_bar_wrapper">
                        <a href="mycart" class="index-go-cart">购物车(<span class="num">0</span>)件<i class="common-cart-down"></i></a>
                        <div class="cart_content02" style="display:none">
                            <div class="cart_list"><img src="assets/web/img/ajax-loader.gif" class="loading" /></div>
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