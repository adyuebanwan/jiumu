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
                商品分类管理
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

                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive" style="overflow: auto">
                            <div class="zTreeDemoBackground left">
                                <ul id="treeDemo" class="ztree"></ul>
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
<link rel="stylesheet" href="assets/admin/js/zTree_v3/css/demo.css" type="text/css"/>
<link rel="stylesheet" href="assets/admin/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css"/>

<%--<script src="assets/admin/js/zTree_v3/js/jquery-1.4.4.min.js" type="text/javascript"></script>--%>
<script src="assets/admin/js/zTree_v3/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
<script src="assets/admin/js/zTree_v3/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
<script src="assets/admin/js/zTree_v3/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<SCRIPT type="text/javascript">
    <!--
    var setting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: false
        },
        edit: {
            enable: true,
            editNameSelectAll: true,
            showRemoveBtn: showRemoveBtn,
            showRenameBtn: showRenameBtn
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeDrag: beforeDrag,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove,
            beforeRename: beforeRename,
            onRemove: onRemove,
            onRename: onRename
        }
    };


    var log, className = "dark";
    function beforeDrag(treeId, treeNodes) {
        return false;
    }
    function beforeEditName(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        return true;
    }
    function beforeRemove(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        return true;
    }

    function beforeRename(treeId, treeNode, newName, isCancel) {
        className = (className === "dark" ? "":"dark");
        if (newName.length == 0) {
            alert("节点名称不能为空.");
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            setTimeout(function(){zTree.editName(treeNode)}, 10);
            return false;
        }
        return true;
    }

    function showRemoveBtn(treeId, treeNode) {
        if(treeNode.id ==0){
            return false;
        }
        return !treeNode.isParent
    }
    function showRenameBtn(treeId, treeNode) {
        return true;
    }
    function getTime() {
        var now= new Date(),
                h=now.getHours(),
                m=now.getMinutes(),
                s=now.getSeconds(),
                ms=now.getMilliseconds();
        return (h+":"+m+":"+s+ " " +ms);
    }

    //改名
    function onRename(e, treeId, treeNode, isCancel) {
        $.getJSON("admin/category/rename_node/"+treeNode.id+"/"+treeNode.name,{date:new Date().getTime()},function(data){
            if(data != 'ok'){
                alert("改名失败")
            }
        })
    }
    //删除
    function onRemove(e, treeId, treeNode) {
        $.getJSON("admin/category/remove_node/"+treeNode.id,{date:new Date().getTime()},function(data){
            if(data != 'ok'){
                alert("删除失败")
            }
        })
    }
    var newCount = 1;
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) btn.bind("click", function(){//新增
            if(treeNode.pId == 0 ){
                $.getJSON("admin/category/add_node/"+treeNode.id,{date:new Date().getTime()},function(data){
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    zTree.addNodes(treeNode, {id:(data), pId:treeNode.id, name:"新节点" + (data)});
                })
            }else{
                alert("分类目前最多支持2层")
            }
            return false;
        });
    };
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };

    $(document).ready(function(){

        $.getJSON("admin/category/init_node",{date:new Date().getTime()},function(zNodes){
            if(zNodes){
                for(var i=0;i<zNodes.length;i++){
                    zNodes[i].pId = zNodes[i].parentId
                }
            }
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        })

    });
    //-->
</SCRIPT>
<style type="text/css">
    .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>

</body>
</html>
