<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <%@include file="../../common/head.jsp"%>
    <title>AdminLTE | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <%@include file="../include/head.jsp"%>

</head>
<body class="skin-blue">
<header class="header">
    <%@include file="../include/top.jsp"%>
</header>
<div class="wrapper row-offcanvas row-offcanvas-left">
    <aside class="left-side sidebar-offcanvas">
        <%@include file="../include/left.jsp"%>
    </aside>
    <aside class="right-side">
        <section class="content-header">
            <h1>
                订单详情表详情
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Tables</a></li>
                <li class="active">Data tables</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-10">
                    <div class="box box-primary">
                        <form role="form" action="admin/orderdetail/save" method="post">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <c:choose><c:when test="${orderDetail.id==null}">新增</c:when><c:otherwise>编辑</c:otherwise></c:choose>
                                </h3>
                            </div>
                            <input type="hidden" name="id" value="${orderDetail.id}">
                            <div class="box-body">

                        <div class="form-group  hidden ">
                            <label for="id">订单详情ID</label>
                                        <input type="text" class="form-control" id="id" name="id" value="${orderDetail.id}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="goodsSerialNum">商品编号</label>
                                        <input type="text" class="form-control" id="goodsSerialNum" name="goodsSerialNum" value="${orderDetail.goodsSerialNum}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="goodsName">商品名称</label>
                                        <input type="text" class="form-control" id="goodsName" name="goodsName" value="${orderDetail.goodsName}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="danwei">单位</label>
                                        <input type="text" class="form-control" id="danwei" name="danwei" value="${orderDetail.danwei}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="buyCount">购买数量</label>
                                        <input type="text" class="form-control" id="buyCount" name="buyCount" value="${orderDetail.buyCount}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="price">商品单价</label>
                                        <input type="text" class="form-control" id="price" name="price" value="${orderDetail.price}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="mark">备注</label>
                                        <input type="text" class="form-control" id="mark" name="mark" value="${orderDetail.mark}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="guigeOne">用户购买的商品规格一</label>
                                        <input type="text" class="form-control" id="guigeOne" name="guigeOne" value="${orderDetail.guigeOne}" placeholder="尺寸:300x200">
                        </div>
                        <div class="form-group ">
                            <label for="guigeTwo">用户购买的商品规格二</label>
                                        <input type="text" class="form-control" id="guigeTwo" name="guigeTwo" value="${orderDetail.guigeTwo}" placeholder="颜色:红色">
                        </div>
                        <div class="form-group ">
                            <label for="guigeThree">用户购买的商品规格三</label>
                                        <input type="text" class="form-control" id="guigeThree" name="guigeThree" value="${orderDetail.guigeThree}" placeholder="重量:10g">
                        </div>
                        <div class="form-group ">
                            <label for="guigeFour">用户购买的商品规格四</label>
                                        <input type="text" class="form-control" id="guigeFour" name="guigeFour" value="${orderDetail.guigeFour}" placeholder="容量:10L">
                        </div>
                        <div class="form-group ">
                            <label for="orderMainId">订单ID</label>
                                        <input type="text" class="form-control" id="orderMainId" name="orderMainId" value="${orderDetail.orderMainId}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="goodsId">商品ID</label>
                                        <input type="text" class="form-control" id="goodsId" name="goodsId" value="${orderDetail.goodsId}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="createTime">下单日期</label>
                            <input id="createTime" type="text" name="createTime" class="Wdate form-control" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})" value="<fmt:formatDate value="${ orderDetail.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>" style="width: 170px;">
                        </div>
                        <div class="form-group ">
                            <label for="updateTime">更新日期</label>
                            <input id="updateTime" type="text" name="updateTime" class="Wdate form-control" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})" value="<fmt:formatDate value="${ orderDetail.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>" style="width: 170px;">
                        </div>
                        <div class="form-group ">
                            <label for="operator">操作人</label>
                                        <input type="text" class="form-control" id="operator" name="operator" value="${orderDetail.operator}" placeholder="">
                        </div>

                            </div><!-- /.box-body -->
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">保存</button>
                                <button type="button" onclick="history.go(-1);"  class="btn btn-primary">返回</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </aside>
</div>
<%@include file="../include/tail.jsp"%>
<script language="javascript" type="text/javascript" src="${CTX}assets/admin/js/My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="assets/admin/app/base.js"></script>

</body>
</html>
