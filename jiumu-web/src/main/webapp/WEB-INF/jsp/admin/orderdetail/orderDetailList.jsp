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
                订单详情表列表
                <a class="btn btn-app" href="admin/orderdetail/detail"><i class="fa fa-edit"></i>新增</a>
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
                    <label for="goodsSerialNum">商品编号</label>
                        <input type="text" class="form-control" value="${ goodsSerialNum }" id="goodsSerialNum" name="goodsSerialNum">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="goodsName">商品名称</label>
                        <input type="text" class="form-control" value="${ goodsName }" id="goodsName" name="goodsName">
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
                                                <th class="sorting"                                                    orderField="id">订单详情ID</th>
                                                <th class="sorting"                                                    orderField="goods_serial_num">商品编号</th>
                                                <th class="sorting"                                                    orderField="goods_name">商品名称</th>
                                                <th class="sorting"                                                    orderField="danwei">单位</th>
                                                <th class="sorting"                                                    orderField="buy_count">购买数量</th>
                                                <th class="sorting"                                                    orderField="price">商品单价</th>
                                                <th class="sorting"                                                    orderField="create_time">下单日期</th>
                                                <th class="sorting"                                                    orderField="update_time">更新日期</th>
                                                <th class="sorting"                                                    orderField="operator">操作人</th>
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
        src="${CTX}assets/admin/js/My97DatePicker/WdatePicker.js"></script>
<script src="assets/admin/app/orderdetail/orderDetailPaging.js" type="text/javascript"></script>
</body>
</html>
