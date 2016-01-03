<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>商城首页-Javashop做最好的Java B2B2C多用户商城系统</title>
    <meta name="keywords" content="最好的Java网店系统,Java多用户商城,Java B2B2C系统,Java 多店铺系统,O2O系统,Java商城定制开发">
    <meta name="description" content="Javashop提供优质的电子商务解决方案，提供最好的Java网店系统、Java多用户商城,Java B2B2C系统,Java 多店铺系统、Java商城定制开发。">
    <meta http-equiv="X-UA-Compatible" content="IE=9" > </meta>
    <script>
        var ctx="/version4";
    </script>

    <link rel="stylesheet" href="http://192.168.1.104:8080/assets/web/css/common.css" type="text/css" />
    <link rel="stylesheet" href="http://192.168.1.104:8080/assets/web/css/dialog.css" type="text/css" />
    <!-- 首页 -->
    <link rel="stylesheet" href="http://192.168.1.104:8080/assets/web/css/index.css" type="text/css" />

    <script src="http://192.168.1.104:8080/assets/web/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="http://192.168.1.104:8080/assets/web/js/jquery.form.3.51.0.js" type="text/javascript"></script>
    <script src="http://192.168.1.104:8080/assets/web/js/lhgdialog.js" type="text/javascript"></script>
    <script src="http://192.168.1.104:8080/assets/web/js/jquery.blockUI.js" type="text/javascript"></script>
    <!--  校验提示信息 -->
    <script src="http://192.168.1.104:8080/assets/web/js/jquery.validate.js" type="text/javascript"></script>
    <!-- 将一个json对象转为字串 -->
    <script src="http://192.168.1.104:8080/assets/web/js/Utils.js" type="text/javascript"></script>
    <!-- 购物车 -->
    <script src="http://192.168.1.104:8080/assets/web/js/shop.js" type="text/javascript"></script>

    <!-- 下拉菜单jquer插件 -->
    <script src="http://192.168.1.104:8080/assets/web/js/DropDownMenu.js" type="text/javascript"></script>
    <script src="http://192.168.1.104:8080/assets/web/js/ui.datepicker.js" type="text/javascript"></script>
    <!-- 日期插件 -->
    <%--<script src="http://192.168.1.104:8080/assets/web/js/DatePicker.js" type="text/javascript"></script>--%>
    <script src="http://192.168.1.104:8080/assets/web/js/LoginDialog.js" type="text/javascript"></script>
    <script src="http://192.168.1.104:8080/assets/web/js/jquery.bigautocomplete.js" type="text/javascript"></script>
    <!-- 自定义滚动条 -->
    <script src="http://192.168.1.104:8080/assets/web/js/jquery.jscroll.js"></script>

    <!-- 购物车 -->
    <script src="http://192.168.1.104:8080/assets/web/js/Cart.js"></script>
    <script src="http://192.168.1.104:8080/assets/web/js/CartBar.js"></script>

    <script   src="http://192.168.1.104:8080/assets/web/WdatePicker.js" ></script>
    <script  >
        $(function(){
            $('#nav_menu>ul>li').dropDownMenu({child:'.child'});
        });
    </script>

</head>
<body>
<!--最上导航-->
<div class="top">
    <div class="welcome">
        <span class="title"><a href="/version4/index.html">您好，欢迎来到本站！</a></span>
        <div class="login_bar login">
        </div>
        <div class="navigation">
            <ul>
                <li class="first">
                    <ul>
                        <li id="cart_bar_wrapper">
                            <a href="/version4/cart.html" class="index-go-cart">购物车(<span class="num">0</span>)件<i class="common-cart-down"></i></a>
                            <div class="cart_content02" style="display:none">
                                <div class="cart_list"><img src="http://192.168.1.104:8080/assets/web/images/ajax-loader.gif" class="loading" /></div>
                            </div>
                        </li>
                        <!--购物车下拉菜单结束-->
                    </ul>
                </li>
                <li><a href="/version4/help.html">帮助中心</a></li>
                <li style="background:none;"><a href="#">&nbsp;&nbsp;&nbsp;</a></li>
                <li style="background:none;"><a href="#">&nbsp;&nbsp;&nbsp;</a></li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">


    //加载头部会员信息
    $(".login_bar").load("/version4/common/member_bar.html",function(){
        $("#logout").click(function(){
            $.ajax({
                url:"/version4/api/shop/member!logout.do?ajax=yes",
                dataType:"json",
                cache: false,             //清楚缓存，暂时测试，如果产生冲突，请优先考虑是否是这条语句。
                success:function(result){
                    if(result.result==1){
                        $.alert(result.message);
                        location.href="/version4/index.html";

                    }else{
                        $.alert(result.message);
                    }
                    $.Loading.hide();
                },
                error:function(){
                    $.Loading.hide();
                    $.alert("出错了:(");
                }
            });
            return false;
        })
    });

    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseenter(function(){
        $("#cart_bar_wrapper .cart_content02").slideDown(300);
        $(".common-cart-down").addClass("common-cart-up");
        $(this).addClass("cart-hover");
        //加载购物项
        $("#cart_bar_wrapper .cart_content02").remove(".cart_list");
//	$(".checkout").load("cart/common_totle.html");

    })
    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseleave(function(){
        $("#cart_bar_wrapper .cart_content02").stop(true,true).hide();
        $(".common-cart-down").removeClass("common-cart-up");
        $(this).removeClass("cart-hover");
    })


</script>


<!--header-->
<div class="header">
    <div class="logo_area">
        <div class="logo">
            <a href="/version4/index.html">
                <img src="http://www.javashop.cn/version4/statics/attachment//201512112001371904.jpg" title="logo" />			</a>
        </div>
        <div class="search_area">
            <div class="search">
                <input type="text" class="hunt" id="keyword" placeholder="请输入产品关键字等..." />
                <input type="button" name="s_seek" class="s_seek" value="搜 索" id="searchBtn">
            </div>
            <div class="hot_keyword">
                <h1>热门搜索：</h1>
                <ul>
                    <!-- 获取CMS数据搜索标签， -->
                    <!-- 调用CMS数据搜索标签，并传递所在模型ID参数(es_hot_keyword表.)“3”表示出现三个关键词。 -->
                </ul>
            </div>
        </div>
        <div class="service_tel">
            <img src="http://192.168.1.104:8080/assets/web/images/cn.png" alt="承诺图片" />		</div>
    </div>
</div>
<div class="common_menu">
    <div class="menu">
        <div class="menu_left">
            <!-- 导航  start -->
            <div class="good_list is_goods_list" >
                <span class="title">所有商品分类</span>
            </div>
            <div class="all-sort-list" id="common_goodscat">
                <div class="item_box " rel="1">
                    <div class="item">
                        <div class="common_item_title">
                            <!-- <i class="m_icon"><img src="http://www.javashop.cn/version4/statics/images/no_picture.jpg" /></i>-->
                            <a href="goods_list.html?cat=4" class="c_item_title">进口食品、进口牛奶</a>
                        </div>
                        <div class="common_item_list">
                            <a href="goods_list.html?cat=5">进2</a>
                            <a href="goods_list.html?cat=24">进口饼干糕点</a>
                            <a href="goods_list.html?cat=27">进口咖啡/茶品</a>
                        </div>
                        <!-- 子菜单 -->


                        <div class="item_list clearfix" style="display:none" >
                            <div class="subitem">
                                <dl>
                                    <dt><a href="search-cat-5.html">进2<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-22.html" style="">进品1</a>
                                        <a href="search-cat-23.html" style="">进品酸奶</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-24.html">进口饼干糕点<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-25.html" style="">进口饼干</a>
                                        <a href="search-cat-26.html" style="">进口糕点</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-27.html">进口咖啡/茶品<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-28.html" style="">进口红茶</a>
                                        <a href="search-cat-29.html" style="">进口绿茶</a>
                                        <a href="search-cat-30.html" style="">进口速溶咖啡</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-31.html">进口休闲零食<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-32.html" style="">进口膨化</a>
                                        <a href="search-cat-33.html" style="">进口海产品</a>
                                        <a href="search-cat-34.html" style="">进口果冻/布丁</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="index-show-children"></div>
                </div>
                <div class="item_box " rel="2">
                    <div class="item">
                        <div class="common_item_title">
                            <!-- <i class="m_icon"><img src="http://www.javashop.cn/version4/statics/images/no_picture.jpg" /></i>-->
                            <a href="goods_list.html?cat=38" class="c_item_title">美容化妆、个人护理</a>
                        </div>
                        <div class="common_item_list">
                            <a href="goods_list.html?cat=39">面部护肤</a>
                            <a href="goods_list.html?cat=43">眼部保养</a>
                            <a href="goods_list.html?cat=47">男士护理</a>
                        </div>
                        <!-- 子菜单 -->


                        <div class="item_list clearfix" style="display:none" >
                            <div class="subitem">
                                <dl>
                                    <dt><a href="search-cat-39.html">面部护肤<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-40.html" style="">洁面</a>
                                        <a href="search-cat-41.html" style="">柔肤水/爽肤水</a>
                                        <a href="search-cat-42.html" style="">乳液</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-43.html">眼部保养<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-44.html" style="">眼部精华</a>
                                        <a href="search-cat-45.html" style="">眼霜</a>
                                        <a href="search-cat-46.html" style="">眼膜</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-47.html">男士护理<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-48.html" style="">男士洁面</a>
                                        <a href="search-cat-49.html" style="">男士护肤</a>
                                        <a href="search-cat-50.html" style="">须后水</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-51.html">洗发护发<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-52.html" style="">去屑型洗发水</a>
                                        <a href="search-cat-53.html" style="">柔顺型洗发水</a>
                                        <a href="search-cat-54.html" style="">修复型洗发水</a>
                                        <a href="search-cat-55.html" style="">滋润营养洗发水</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="index-show-children"></div>
                </div>
                <div class="item_box " rel="3">
                    <div class="item">
                        <div class="common_item_title">
                            <!-- <i class="m_icon"><img src="http://www.javashop.cn/version4/statics/images/no_picture.jpg" /></i>-->
                            <a href="goods_list.html?cat=56" class="c_item_title">母婴、玩具音像图书</a>
                        </div>
                        <div class="common_item_list">
                            <a href="goods_list.html?cat=57">奶粉系列</a>
                            <a href="goods_list.html?cat=62">防尿用品</a>
                            <a href="goods_list.html?cat=66">辅食</a>
                        </div>
                        <!-- 子菜单 -->


                        <div class="item_list clearfix" style="display:none" >
                            <div class="subitem">
                                <dl>
                                    <dt><a href="search-cat-57.html">奶粉系列<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-58.html" style="">1段奶粉</a>
                                        <a href="search-cat-59.html" style="">2段奶粉</a>
                                        <a href="search-cat-60.html" style="">3段奶粉</a>
                                        <a href="search-cat-61.html" style="">特殊配方奶粉</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-62.html">防尿用品<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-63.html" style="">纸尿裤</a>
                                        <a href="search-cat-64.html" style="">婴儿湿巾</a>
                                        <a href="search-cat-65.html" style="">尿布/尿垫</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-66.html">辅食<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-67.html" style="">米粉</a>
                                        <a href="search-cat-68.html" style="">婴儿果汁</a>
                                        <a href="search-cat-69.html" style="">面条</a>
                                        <a href="search-cat-70.html" style="">饼干/磨牙棒</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-71.html">清洁用品<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-72.html" style="">澡盆/浴床</a>
                                        <a href="search-cat-73.html" style="">奶瓶/餐具清洁</a>
                                        <a href="search-cat-74.html" style="">幼儿口腔护理</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-75.html">纺织/用品<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-76.html" style="">床单/枕头</a>
                                        <a href="search-cat-77.html" style="">浴巾/毛巾</a>
                                        <a href="search-cat-78.html" style="">抱被</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="index-show-children"></div>
                </div>
                <div class="item_box " rel="4">
                    <div class="item">
                        <div class="common_item_title">
                            <!-- <i class="m_icon"><img src="http://www.javashop.cn/version4/statics/images/no_picture.jpg" /></i>-->
                            <a href="goods_list.html?cat=79" class="c_item_title">厨房用品、清洁用品</a>
                        </div>
                        <div class="common_item_list">
                            <a href="goods_list.html?cat=80">锅具水壶</a>
                        </div>
                        <!-- 子菜单 -->


                        <div class="item_list clearfix" style="display:none" >
                            <div class="subitem">
                                <dl>
                                    <dt><a href="search-cat-80.html">锅具水壶<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-81.html" style="">汤锅</a>
                                        <a href="search-cat-82.html" style="">水壶</a>
                                        <a href="search-cat-83.html" style="">炒锅</a>
                                        <a href="search-cat-84.html" style="">奶锅</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="index-show-children"></div>
                </div>
                <div class="item_box " rel="5">
                    <div class="item">
                        <div class="common_item_title">
                            <!-- <i class="m_icon"><img src="http://www.javashop.cn/version4/statics/images/no_picture.jpg" /></i>-->
                            <a href="goods_list.html?cat=87" class="c_item_title">家居运动、汽车维护</a>
                        </div>
                        <div class="common_item_list">
                        </div>
                        <!-- 子菜单 -->


                    </div>
                    <div class="index-show-children"></div>
                </div>
                <div class="item_box " rel="6">
                    <div class="item">
                        <div class="common_item_title">
                            <!-- <i class="m_icon"><img src="http://www.javashop.cn/version4/statics/images/no_picture.jpg" /></i>-->
                            <a href="goods_list.html?cat=1" class="c_item_title">食品、饮料、酒水</a>
                        </div>
                        <div class="common_item_list">
                            <a href="goods_list.html?cat=2">休闲零食 </a>
                            <a href="goods_list.html?cat=3">糖果/巧克力</a>
                            <a href="goods_list.html?cat=13">饮料</a>
                        </div>
                        <!-- 子菜单 -->


                        <div class="item_list clearfix" style="display:none" >
                            <div class="subitem">
                                <dl>
                                    <dt><a href="search-cat-2.html">休闲零食 <i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-6.html" style="">坚果</a>
                                        <a href="search-cat-7.html" style="">蜜饯</a>
                                        <a href="search-cat-8.html" style="">肉干</a>
                                        <a href="search-cat-9.html" style="">薯片</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-3.html">糖果/巧克力<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-10.html" style="">巧克力</a>
                                        <a href="search-cat-11.html" style="">糖果</a>
                                        <a href="search-cat-12.html" style="">口香糖</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-13.html">饮料<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-14.html" style="">碳酸饮料</a>
                                        <a href="search-cat-15.html" style="">茶饮料</a>
                                        <a href="search-cat-16.html" style="">果汁</a>
                                        <a href="search-cat-17.html" style="">水</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-18.html">酒水<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-19.html" style="">白酒</a>
                                        <a href="search-cat-20.html" style="">啤酒</a>
                                        <a href="search-cat-21.html" style="">洋酒</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="index-show-children"></div>
                </div>
                <div class="item_box last" rel="7">
                    <div class="item">
                        <div class="common_item_title">
                            <!-- <i class="m_icon"><img src="http://www.javashop.cn/version4/statics/images/no_picture.jpg" /></i>-->
                            <a href="goods_list.html?cat=35" class="c_item_title">珠宝钟表、饰品箱包</a>
                        </div>
                        <div class="common_item_list">
                            <a href="goods_list.html?cat=36">女包</a>
                            <a href="goods_list.html?cat=100">精品男包</a>
                            <a href="goods_list.html?cat=104">黄金珠宝</a>
                        </div>
                        <!-- 子菜单 -->


                        <div class="item_list clearfix" style="display:none" >
                            <div class="subitem">
                                <dl>
                                    <dt><a href="search-cat-36.html">女包<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-37.html" style="">单肩包</a>
                                        <a href="search-cat-95.html" style="">手提包</a>
                                        <a href="search-cat-96.html" style="">斜挎包</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-100.html">精品男包<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-101.html" style="">斜挎包</a>
                                        <a href="search-cat-102.html" style="">手提包</a>
                                        <a href="search-cat-103.html" style="">商场同款</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-104.html">黄金珠宝<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-105.html" style="">黄金吊坠</a>
                                        <a href="search-cat-106.html" style="">黄金手链</a>
                                        <a href="search-cat-107.html" style="">黄金戒指</a>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><a href="search-cat-94.html">旅行箱<i>></i></a></dt>
                                    <dd>
                                        <a href="search-cat-97.html" style="">万向轮箱</a>
                                        <a href="search-cat-98.html" style="">硬质旅行箱</a>
                                        <a href="search-cat-99.html" style="">拉杆旅行箱</a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="index-show-children"></div>
                </div>
            </div>
            <!-- 导航  end -->
        </div>
        <div class="menu_right">
            <ul>
                <li><a href="/version4/index.html">首 页</a></li>
                <li><a href="/version4/goods_list.html?cat=1">零食天地</a></li>
                <li><a href="/version4/goods_list.html?cat=4">进口食品</a></li>
                <li><a href="/version4/goods_list.html?cat=38">个人护理</a></li>
                <li><a href="/version4/goods_list.html?cat=35">箱包钟表</a></li>
            </ul>
        </div>
    </div>
</div>
<!--header end-->

<script>
    $(function(){
        $("#logout").click(function(){
            $.ajax({
                url:"api/shop/member!logout.do?ajax=yes",
                dataType:"json",
                cache: false,             //清楚缓存，暂时测试，如果产生冲突，请优先考虑是否是这条语句。
                success:function(result){
                    if(result.result==1){
                        $.alert(result.message);
                        location.href="/version4/index.html";

                    }else{
                        $.alert(result.message);
                    }
                    $.Loading.hide();
                },
                error:function(){
                    $.Loading.hide();
                    $.alert("出错了:(");
                }
            });
            return false;
        })

        $("#keyword").keypress(function(event){
            //	$("#keyword").attr("class","seek");
            if(event.keyCode=="13" ){
                search();
            }
        });
        $("#keyword").click(function(){
            if($(this).val() == searchTipText){
                $(this).val("");
            }
        });
        $("#keyword").blur(function(){
            if($(this).val() == ''){
                $(this).val(searchTipText);
            }
        });

        $("#searchBtn").click(function(){
            search();
        });
    })

    $('.all-sort-list > .item').hover(function(){
        var eq = $('.all-sort-list > .item').index(this),				//获取当前滑过是第几个元素
                h = $('.all-sort-list').offset().top,						//获取当前下拉菜单距离窗口多少像素
                s = $(window).scrollTop(),									//获取游览器滚动了多少高度
                i = $(this).offset().top,									//当前元素滑过距离窗口多少像素
                item = $(this).children('.item-list').height(),				//下拉菜单子类内容容器的高度
                sort = $('.all-sort-list').height();						//父类分类列表容器的高度

        $(this).children('.item-list').css('top', 0 );

        $(this).addClass('hover');
        $(this).children('.item-list').css('display','block');
    },function(){
        $(this).removeClass('hover');
        $(this).children('.item-list').css('display','none');
    });

    $('.item > .item-list > .close').click(function(){
        $(this).parent().parent().removeClass('hover');
        $(this).parent().hide();
    });


    var searchTipText = "请输入产品关键字，如品牌、型号等";
    function search(){
        var keyword = $.trim( $("#keyword").val());
        if(keyword == searchTipText){
            keyword = '';
        }
        if(keyword.indexOf('\\')!=-1){
            alert("请输入正确的关键词");
            return false;
        }
        if(keyword==''){
            alert("请输入关键字");
        }else{
            keyword = keyword.replace(/\//g,"-xie-")
            location.href="/version4/goods_list.html?keyword="+keyword;
        }
    }


    function addfavorite(title,url){

        if (document.all){
            window.external.addFavorite(url,title);
        }else if (window.sidebar){
            window.sidebar.addPanel(title, url, "");
        }

    }

</script>
<script>
    $(function(){
        $(".all-sort-list .item_box").mouseover(function(){
            $(this).find(".item").addClass("children-show");
            $(this).find(".index-show-children").css("left","195px");
            $(this).find(".item_list").show();
            $(this).css("background","#fff");
        })
        $(".all-sort-list .item_box").mouseleave(function(){
            $(this).find(".item").removeClass("children-show");
            $(this).find(".index-show-children").css("left","190px");
            $(this).find(".item_list").hide();
            $(this).css("background","none");
        })

        $(".menu_left").mouseover(function(){
            $(".all-sort-list").addClass("is_show");

        });
        $(".menu_left").mouseleave(function(){
            $(".all-sort-list").removeClass("is_show");

        })





        var url_ = "/version4/api/shop/goods-words.do";
        $("#keyword").bigAutocomplete({url:url_, callback:function(data){
            location.href="/version4/goods_list.html?keyword="+data.title;
        }});
    })
</script>

<script src="http://192.168.1.104:8080/assets/web/js/slider.js" type="text/javascript"></script>
<!-- 获取商品列表标签 -->
<!-- 调用广告标签 -->
<!-- 调用广告信息,传递参数acid:1 -->
<!-- 获取广告列表 -->
<div class="max-adv">
    <div id="index-adv" class="flexslider">
        <ul class="slides">
            <li style="background:transparent url(http://www.javashop.cn/version4/statics/attachment/adv/201512211629309212.jpg) no-repeat scroll center top / cover "/>
            </li>
            <li style="background:transparent url(http://www.javashop.cn/version4/statics/attachment/adv/201512232158274233.jpg) no-repeat scroll center top / cover "/>
            </li>
        </ul>

    </div>
</div>
<script type="text/javascript">
    //计算广告高度
    function advheight (){
        var advBoxHeight = $(window).height()*0.565;
        $(".slides").css("height",advBoxHeight+"px");
    }
    $(function(){
        $('#index-adv').flexslider({
            animation: "slide",
            direction:"horizontal",
            easing:"swing"
        });

        $(".flexslider").mouseover(function(){
            $(".max-adv .flexslider .flex-direction-nav li a").show(500);
        })

        $(".flexslider").mouseleave(function(){
            $(".max-adv .flexslider .flex-direction-nav li a").hide();
        })
//	advheight();
    });
</script>
<div class="index-main">
    <script>
        $(function(){
            $('#groupbuy').flexslider({
                animation: "slide",
                direction:"horizontal",
                easing:"swing"
            });
        })
    </script>
    <!--  相同楼层 -->
    <div class="index-same-fool">
        <div class="index-same-tile index-food">
            <h1 >食品饮料<span>FOOD AND BEVERAGE</span></h1>
            <ul>
                <!-- 获取CMS数据搜索标签， -->
                <!-- 调用CMS数据搜索标签，并传递所在模型ID参数(es_hot_keyword表.)“3”表示出现三个关键词。 -->
            </ul>
        </div>
        <div class="same-box">
            <div class="same-box-left">
                <!-- 品牌 -->
                <!-- 调用商品分类信息 -->
                <div class="index-beand-list">
                    <ul>

                        <li>
                            <a href="goods_list.html?brand=1">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211150124684.jpg" alt="旺旺" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=2">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211143461491.jpg" alt="新农哥" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=7">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211200113292.jpg" alt="天喔" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=4">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211152387107.gif" alt="百味林" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=96">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240103545878.jpg" alt="百变猪排" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=17">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221658088525.jpg" alt="大白兔" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=16">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221654250514.jpg" alt="阿尔卑斯" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=10">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221035341549.gif" alt="瑞士莲" border="0" />							</a>
                        </li>
                    </ul>
                </div>
                <!-- 创建商品分类标签 -->
                <!-- 调用商品分类信息 -->
                <div class="same-cat">
                    <a href="/version4/goods_list.html?cat=6" title="坚果">坚果</a>
                    <a href="/version4/goods_list.html?cat=7" title="蜜饯">蜜饯</a>
                    <a href="/version4/goods_list.html?cat=8" title="肉干">肉干</a>
                    <!--  <a href="search-cat-2.html" class="menu">休闲零食 </a><br/>-->
                    <a href="/version4/goods_list.html?cat=10" title="巧克力">巧克力</a>
                    <a href="/version4/goods_list.html?cat=11" title="糖果">糖果</a>
                    <a href="/version4/goods_list.html?cat=12" title="口香糖">口香糖</a>
                    <!--  <a href="search-cat-3.html" class="menu">糖果/巧克力</a><br/>-->
                    <a href="/version4/goods_list.html?cat=14" title="碳酸饮料">碳酸饮料</a>
                    <a href="/version4/goods_list.html?cat=15" title="茶饮料">茶饮料</a>
                    <a href="/version4/goods_list.html?cat=16" title="果汁">果汁</a>
                    <!--  <a href="search-cat-13.html" class="menu">饮料</a><br/>-->
                    <a href="/version4/goods_list.html?cat=19" title="白酒">白酒</a>
                    <a href="/version4/goods_list.html?cat=20" title="啤酒">啤酒</a>
                    <a href="/version4/goods_list.html?cat=21" title="洋酒">洋酒</a>
                    <!--  <a href="search-cat-18.html" class="menu">酒水</a><br/>-->
                </div>
            </div>
            <div class="same-box-middel">
                <!-- 调用广告信息,传递参数acid:1 -->
                <a target="_blank" title="1楼美食、饮料广告" href="/version4/core/adv!click.do?advid=22"">
                <img src="http://static.v5.javamall.com.cn/attachment/adv/201512091708414759.jpg" alt="1楼美食、饮料广告" border="0" />			                </a>
            </div>
            <div class="same-box-right">
                <ul>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-267.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240149492509_thumbnail.jpg" alt="哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-267.html">哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食</a>
                        </div>
                        <div class="goods-price">
                            <span>￥19.80</span>
                            <!--
                            <del class="original">市场价：￥27.00</del>
                            -->
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-266.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240144049007_thumbnail.jpg" alt="牛叉叉蜜汁猪肉脯烟熏炭烤猪肉干正宗靖江猪肉铺浦特产零食200g" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-266.html">牛叉叉蜜汁猪肉脯烟熏炭烤猪肉干正宗靖江猪肉铺浦特产零食200g</a>
                        </div>
                        <div class="goods-price">
                            <span>￥6.00</span>
                            <!--
                            <del class="original">市场价：￥12.00</del>
                            -->
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-265.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240139201504_thumbnail.jpg" alt="【三只松鼠_碧根果210gx2袋】零食坚果山核桃长寿果干果奶油味 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-265.html">【三只松鼠_碧根果210gx2袋】零食坚果山核桃长寿果干果奶油味 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥22.00</span>
                            <!--
                            <del class="original">市场价：￥32.00</del>
                            -->
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-264.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240133438025_thumbnail.jpg" alt="歌斐颂 纯可可脂纯黑巧克力320g 58%可可进口料休闲零食品黑巧" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-264.html">歌斐颂 纯可可脂纯黑巧克力320g 58%可可进口料休闲零食品黑巧</a>
                        </div>
                        <div class="goods-price">
                            <span>￥46.00</span>
                            <!--
                            <del class="original">市场价：￥70.00</del>
                            -->
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-263.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240123138244_thumbnail.jpg" alt="绿岭新鲜有机生薄皮非新疆纸皮大核桃500G新货特产 原味坚果零食" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-263.html">绿岭新鲜有机生薄皮非新疆纸皮大核桃500G新货特产 原味坚果零食</a>
                        </div>
                        <div class="goods-price">
                            <span>￥0.00</span>
                            <!--
                            <del class="original">市场价：￥40.00</del>
                            -->
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-262.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240115430875_thumbnail.jpg" alt="【沃隆_每日坚果25g*30袋】精美礼盒原味混合干果综合坚果仁箱装" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-262.html">【沃隆_每日坚果25g*30袋】精美礼盒原味混合干果综合坚果仁箱装</a>
                        </div>
                        <div class="goods-price">
                            <span>￥199.00</span>
                            <!--
                            <del class="original">市场价：￥300.00</del>
                            -->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--  相同楼层 -->
    <div class="index-same-fool">
        <div class="index-same-tile index-cosmetology">
            <h1>美容化妆、个人护理<span>Beauty&Makeup  </span></h1>
            <ul>
                <!-- 获取CMS数据搜索标签， -->
                <!-- 调用CMS数据搜索标签，并传递所在模型ID参数(es_hot_keyword表.)“3”表示出现三个关键词。 -->
            </ul>
        </div>
        <div class="same-box">
            <div class="same-box-left">
                <!-- 品牌 -->
                <!-- 调用商品分类信息 -->
                <div class="index-beand-list">
                    <ul>

                        <li>
                            <a href="goods_list.html?brand=52">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202222258101961.jpg" alt="Shiseido/资生堂" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=56">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202231016206426.jpg" alt="Inoherb/相宜本草" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=57">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202231018171140.png" alt="Mentholatum/曼秀雷敦" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=58">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202231020005541.gif" alt="Herborist/佰草集" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=97">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240206216011.jpg" alt="雅诗兰黛" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=98">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240207039976.jpg" alt="海蓝之谜" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=99">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240207301397.jpg" alt="美肤宝" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=100">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240208099557.jpg" alt="法国娇韵诗" border="0" />							</a>
                        </li>
                    </ul>
                </div>
                <!-- 创建商品分类标签 -->
                <!-- 调用商品分类信息 -->
                <div class="same-cat">

                    <a href="/version4/goods_list.html?cat=40" title="洁面">洁面</a>
                    <a href="/version4/goods_list.html?cat=41" title="柔肤水/爽肤水">柔肤水/爽肤水</a>
                    <a href="/version4/goods_list.html?cat=42" title="乳液">乳液</a>
                    <!--  <a href="search-cat-39.html" class="menu">面部护肤</a><br/>-->
                    <a href="/version4/goods_list.html?cat=44" title="眼部精华">眼部精华</a>
                    <a href="/version4/goods_list.html?cat=45" title="眼霜">眼霜</a>
                    <a href="/version4/goods_list.html?cat=46" title="眼膜">眼膜</a>
                    <!--  <a href="search-cat-43.html" class="menu">眼部保养</a><br/>-->
                    <a href="/version4/goods_list.html?cat=48" title="男士洁面">男士洁面</a>
                    <a href="/version4/goods_list.html?cat=49" title="男士护肤">男士护肤</a>
                    <a href="/version4/goods_list.html?cat=50" title="须后水">须后水</a>
                    <!--  <a href="search-cat-47.html" class="menu">男士护理</a><br/>-->
                    <a href="/version4/goods_list.html?cat=52" title="去屑型洗发水">去屑型洗发水</a>
                    <a href="/version4/goods_list.html?cat=53" title="柔顺型洗发水">柔顺型洗发水</a>
                    <a href="/version4/goods_list.html?cat=54" title="修复型洗发水">修复型洗发水</a>
                    <!--  <a href="search-cat-51.html" class="menu">洗发护发</a><br/>-->

                </div>
            </div>
            <div class="same-box-middel">
                <!-- 调用广告信息,传递参数acid:1 -->
                <a target="_blank" title="2楼美容美妆" href="/version4/core/adv!click.do?advid=23"">
                <img src="http://static.v5.javamall.com.cn/attachment/adv/201511240215017846.jpg" alt="2楼美容美妆" border="0" />			                </a>
            </div>
            <div class="same-box-right">
                <ul>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-273.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240247415379_thumbnail.jpg" alt="SUHU尚惠烟紫漾彩唇乳 持久保湿滋润唇彩唇蜜 不易掉色口红正品" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-273.html">SUHU尚惠烟紫漾彩唇乳 持久保湿滋润唇彩唇蜜 不易掉色口红正品</a>
                        </div>
                        <div class="goods-price">
                            <span>￥32.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-272.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240239284862_thumbnail.jpg" alt="百雀羚爽肤水女水嫩倍现精华水化妆水补水保湿控油滋润化妆品正品 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-272.html">百雀羚爽肤水女水嫩倍现精华水化妆水补水保湿控油滋润化妆品正品 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥45.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-271.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240235039360_thumbnail.jpg" alt="olay玉兰油多效修护霜面霜50g*2瓶 保湿补水紧致护肤品化妆品套装" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-271.html">olay玉兰油多效修护霜面霜50g*2瓶 保湿补水紧致护肤品化妆品套装</a>
                        </div>
                        <div class="goods-price">
                            <span>￥129.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-270.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240231557320_thumbnail.jpg" alt="innisfree/悦诗风吟旗舰店 真萃鲜润面膜贴套装18片 补水保湿亮白" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-270.html">innisfree/悦诗风吟旗舰店 真萃鲜润面膜贴套装18片 补水保湿亮白</a>
                        </div>
                        <div class="goods-price">
                            <span>￥120.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-269.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240227066343_thumbnail.jpg" alt="Ck/凯文克莱 CK One summer2015夏日新款中性男女士香水100ML " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-269.html">Ck/凯文克莱 CK One summer2015夏日新款中性男女士香水100ML </a>
                        </div>
                        <div class="goods-price">
                            <span>￥350.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-268.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240220111688_thumbnail.jpg" alt="Dior/迪奥香水明星Q版5件套装 真我花漾粉魅永恒的爱迪奥之韵礼盒 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-268.html">Dior/迪奥香水明星Q版5件套装 真我花漾粉魅永恒的爱迪奥之韵礼盒 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥367.00</span>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <!--  相同楼层 -->
    <div class="index-same-fool">
        <div class="index-same-tile index-jewellery">
            <h1>珠宝、箱包<span>Jewelry&Bags </span></h1>
            <ul>
                <!-- 获取CMS数据搜索标签， -->
                <!-- 调用CMS数据搜索标签，并传递所在模型ID参数(es_hot_keyword表.)“3”表示出现三个关键词。 -->
            </ul>
        </div>
        <div class="same-box">
            <div class="same-box-left">
                <!-- 品牌 -->
                <!-- 调用商品分类信息 -->
                <div class="index-beand-list">
                    <ul>

                        <li>
                            <a href="goods_list.html?brand=101">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240831260274.jpg" alt="慕斯小姐" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=102">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240831524474.jpg" alt="迪菲莱" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=103">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240832127070.jpg" alt="稻草人" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=104">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240832334608.jpg" alt="狼族u" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=105">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240834251919.jpg" alt="木村耀司" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=106">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240834453943.jpg" alt="金狐狸" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=107">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240835127393.jpg" alt="美娜途" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=108">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240836015061.jpg" alt="萨蒙斯" border="0" />							</a>
                        </li>
                    </ul>
                </div>
                <!-- 创建商品分类标签 -->
                <!-- 调用商品分类信息 -->
                <div class="same-cat">

                    <a href="/version4/goods_list.html?cat=37" title="单肩包">单肩包</a>
                    <a href="/version4/goods_list.html?cat=95" title="手提包">手提包</a>
                    <a href="/version4/goods_list.html?cat=96" title="斜挎包">斜挎包</a>
                    <!--  <a href="search-cat-36.html" class="menu">女包</a><br/>-->
                    <a href="/version4/goods_list.html?cat=101" title="斜挎包">斜挎包</a>
                    <a href="/version4/goods_list.html?cat=102" title="手提包">手提包</a>
                    <a href="/version4/goods_list.html?cat=103" title="商场同款">商场同款</a>
                    <!--  <a href="search-cat-100.html" class="menu">精品男包</a><br/>-->
                    <a href="/version4/goods_list.html?cat=105" title="黄金吊坠">黄金吊坠</a>
                    <a href="/version4/goods_list.html?cat=106" title="黄金手链">黄金手链</a>
                    <a href="/version4/goods_list.html?cat=107" title="黄金戒指">黄金戒指</a>
                    <!--  <a href="search-cat-104.html" class="menu">黄金珠宝</a><br/>-->
                    <a href="/version4/goods_list.html?cat=97" title="万向轮箱">万向轮箱</a>
                    <a href="/version4/goods_list.html?cat=98" title="硬质旅行箱">硬质旅行箱</a>
                    <a href="/version4/goods_list.html?cat=99" title="拉杆旅行箱">拉杆旅行箱</a>
                    <!--  <a href="search-cat-94.html" class="menu">旅行箱</a><br/>-->

                </div>

            </div>
            <div class="same-box-middel">
                <!-- 调用广告信息,传递参数acid:1 -->
                <a target="_blank" title="3楼箱包" href="/version4/core/adv!click.do?advid=24"">
                <img src="http://static.v5.javamall.com.cn/attachment/adv/201512091709250332.jpg" alt="3楼箱包" border="0" />			                </a>
            </div>
            <div class="same-box-right">
                <ul>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-279.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240921471679_thumbnail.jpg" alt="【甄选】七款可选周大福首饰3D福星宝宝足金黄金吊坠R " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-279.html">【甄选】七款可选周大福首饰3D福星宝宝足金黄金吊坠R </a>
                        </div>
                        <div class="goods-price">
                            <span>￥1,800.00</span>
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-278.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240918550205_thumbnail.jpg" alt="GUY LAROCHE/姬龙雪女包2015秋冬新款潮牛皮奢侈品手提包女手柄包 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-278.html">GUY LAROCHE/姬龙雪女包2015秋冬新款潮牛皮奢侈品手提包女手柄包 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥1,600.00</span>
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-277.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240915306549_thumbnail.jpg" alt="千百惠女包2015秋冬新款迷你手提包波士顿枕头包单肩斜挎包女小包 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-277.html">千百惠女包2015秋冬新款迷你手提包波士顿枕头包单肩斜挎包女小包 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥189.00</span>
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-276.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240912160192_thumbnail.jpg" alt="花花公子男包商务 单肩包休闲横款大包 潮男皮包公文包手提包男士" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-276.html">花花公子男包商务 单肩包休闲横款大包 潮男皮包公文包手提包男士</a>
                        </div>
                        <div class="goods-price">
                            <span>￥0.00</span>
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-275.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240907222443_thumbnail.jpg" alt="uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-275.html">uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱</a>
                        </div>
                        <div class="goods-price">
                            <span>￥280.00</span>
                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-274.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240903059195_thumbnail.jpg" alt="张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-274.html">张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥345.00</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <div class="index-same-fool ">
        <div class="index-same-tile index-clothing" >
            <h1>服装鞋帽<span>MEN'S&WOMEN'S CLOTHING</span></h1>
            <ul>

            </ul>
        </div>
        <div class="same-box">
            <div class="same-box-left">
                <!-- 品牌 -->
                <!-- 调用商品分类信息 -->
                <div class="index-beand-list">
                    <ul>

                        <li>
                            <a href="goods_list.html?brand=109">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241116564199.jpg" alt="淑女屋" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=110">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241117175752.jpg" alt="骆驼" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=111">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241117354260.jpg" alt="ONLY" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=112">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241117598462.jpg" alt="七匹狼" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=113">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241118254552.jpg" alt="MIPANAD" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=114">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241118460276.jpg" alt="索菲斯尔" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=115">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241119084132.jpg" alt="太子龙" border="0" />							</a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=116">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511241119220911.jpg" alt="有货" border="0" />							</a>
                        </li>
                    </ul>
                </div>
                <div class="same-cat">

                    <a href="/version4/goods_list.html?cat=92" title="短裤">短裤</a>
                    <a href="/version4/goods_list.html?cat=111" title="长袖衬衫">长袖衬衫</a>
                    <a href="search-cat-91.html" class="menu">男装</a><br/>
                    <a href="/version4/goods_list.html?cat=113" title="短裙">短裙</a>
                    <a href="/version4/goods_list.html?cat=114" title="连衣裙">连衣裙</a>
                    <a href="search-cat-93.html" class="menu">裙子</a><br/>
                    <a href="/version4/goods_list.html?cat=109" title="针织衫">针织衫</a>
                    <a href="/version4/goods_list.html?cat=116" title="羊毛衫">羊毛衫</a>
                    <a href="search-cat-108.html" class="menu">女装</a><br/>
                    <a href="/version4/goods_list.html?cat=118" title="冲锋衣">冲锋衣</a>
                    <a href="/version4/goods_list.html?cat=119" title="登山用品">登山用品</a>
                    <a href="search-cat-110.html" class="menu">户外运动</a><br/>

                </div>
            </div>
            <div class="same-box-middel">
                <a target="_blank" title="4楼广告" href="/version4/core/adv!click.do?advid=30"">
                <img src="http://www.javashop.cn/version4/statics/attachment/adv/201512211630157348.jpg" alt="4楼广告" border="0" />			                </a>
            </div>
            <div class="same-box-right">
                <ul>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-284.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_thumbnail.jpg" alt="大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-284.html">大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥270.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-282.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_thumbnail.jpg" alt="云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-282.html">云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥300.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-281.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_thumbnail.jpg" alt="sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-281.html">sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥430.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-280.html">
                                <img src="http://www.javashop.cn/version4/statics/attachment/goods/201512141153374291_thumbnail.jpg" alt="威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-280.html">威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥1,680.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-283.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_thumbnail.jpg" alt="2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 " class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-283.html">2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 </a>
                        </div>
                        <div class="goods-price">
                            <span>￥310.00</span>

                        </div>
                    </li>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-285.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_thumbnail.jpg" alt="THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣" class="scrollLoading" />								</a>
                        </div>
                        <div class="goods-name">
                            <a target="_blank" href="/version4/goods-285.html">THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣</a>
                        </div>
                        <div class="goods-price">
                            <span>￥300.00</span>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<div class="footer">
    <!-- 	<div class="link">
            <span class="item_name">友情链接：</span>
            <ul>
                <li><a href="http://javamall.com.cn/">友情链接</a>
                </li>
                <li><a href="http://javamall.com.cn/">友情链接</a>
                </li>
                <li><a href="http://javamall.com.cn/">友情链接</a>
                </li>
                <li><a href="http://javamall.com.cn/">友情链接</a>
                </li>
            </ul>
        </div> -->
    <div class="service_area">
        <div class="service_item">
            <div class="item">
                <div class="icon01"></div>
                <span class="title">新手上路</span>
                <ul>
                    <li><a href="/version4/help.html?articleid=10">顾客必读</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=11">会员等级折扣</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=13">积分规则</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=32">购物流程</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=31">常见问题</a>
                    </li>
                </ul>
            </div>
            <div class="item">
                <div class="icon02"></div>
                <span class="title">关于网站</span>
                <ul>
                    <li><a href="/version4/help.html?articleid=7">关于我们</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=8">联系我们</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=9">业务合作</a>
                    </li>
                </ul>
            </div>
            <div class="item">
                <div class="icon03"></div>
                <span class="title">购物指南</span>
                <ul>
                    <li><a href="/version4/help.html?articleid=15">游客购物通道</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=17">网站使用条款</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=19">购物流程</a>
                    </li>
                </ul>
            </div>
            <div class="item">
                <div class="icon04"></div>
                <span class="title">物流和配送</span>
                <ul>
                    <li><a href="/version4/help.html?articleid=30">配送范围</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=21">配送方式</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=23">关于收货与验货</a>
                    </li>
                </ul>
            </div>
            <div class="item">
                <div class="icon05"></div>
                <span class="title">支付方式</span>
                <ul>
                    <li><a href="/version4/help.html?articleid=20&catid=20">支付方式</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=28&catid=28">付款常见问题</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=29&catid=29">索取发票</a>
                </ul>
            </div>
            <div class="item">
                <div class="icon06"></div>
                <span class="title">售后服务</span>
                <ul>
                    <li><a href="/version4/help.html?articleid=16&catid=16">索取发票</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=18&catid=18">免责条款</a>
                    </li>
                    <li><a href="/version4/help.html?articleid=14&catid=14">商品退换货保障</a>
                    </li>
                </ul>
            </div>
            <div class="item">
                <span class="title">官方微信</span> <img src="http://192.168.1.104:8080/assets/web/images/weixin.png" alt="登录" />
            </div>
        </div>
    </div>·
    <div class="copyright">
		<span>易族智汇（北京）科技有限公司 Copyright©2014 javamall.com.cn. All rights reserved.  京ICP备11046046号

<script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F767a826e820eb7f9a1365b549a7b3693' type='text/javascript'%3E%3C/script%3E"));
</script>

</span>
<span>


<em style="margin:0px 5px 0px 0px">北京市西城区南滨河路甲25号金工宏洋大厦A座6层</em>

<em style="margin:0px 5px 0px 0px">Tel:400-6878-256</em>

<em style="margin:0px 5px 0px 0px">京公网安备110114000742号</em>

</span>
    </div>
</div>

</body>
</html>

    