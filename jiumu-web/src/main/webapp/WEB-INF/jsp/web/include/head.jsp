<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="assets/web/css/common.css" type="text/css" />
<link rel="stylesheet" href="assets/web/css/dialog.css" type="text/css" />
<!-- 首页 -->
<link rel="stylesheet" href="assets/web/css/index.css" type="text/css" />

<script src="assets/web/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="assets/web/js/jquery.form.3.51.0.js" type="text/javascript"></script>
<script src="assets/web/js/lhgdialog.js" type="text/javascript"></script>
<script src="assets/web/js/jquery.blockUI.js" type="text/javascript"></script>
<!--  校验提示信息 -->
<script src="assets/web/js/jquery.validate.js" type="text/javascript"></script>
<!-- 将一个json对象转为字串 -->
<script src="assets/web/js/Utils.js" type="text/javascript"></script>
<!-- 购物车 -->
<script src="assets/web/js/shop.js" type="text/javascript"></script>

<!-- 下拉菜单jquer插件 -->
<script src="assets/web/js/DropDownMenu.js" type="text/javascript"></script>
<script src="assets/web/js/ui.datepicker.js" type="text/javascript"></script>
<!-- 日期插件 -->
<script src="assets/web/js/DatePicker.js" type="text/javascript"></script>
<script src="assets/web/js/LoginDialog.js" type="text/javascript"></script>
<script src="assets/web/js/jquery.bigautocomplete.js" type="text/javascript"></script>
<!-- 自定义滚动条 -->
<script src="assets/web/js/jquery.jscroll.js"></script>

<!-- 购物车 -->
<script src="assets/web/js/Cart.js"></script>
<script src="assets/web/js/CartBar.js"></script>

<script   src="assets/web/js/WdatePicker.js" ></script>
<script  >
    $(function(){
        $('#nav_menu>ul>li').dropDownMenu({child:'.child'});
    });
</script>
<script>
    var ctx = "${CTX}";
</script>