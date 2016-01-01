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
                订单表详情
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
                        <form role="form" action="admin/ordermain/save" method="post">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <c:choose><c:when test="${orderMain.id==null}">新增</c:when><c:otherwise>编辑</c:otherwise></c:choose>
                                </h3>
                            </div>
                            <input type="hidden" name="id" value="${orderMain.id}">
                            <div class="box-body">

                        <div class="form-group  hidden ">
                            <label for="id">订单号</label>
                                        <input type="text" class="form-control" id="id" name="id" value="${orderMain.id}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="account">订单总额</label>
                                        <input type="text" class="form-control" id="account" name="account" value="${orderMain.account}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="realPay">客户实付金额</label>
                                        <input type="text" class="form-control" id="realPay" name="realPay" value="${orderMain.realPay}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="buyerName">购货单位</label>
                                        <input type="text" class="form-control" id="buyerName" name="buyerName" value="${orderMain.buyerName}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="buyerAdress">地址</label>
                                        <input type="text" class="form-control" id="buyerAdress" name="buyerAdress" value="${orderMain.buyerAdress}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="buyerPhone">电话</label>
                                        <input type="text" class="form-control" id="buyerPhone" name="buyerPhone" value="${orderMain.buyerPhone}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="createTime">下单日期</label>
                            <input id="createTime" type="text" name="createTime" class="Wdate form-control" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})" value="<fmt:formatDate value="${ orderMain.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>" style="width: 170px;">
                        </div>
                        <div class="form-group ">
                            <label for="updateTime">更新日期</label>
                            <input id="updateTime" type="text" name="updateTime" class="Wdate form-control" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})" value="<fmt:formatDate value="${ orderMain.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>" style="width: 170px;">
                        </div>
                        <div class="form-group ">
                            <label for="operator">操作人</label>
                                        <input type="text" class="form-control" id="operator" name="operator" value="${orderMain.operator}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="orderStatus">订单状态</label>
                               <select class="form-control" id="orderStatus" name="orderStatus">
                                            <option value="0" <c:if test="${ orderMain.orderStatus == 0 }">selected</c:if> >待审核</option>
                                            <option value="1" <c:if test="${ orderMain.orderStatus == 1 }">selected</c:if> >审核通过</option>
                                            <option value="2" <c:if test="${ orderMain.orderStatus == 2 }">selected</c:if> >拒绝</option>
                               </select>
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
