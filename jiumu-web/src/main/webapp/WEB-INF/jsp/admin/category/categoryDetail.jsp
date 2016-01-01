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
                商品分类详情
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
                        <form role="form" action="admin/category/save" method="post">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <c:choose><c:when test="${category.id==null}">新增</c:when><c:otherwise>编辑</c:otherwise></c:choose>
                                </h3>
                            </div>
                            <input type="hidden" name="id" value="${category.id}">
                            <div class="box-body">

                        <div class="form-group  hidden ">
                            <label for="id">主键</label>
                                        <input type="text" class="form-control" id="id" name="id" value="${category.id}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="name">分类名称</label>
                                        <input type="text" class="form-control" id="name" name="name" value="${category.name}" placeholder="分类名称">
                        </div>
                        <div class="form-group ">
                            <label for="parentId">父亲节点ID</label>
                                        <input type="text" class="form-control" id="parentId" name="parentId" value="${category.parentId}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="sortNum">排序从小到大</label>
                                        <input type="text" class="form-control" id="sortNum" name="sortNum" value="${category.sortNum}" placeholder="">
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
