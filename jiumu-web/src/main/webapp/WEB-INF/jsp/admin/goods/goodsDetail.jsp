<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <%@include file="../../common/head.jsp"%>
    <title>AdminLTE | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <%@include file="../include/head.jsp"%>
        <link rel="stylesheet" href="assets/admin/js/kindeditor-4.1.10/themes/default/default.css" />
        <link rel="stylesheet" href="assets/admin/js/kindeditor-4.1.10/plugins/code/prettify.css" />

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
                商品详情
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
                        <form role="form" action="admin/goods/save" method="post">
                            <div class="box-header">
                                <h3 class="box-title">
                                    <c:choose><c:when test="${goods.id==null}">新增</c:when><c:otherwise>编辑</c:otherwise></c:choose>
                                </h3>
                            </div>
                            <input type="hidden" name="id" value="${goods.id}">
                            <div class="box-body">

                        <div class="form-group  hidden ">
                            <label for="id">主键</label>
                                        <input type="text" class="form-control" id="id" name="id" value="${goods.id}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="name">商品名称</label>
                                        <input type="text" class="form-control" id="name" name="name" value="${goods.name}" placeholder="商品名称">
                        </div>
                        <div class="form-group ">
                            <label for="serialNum">商品编号</label>
                                        <input type="text" class="form-control" id="serialNum" name="serialNum" value="${goods.serialNum}" placeholder="商品编号">
                        </div>
                        <div class="form-group ">
                            <label for="publishStatus">发布状态</label>
                               <select class="form-control" id="publishStatus" name="publishStatus">
                                            <option value="0" <c:if test="${ goods.publishStatus == 0 }">selected</c:if> >下架</option>
                                            <option value="1" <c:if test="${ goods.publishStatus == 1 }">selected</c:if> >上架</option>
                               </select>
                        </div>
                        <div class="form-group ">
                            <label for="marketPrice">市场价格</label>
                                        <input type="text" class="form-control" id="marketPrice" name="marketPrice" value="${goods.marketPrice}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="sellPrice">销售价格</label>
                                        <input type="text" class="form-control" id="sellPrice" name="sellPrice" value="${goods.sellPrice}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="buyPrice">进货价格</label>
                                        <input type="text" class="form-control" id="buyPrice" name="buyPrice" value="${goods.buyPrice}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="thumbnailPic">商品缩略图</label>
                            <img id="thumbnailPicReview"  src="${CTX}${goods.thumbnailPic}" />
                            <input type="text" class="form-control" id="thumbnailPic" name="thumbnailPic" value="${goods.thumbnailPic}" placeholder="">
                            <input type="file" id="thumbnailPicFile" name="myfiles" onchange="uploadFile('thumbnailPic','goods')" class="file"/>
                        </div>
                        <div class="form-group ">
                            <label for="smallPic">商品小图</label>
                            <img id="smallPicReview"  src="${CTX}${goods.smallPic}" />
                            <input type="text" class="form-control" id="smallPic" name="smallPic" value="${goods.smallPic}" placeholder="">
                            <input type="file" id="smallPicFile" name="myfiles" onchange="uploadFile('smallPic','goods')" class="file"/>
                        </div>
                        <div class="form-group ">
                            <label for="bigPic">商品大图</label>
                            <img id="bigPicReview"  src="${CTX}${goods.bigPic}" />
                            <input type="text" class="form-control" id="bigPic" name="bigPic" value="${goods.bigPic}" placeholder="">
                            <input type="file" id="bigPicFile" name="myfiles" onchange="uploadFile('bigPic','goods')" class="file"/>
                        </div>
                        <div class="form-group ">
                            <label for="storeNum">库存数量</label>
                                        <input type="text" class="form-control" id="storeNum" name="storeNum" value="${goods.storeNum}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="oneCategoryId">商品一级分类</label>
                                        <input type="text" class="form-control" id="oneCategoryId" name="oneCategoryId" value="${goods.oneCategoryId}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="twoCategoryId">商品二级分类</label>
                                        <input type="text" class="form-control" id="twoCategoryId" name="twoCategoryId" value="${goods.twoCategoryId}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="threeCategoryId">商品三级分类</label>
                                        <input type="text" class="form-control" id="threeCategoryId" name="threeCategoryId" value="${goods.threeCategoryId}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="guigeOne">商品规格一</label>
                                        <input type="text" class="form-control" id="guigeOne" name="guigeOne" value="${goods.guigeOne}" placeholder="多个规格用|分隔例如 尺寸:300x200|200x100">
                        </div>
                        <div class="form-group ">
                            <label for="guigeTwo">商品规格二</label>
                                        <input type="text" class="form-control" id="guigeTwo" name="guigeTwo" value="${goods.guigeTwo}" placeholder="多个规格用|分隔例如 颜色:红色|黄色">
                        </div>
                        <div class="form-group ">
                            <label for="guigeThree">商品规格三</label>
                                        <input type="text" class="form-control" id="guigeThree" name="guigeThree" value="${goods.guigeThree}" placeholder="多个规格用|分隔例如 重量:10g|20g">
                        </div>
                        <div class="form-group ">
                            <label for="guigeFour">商品规格四</label>
                                        <input type="text" class="form-control" id="guigeFour" name="guigeFour" value="${goods.guigeFour}" placeholder="多个规格用|分隔例如 容量:10L|20L">
                        </div>
                        <div class="form-group ">
                            <label for="danwei">单位</label>
                                        <input type="text" class="form-control" id="danwei" name="danwei" value="${goods.danwei}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="biaohao">产品标号</label>
                                        <input type="text" class="form-control" id="biaohao" name="biaohao" value="${goods.biaohao}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="createDay">生产日期</label>
                                        <input type="text" class="form-control" id="createDay" name="createDay" value="${goods.createDay}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="fixDay">保质期</label>
                                        <input type="text" class="form-control" id="fixDay" name="fixDay" value="${goods.fixDay}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="createPlace">产地</label>
                                        <input type="text" class="form-control" id="createPlace" name="createPlace" value="${goods.createPlace}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="factory">厂家</label>
                                        <input type="text" class="form-control" id="factory" name="factory" value="${goods.factory}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="goodDesc">详细描述</label>
                                    <textarea class="form-control" id="goodDesc" cols="100" rows="8"
 style="width:680px;height:200px;visibility:hidden;"                                     name="goodDesc" placeholder="">${goods.goodDesc}</textarea>
                        </div>
                        <div class="form-group ">
                            <label for="operator">操作人</label>
                                        <input type="text" class="form-control" id="operator" name="operator" value="${goods.operator}" placeholder="">
                        </div>
                        <div class="form-group ">
                            <label for="createTime">创建日期</label>
                            <input id="createTime" type="text" name="createTime" class="Wdate form-control" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})" value="<fmt:formatDate value="${ goods.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>" style="width: 170px;">
                        </div>
                        <div class="form-group ">
                            <label for="updateTime">更改日期</label>
                            <input id="updateTime" type="text" name="updateTime" class="Wdate form-control" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})" value="<fmt:formatDate value="${ goods.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>" style="width: 170px;">
                        </div>
                        <div class="form-group ">
                            <label for="top">是否推荐到首页</label>
                               <select class="form-control" id="top" name="top">
                                            <option value="1" <c:if test="${ goods.top == 1 }">selected</c:if> >是</option>
                                            <option value="0" <c:if test="${ goods.top == 0 }">selected</c:if> >否</option>
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
    <script charset="utf-8" src="assets/admin/js/kindeditor-4.1.10/kindeditor.js"></script>
    <script charset="utf-8" src="assets/admin/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script charset="utf-8" src="assets/admin/js/kindeditor-4.1.10/plugins/code/prettify.js"></script>
    <script type="text/javascript" src="assets/admin/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="assets/admin/app/goods/goodsFile.js"></script>
    <script>
        $(function(){
                    createKindEditor("goodDesc");
        })

    </script>

</body>
</html>
