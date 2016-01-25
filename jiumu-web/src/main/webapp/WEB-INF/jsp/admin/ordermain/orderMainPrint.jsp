<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>Document</title>
    <style type="text/css">
        *{margin: 0;padding: 0;}
        /*--- fixed position ---*/
        .tal{text-align:left;}
        .tar{text-align:right;}
        .tac{text-align:center;}
        .vat{vertical-align:top;}
        .bc{margin-left:auto;margin-right:auto;}
        .fl,.left{float:left;_display:inline;}
        .fr,.right{float:right;_display:inline;}
        .clb{font-size:0;clear:both;height:0;line-height:0;}
        .cl{clear:both;}
        .ovh{overflow:hidden;*zoom:1;}
        .vel{overflow: hidden;white-space: nowrap;-o-text-overflow: ellipsis;text-overflow: ellipsis;word-break: keep-all;}
        .posr{position:relative;}
        .posa{position:absolute;}
        .clearfix:before,.clearfix:after{ content: "."; display: block; height: 0; visibility: hidden; }
        .clearfix:after {clear: both;}
        .clearfix {*zoom: 1;} /* IE < 8 */
        /*--- side range ---*/
        .m10{margin:10px;}
        .m15{margin:15px;}
        .m20{margin:20px;}
        .m25{margin:25px;}
        .m30{margin:30px;}
        .mt5{margin-top:5px;}
        .mt10{margin-top:10px;}
        .mt15{margin-top:15px;}
        .mt20{margin-top:20px;}
        .mt25{margin-top:25px;}
        .mt30{margin-top:30px;}
        .ml5{margin-left:5px;}
        .ml10{margin-left:10px;}
        .ml15{margin-left:15px;}
        .ml20{margin-left:20px;}
        .ml25{margin-left:25px;}
        .ml30{margin-left:30px;}
        .mr5{margin-right:5px;}
        .mr10{margin-right:10px;}
        .mr15{margin-right:15px;}
        .mr20{margin-right:20px;}
        .mr25{margin-right:25px;}
        .mr30{margin-right:30px;}
        .mb5{margin-bottom:5px;}
        .mb10{margin-bottom:10px;}
        .mb15{margin-bottom:15px;}
        .mb20{margin-bottom:20px;}
        .mb25{margin-bottom:25px;}
        .mb30{margin-bottom:30px;}
        .p10{padding:10px;}
        .p15{padding:15px;}
        .p20{padding:20px;}
        .p25{padding:25px;}
        .p30{padding:30px;}
        .pt5{padding-top:5px;}
        .pt10{padding-top:10px;}
        .pt15{padding-top:15px;}
        .pt20{padding-top:20px;}
        .pt25{padding-top:25px;}
        .pt30{padding-top:30px;}
        .pl5{padding-left:5px;}
        .pl10{padding-left:10px;}
        .pl15{padding-left:15px;}
        .pl20{padding-left:20px;}
        .pl25{padding-left:25px;}
        .pl30{padding-left:30px;}
        .pr5{padding-right:5px;}
        .pr10{padding-right:10px;}
        .pr15{padding-right:15px;}
        .pr20{padding-right:20px;}
        .pr25{padding-right:25px;}
        .pr30{padding-right:30px;}
        .pb5{padding-bottom:5px;}
        .pb10{padding-bottom:10px;}
        .pb15{padding-bottom:15px;}
        .pb20{padding-bottom:20px;}
        .pb25{padding-bottom:25px;}
        .pb30{padding-bottom:30px;}
        /*--- font type setting ---*/
        .f13{font-size:13px;}
        .f14{font-size:14px;}
        .f16{font-size:16px;}
        .f18{font-size:18px;}
        .fwb{font-weight:bold;}
        .fwn{font-weight:normal;}
        .fsi{font-style: italic;}
        .tdu{text-decoration: underline;}
        /*--- hide or show ---*/
        .dn{display:none;}
        .db{display:block;}
        .dib{display: inline-block;*display: block;*zoom:1}
        /*--- width or height ---*/
        .w{width:100%}
        .h{height:100%;}
        .lh15{height:15px;line-height:15px;}
        .lh18{height:18px;line-height:18px;}
        .lh20{height:20px;line-height:20px;}
        .lh25{height:25px;line-height:25px;}
        .lh30{height:30px;line-height:30px;}
        body{font-size: 20px;color:#333333;font-family: verdana,arial,sans-serif;}
        table {
            border: 1px solid #666666;
            border-collapse:collapse;
            border-spacing:0;
            font-size: 18px;
            width: 100%;
        }
        table th {
            border: 1px solid #666666;
        }

        table td {
            border: 1px solid #666666;
            height: 25px;line-height: 25px;
        }

        .mr100{margin-right: 100px;}
        .pr100{padding-right: 100px;}
        .ovh{overflow: hidden;*zoom:1;}
        .posr{position: relative;}
        .g-wrap{padding: 30px;width: 550px;position: relative;}
        .g-wrap .p{position: absolute;width: 30px;right: -20px;top: 400px;}
        h1{font-size: 30px;text-align: center;}
        .fz16{font-size: 16px;}
    </style>
</head>
<body>
<div class="g-wrap">
    <div><img src="jiumu.png" width="190"/></div>
    <h1>合肥JOMOO九牧卫浴专卖店销售清单</h1>
    <div class="ovh mt25">
        <div class="fl">购货单位:${orderMain.buyerName}</div>
        <div class="fr mr100">NO.${orderMain.id}</div>
    </div>
    <div class="ovh mt20">
        <div class="fl">地址电话: ${orderMain.buyerAdress}${orderMain.buyerPhone}</div>
        <div class="fr"><span class="pl25">${year}年</span><span class="pl25">${month}月</span><span class="pl25">${day}日</span></div>
    </div>
    <table class="gridtable">
        <thead>
        <tr>
            <th>品名</th><th>单位</th><th>数量</th><th>单价</th><th>金额</th><th>备注</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderDetailList}" var="item">
            <tr>
                <td>${item.goodsName}</td>
                <td>${item.danwei}</td>
                <td>${item.buyCount}</td>
                <td>${item.price}</td>
                <td>${item.totalAmount}</td>
                <td>${item.mark}</td>
            </tr>
        </c:forEach>

        </tbody>
        <tfoot>
        <tr>
            <td class="rhide" colspan="6"><div class="ovh"><div class="fl">合计金额(大写):${realPayAmount}</div><div class="fr pr100">￥:${orderMain.realPay}</div></div></td>
        </tr>
        </tfoot>
    </table>
    <p class="mt20">开单人：</p>
    <p class="fz16 mt5">特别提示:请您仔细阅读本销售清单背面条款,在购买商品时予以确认。</p>
    <div class="ovh mt30"><p class="fr">客户签字确认:___________</p></div>
    <p class="fz16 mt5 ovh">一店：合肥市合肥市合肥市合肥市合肥市合肥市  <span class="fr">电话：0551-67113019</span></p>
    <p class="fz16 mt5 ovh">一店：合肥市合肥市合肥市合肥市合肥市合肥市  <span class="fr">电话：0551-67113019</span></p>
    <p class="fz16 mt5 ovh">一店：合肥市合肥市合肥市合肥市合肥市合肥市  <span class="fr">电话：0551-67113019</span></p>
    <p class="fz16 mt5 ovh">一店：合肥市合肥市合肥市合肥市合肥市合肥市  <span class="fr">电话：0551-67113019</span></p>
    <p class="fz16 mt5 ovh">一店：合肥市合肥市合肥市合肥市合肥市合肥市  <span class="fr">电话：0551-67113019</span></p>
    <p class="fz16 mt5">九牧网站：WWW.JOMMOO.COM.CN</p>
    <span class="p">一存根</span>
</div>
</body>
</html>