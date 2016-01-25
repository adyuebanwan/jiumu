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
                订单表列表
                <a class="btn btn-app" href="admin/ordermain/detail"><i class="fa fa-edit"></i>新增</a>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">li</a></li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <div class="box-tools">
                                <div class="form">
                                    <div class="box-body">
                                        <div class="row">

                <div class="col-xs-2">
                <div class="form-group">
                    <label for="id">订单号</label>
                        <input type="text" class="form-control" value="${ id }" id="id" name="id">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="buyerName">购货单位</label>
                        <input type="text" class="form-control" value="${ buyerName }" id="buyerName" name="buyerName">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="buyerAdress">地址</label>
                        <input type="text" class="form-control" value="${ buyerAdress }" id="buyerAdress" name="buyerAdress">
                </div>
                </div>
                <div class="col-xs-3">
                <div class="form-group">
                    <label for="createTimeBegin">下单日期起</label>
                    <input id="createTimeBegin" type="text"
                           name="createTimeBegin"
                           class="Wdate form-control"
                           onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})"
                           value="<c:out value='${ createTimeBegin }' escapeXml="
                           false"/>" style="width: 170px;">
                </div>
                </div>

                <div class="col-xs-3">
                <div class="form-group">
                    <label for="createTimeEnd">下单日期止</label>
                    <input id="createTimeEnd" type="text"
                           name="createTimeEnd"
                           class="Wdate form-control"
                           onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})"
                           value="<c:out value='${ createTimeEnd }' escapeXml="
                           false"/>" style="width: 170px;">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="operator">操作人</label>
                        <input type="text" class="form-control" value="${ operator }" id="operator" name="operator">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="orderStatus">订单状态</label>
                        <select class="form-control" id="orderStatus"
                                name="orderStatus">
                                    <option value="">全部</option>
                                    <option value="0"
                                    <c:if test="${ orderStatus == 0 }">
                                        selected
                                    </c:if>
                                    >待审核</option>
                                    <option value="1"
                                    <c:if test="${ orderStatus == 1 }">
                                        selected
                                    </c:if>
                                    >审核通过</option>
                                    <option value="2"
                                    <c:if test="${ orderStatus == 2 }">
                                        selected
                                    </c:if>
                                    >拒绝</option>
                        </select>
                </div>
                </div>
                                            <div class="col-xs-2">
                                                <div class="form-group">
                                                    <label for="querySubmit">&nbsp;</label>
                                                    <button class="btn btn-primary form-control" id="querySubmit">查询</button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="pageCount" value="0">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive" style="overflow: auto">
                            <input type="button" onclick="batchDeleteItem()" value="删除选中项">
                            <table id="example2" class="table table-bordered table-hover dataTable">
                                <thead id="thead">
                                <tr>
                                    <th><input type="checkbox" id="checkAll"></th>
                                    <th>序号</th>
                                                <th class="sorting"  orderField="id">订单号</th>
                                                <th class="sorting"  orderField="account">订单总额</th>
                                                <th class="sorting"  orderField="real_pay">客户实付金额</th>
                                                <th class="sorting"  orderField="buyer_name">购货单位</th>
                                                <th class="sorting"  orderField="buyer_adress">地址</th>
                                                <th class="sorting"  orderField="buyer_phone">电话</th>
                                                <th class="sorting"  orderField="create_time">下单日期</th>
                                                <th class="sorting"  orderField="update_time">更新日期</th>
                                                <th class="sorting"  orderField="operator">操作人</th>
                                                <th class="sorting"  orderField="order_status">订单状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="dataTables_info"></div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="dataTables_paginate paging_bootstrap">
                                        <ul class="pagination" id="pagination">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>
<!-- ./wrapper -->
<%@include file="../include/tail.jsp"%>
<script language="javascript" type="text/javascript"
        src="<%=basePath%>assets/admin/js/My97DatePicker/WdatePicker.js"></script>
<script src="assets/admin/app/ordermain/orderMainPaging.js" type="text/javascript"></script>
</body>
</html>
