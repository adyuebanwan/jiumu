<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="good_list is_goods_list">
    <span class="title">所有商品分类</span>
</div>
<div class="all-sort-list" id="common_goodscat">
    <c:forEach var="item" varStatus="sta" items="${categoryDtoList}">
        <div class="item_box " rel="${sta.index+1}">
            <div class="item">
                <div class="common_item_title">
                    <a href="list/${item.category.id}/0" class="c_item_title">${item.category.name}</a>
                </div>
                    <%--<div class="common_item_list">
                        <a href="goods_list.html?cat=5">进2</a>
                        <a href="goods_list.html?cat=24">进口饼干糕点</a>
                        <a href="goods_list.html?cat=27">进口咖啡/茶品</a>
                    </div>--%>
                <!-- 子菜单 -->
                    <div class="item_list clearfix" style="display:none" >
                        <div class="subitem">
                            <dl>
                                <%--<dt><a href="search-cat-5.html">进2<i>></i></a></dt>--%>
                                <dd>
                                    <c:forEach items="${item.children}" var="child">
                                        <a href="list/${item.category.id}/${child.id}" style="">${child.name}</a>
                                    </c:forEach>
                                </dd>
                            </dl>
                        </div>
                    </div>
            </div>
            <div class="index-show-children"></div>
        </div>
    </c:forEach>
</div>