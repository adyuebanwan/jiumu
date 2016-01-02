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
                商品列表
                <a class="btn btn-app" href="admin/goods/detail"><i class="fa fa-edit"></i>新增</a>
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
                    <label for="name">商品名称</label>
                        <input type="text" class="form-control" value="${ name }" id="name" name="name">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="serialNum">商品编号</label>
                        <input type="text" class="form-control" value="${ serialNum }" id="serialNum" name="serialNum">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="publishStatus">发布状态</label>
                        <select class="form-control" id="publishStatus"
                                name="publishStatus">
                                    <option value="">全部</option>
                                    <option value="0"
                                    <c:if test="${ publishStatus == 0 }">
                                        selected
                                    </c:if>
                                    >下架</option>
                                    <option value="1"
                                    <c:if test="${ publishStatus == 1 }">
                                        selected
                                    </c:if>
                                    >上架</option>
                        </select>
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="sellPrice">销售价格</label>
                        <input type="text" class="form-control" value="${ sellPrice }" id="sellPrice" name="sellPrice">
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="buyPrice">进货价格</label>
                        <input type="text" class="form-control" value="${ buyPrice }" id="buyPrice" name="buyPrice">
                </div>
                </div>
                <div class="col-xs-3">
                <div class="form-group">
                    <label for="createTimeBegin">创建日期起</label>
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
                    <label for="createTimeEnd">创建日期止</label>
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
                    <label for="top">是否推荐到首页</label>
                        <select class="form-control" id="top"
                                name="top">
                                    <option value="" >全部</option>
                                    <option value="1"
                                    <c:if test="${ top == 1 }">
                                        selected
                                    </c:if>
                                    >是</option>
                                    <option value="0"
                                    <c:if test="${ top == 0 }">
                                        selected
                                    </c:if>
                                    >否</option>
                        </select>
                </div>
                </div>
                <div class="col-xs-2">
                <div class="form-group">
                    <label for="topCategoty">是否推荐到首页分类下的大图</label>
                        <select class="form-control" id="topCategoty"
                                name="topCategoty">
                            <option value="" >全部</option>
                            <option value="1"
                                    <c:if test="${ topCategoty == 1 }">
                                        selected
                                    </c:if>
                                    >是</option>
                                    <option value="0"
                                    <c:if test="${ topCategoty == 0 }">
                                        selected
                                    </c:if>
                                    >否</option>
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
                                                <th class="sorting"                                                    orderField="name">商品名称</th>
                                                <th class="sorting"                                                    orderField="serial_num">商品编号</th>
                                                <th class="sorting"                                                    orderField="publish_status">发布状态</th>
                                                <th class="sorting"                                                    orderField="sell_price">销售价格</th>
                                                <th class="sorting"                                                    orderField="buy_price">进货价格</th>
                                                <th class="sorting"                                                    orderField="store_num">库存数量</th>
                                                <th class="sorting"                                                    orderField="operator">操作人</th>
                                                <th class="sorting"                                                    orderField="create_time">创建日期</th>
                                                <th class="sorting"                                                    orderField="update_time">更改日期</th>
                                                <th class="sorting"                                                    orderField="top">是否推荐到首页</th>
                                                <th class="sorting"                                                    orderField="top_categoty">是否推荐到首页分类下的大图</th>
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
<script src="assets/admin/app/goods/goodsPaging.js" type="text/javascript"></script>
</body>
</html>
