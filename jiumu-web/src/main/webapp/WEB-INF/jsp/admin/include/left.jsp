<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
        <div class="pull-left image">
            <img src="assets/admin/img/avatar3.png" class="img-circle" alt="User Image" />
        </div>
        <div class="pull-left info">
            <p id="userName"></p>
            <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
        </div>
    </div>
    <!-- 配置好a的id（按层定 ）即可 利用了cookie 自动记录当前点击的id  -->
    <ul class="sidebar-menu"  id="leftNavigate">
        <li class="treeview">
            <a href="#">
                <i class="fa fa-dashboard"></i> <span>订单管理</span> <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a id="1-1" href="admin/ordermain/list"><i class="fa fa-circle-o"></i> 订单管理</a></li>
                <li><a id="1-2" href="admin/orderdetail/list"><i class="fa fa-circle-o"></i> 订单详情</a></li>
            </ul>
        </li>

        <li class="treeview">
            <a href="#">
                <i class="fa fa-laptop"></i>
                <span>商品管理</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a id="3-1" href="admin/goods/list"><i class="fa fa-circle-o"></i> 商品管理</a></li>
                <li><a id="3-2" href="admin/category/list"><i class="fa fa-circle-o"></i> 商品分类</a></li>
            </ul>
        </li>


        <li class="treeview">
            <a href="#">
                <i class="fa fa-laptop"></i>
                <span>后台用户管理</span>
                <i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
                <li><a id="2-1" href="admin/aAdminUser/list"><i class="fa fa-circle-o"></i> 用户列表</a></li>
            </ul>
        </li>

    </ul>
</section>
<%--<script src="assets/admin/js/cookie.js" type="text/javascript"></script>--%>
<script src="assets/admin/app/left.js" type="text/javascript"></script>
