<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="good_list is_goods_list">
    <span class="title">所有商品分类</span>
</div>
<div class="all-sort-list" id="common_goodscat">
    <c:forEach var="item" varStatus="sta" items="${categoryList}">
        <div class="item_box " rel="${sta.index+1}">
            <div class="item">
                <div class="common_item_title">
                    <a href="list/${item.id}" class="c_item_title">${item.name}</a>
                </div>
                    <%--<div class="common_item_list">
                        <a href="goods_list.html?cat=5">进2</a>
                        <a href="goods_list.html?cat=24">进口饼干糕点</a>
                        <a href="goods_list.html?cat=27">进口咖啡/茶品</a>
                    </div>--%>
                <!-- 子菜单 -->
                    <%--<div class="item_list clearfix" style="display:none" >
                        <div class="subitem">
                            <dl>
                                <dt><a href="search-cat-5.html">进2<i>></i></a></dt>
                                <dd>
                                    <a href="search-cat-22.html" style="">进品1</a>
                                    <a href="search-cat-23.html" style="">进品酸奶</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt><a href="search-cat-24.html">进口饼干糕点<i>></i></a></dt>
                                <dd>
                                    <a href="search-cat-25.html" style="">进口饼干</a>
                                    <a href="search-cat-26.html" style="">进口糕点</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt><a href="search-cat-27.html">进口咖啡/茶品<i>></i></a></dt>
                                <dd>
                                    <a href="search-cat-28.html" style="">进口红茶</a>
                                    <a href="search-cat-29.html" style="">进口绿茶</a>
                                    <a href="search-cat-30.html" style="">进口速溶咖啡</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt><a href="search-cat-31.html">进口休闲零食<i>></i></a></dt>
                                <dd>
                                    <a href="search-cat-32.html" style="">进口膨化</a>
                                    <a href="search-cat-33.html" style="">进口海产品</a>
                                    <a href="search-cat-34.html" style="">进口果冻/布丁</a>
                                </dd>
                            </dl>
                        </div>
                    </div>--%>
            </div>
            <div class="index-show-children"></div>
        </div>
    </c:forEach>
</div>