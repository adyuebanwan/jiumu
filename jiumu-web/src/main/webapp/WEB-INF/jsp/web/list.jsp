<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Javashop做最好的Java B2B2C多用户商城系统</title>
    <meta name="keywords" content="最好的Java网店系统,Java多用户商城,Java B2B2C系统,Java 多店铺系统,O2O系统,Java商城定制开发">
    <meta name="description" content="Javashop提供优质的电子商务解决方案，提供最好的Java网店系统、Java多用户商城,Java B2B2C系统,Java 多店铺系统、Java商城定制开发。">
    <meta http-equiv="X-UA-Compatible" content="IE=9" > </meta>
    <script>
        var ctx="/version4";
    </script>

    <link rel="stylesheet" href="/version4/themes/kaben/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/version4/themes/kaben/css/dialog.css" type="text/css" />
    <!-- 首页 -->
    <link rel="stylesheet" href="/version4/themes/kaben/css/index.css" type="text/css" />

    <script src="/version4/themes/kaben/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="/version4/themes/kaben/js/jquery.form.3.51.0.js" type="text/javascript"></script>
    <script src="/version4/themes/kaben/js/lhgdialog.js" type="text/javascript"></script>
    <script src="/version4/themes/kaben/js/jquery.blockUI.js" type="text/javascript"></script>
    <!--  校验提示信息 -->
    <script src="/version4/themes/kaben/js/jquery.validate.js" type="text/javascript"></script>
    <!-- 将一个json对象转为字串 -->
    <script src="/version4/themes/kaben/js/Utils.js" type="text/javascript"></script>
    <!-- 购物车 -->
    <script src="/version4/themes/kaben/js/shop.js" type="text/javascript"></script>

    <!-- 下拉菜单jquer插件 -->
    <script src="/version4/themes/kaben/js/DropDownMenu.js" type="text/javascript"></script>
    <script src="/version4/themes/kaben/js/ui.datepicker.js" type="text/javascript"></script>
    <!-- 日期插件 -->
    <script src="/version4/themes/kaben/js/DatePicker.js" type="text/javascript"></script>
    <script src="/version4/themes/kaben/js/LoginDialog.js" type="text/javascript"></script>
    <script src="/version4/themes/kaben/js/jquery.bigautocomplete.js" type="text/javascript"></script>
    <!-- 自定义滚动条 -->
    <script src="/version4/themes/kaben/js/jquery.jscroll.js"></script>

    <!-- 购物车 -->
    <script src="/version4/themes/kaben/js/Cart.js"></script>
    <script src="/version4/themes/kaben/js/CartBar.js"></script>

    <script   src="/version4/themes/default/js/My97DatePicker/WdatePicker.js" ></script>
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
                                <div class="cart_list"><img src="/version4/themes/kaben/images/ajax-loader.gif" class="loading" /></div>
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
            <img src="/version4/themes/kaben/images/cn.png" alt="承诺图片" />		</div>
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

    $(".all_goods_list").hover(function(){
        $(".all-sort-list").css('display','block');
    },function(){
        $(".all-sort-list").css('display','none');
    })

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

<link rel="stylesheet" href="/version4/themes/kaben/css/goods_list.css" type="text/css" />
<!-- 推荐商品 -->
<div class="list_m1">
    <div class="m1_l">热卖推荐</div>
    <div class="m1_r">
        <div class="r_info">
            <div class="i_pic">
                <a target="_blank" href="/version4/goods-276.html">
                    <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240912160192_thumbnail.jpg" alt="花花公子男包商务 单肩包休闲横款大包 潮男皮包公文包手提包男士" class="scrollLoading" />							</a>
            </div>
            <div class="i_in">
                <div class="i_title">
                    <a target="_blank" href="/version4/goods-276.html">花花公子男包商务 单肩包休闲横款大包 潮男皮包公文包手提包男士</a>
                </div>
                <div class="i_price">
                    特价：
					<span>
					￥0.00
					</span>
                </div>
                <div class="i_btn">
                    <a target="_blank" href="/version4/goods-276.html">立即抢购</a>
                </div>
            </div>
        </div>
        <div class="r_info">
            <div class="i_pic">
                <a target="_blank" href="/version4/goods-277.html">
                    <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240915306549_thumbnail.jpg" alt="千百惠女包2015秋冬新款迷你手提包波士顿枕头包单肩斜挎包女小包 " class="scrollLoading" />							</a>
            </div>
            <div class="i_in">
                <div class="i_title">
                    <a target="_blank" href="/version4/goods-277.html">千百惠女包2015秋冬新款迷你手提包波士顿枕头包单肩斜挎包女小包 </a>
                </div>
                <div class="i_price">
                    特价：
					<span>
					￥189.00
					</span>
                </div>
                <div class="i_btn">
                    <a target="_blank" href="/version4/goods-277.html">立即抢购</a>
                </div>
            </div>
        </div>
        <div class="r_info">
            <div class="i_pic">
                <a target="_blank" href="/version4/goods-278.html">
                    <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240918550205_thumbnail.jpg" alt="GUY LAROCHE/姬龙雪女包2015秋冬新款潮牛皮奢侈品手提包女手柄包 " class="scrollLoading" />							</a>
            </div>
            <div class="i_in">
                <div class="i_title">
                    <a target="_blank" href="/version4/goods-278.html">GUY LAROCHE/姬龙雪女包2015秋冬新款潮牛皮奢侈品手提包女手柄包 </a>
                </div>
                <div class="i_price">
                    特价：
					<span>
					￥1,600.00
					</span>
                </div>
                <div class="i_btn">
                    <a target="_blank" href="/version4/goods-278.html">立即抢购</a>
                </div>
            </div>
        </div>
        <div class="r_info">
            <div class="i_pic">
                <a target="_blank" href="/version4/goods-275.html">
                    <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240907222443_thumbnail.jpg" alt="uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱" class="scrollLoading" />							</a>
            </div>
            <div class="i_in">
                <div class="i_title">
                    <a target="_blank" href="/version4/goods-275.html">uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱</a>
                </div>
                <div class="i_price">
                    特价：
					<span>
					￥280.00
					</span>
                </div>
                <div class="i_btn">
                    <a target="_blank" href="/version4/goods-275.html">立即抢购</a>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="goodslist_nav">
    <div class="goods_selected_left">
    	<span>
    		<a href="index.html">首页</a>
    	</span>
        <span class="arrow">&gt;</span>
        <span>搜索结果</span>
        <span class="arrow">&gt;</span>
    </div>

    <div class="goods_selected_all">
        <div class="have_chosen have_chosen_cat">
            <ul class="have_chosen_goods top_have_chosen_goods">
                <li class="have_chosen_goods_list cur last" rel=" last">
                    <span class=""><a href="goods_list.html?cat=4" >进口食品、进口牛奶</a></span>
                    <i class="chosen_cat_middle"></i>
                    <b></b>
                    <div class="ul_border" style="display:none;"></div>
                    <ul style="display:none;" class="goods_list_other">
                        <li>
                            <a href="goods_list.html?cat=4" >进口食品、进口牛奶</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=38" >美容化妆、个人护理</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=56" >母婴、玩具音像图书</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=79" >厨房用品、清洁用品</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=87" >家居运动、汽车维护</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=1" >食品、饮料、酒水</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=35" >珠宝钟表、饰品箱包</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=85" >营养保健、健康器械</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=86" >服装鞋靴、内衣佩饰</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=88" >电脑、软件、办公用品</a>
                        </li>
                        <li>
                            <a href="goods_list.html?cat=89" >手机通讯、数码电器</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>


    </div>
</div>
<div style="width:1200px;height:1px;margin:0px auto;clear:both;"></div>
<div class="goods_clear"></div>
<!-- 新版检索html -->
<div class="goodssearch_new">
    <!-- 已选择 -->
    <div class="wait_select">
        <div class="wait_left">按品牌：</div>
        <div class="wait_right">
            <ul class="brand_goods_search">
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=33" ><span>多美鲜</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=37" ><span>北田</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=39" ><span>AKBAR</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=44" ><span>张君雅</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=32" ><span>欧德堡</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=40" ><span>川宁</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=45" ><span>鲜得味</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=42" ><span>益昌老街</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=41" ><span>卡司诺</span></a></li>
                <li class="cat_brand_img"><a href="goods_list.html?cat=4&brand=46" ><span>海牌</span></a></li>
            </ul>
            <span class="brand_goods_search_more">更多</span>
        </div>
    </div>
    <script>
        $(function(){
            $(".brand_goods_search_more").click(function(){
                var listhidden = $(this).attr("class");
                if(listhidden=="brand_goods_search_more"){
                    $(this).prev().css("height","auto");
                    $(this).removeClass("brand_goods_search_more");
                    $(this).addClass("brand_goods_search_more1");
                    $(this).text("收起");
                }else{
                    $(this).prev().css("height","52px");
                    $(this).removeClass("brand_goods_search_more1");
                    $(this).addClass("brand_goods_search_more");
                    $(this).text("更多");
                }

            })
        })
    </script>
    <div class="wait_select">
        <div class="wait_left">按分类：</div>
        <div class="wait_right">
            <ul>
                <li><a href="goods_list.html?cat=4_5_22" >进品1</a></li>
                <li><a href="goods_list.html?cat=4_5_23" >进品酸奶</a></li>
                <li><a href="goods_list.html?cat=4_27_28" >进口红茶</a></li>
                <li><a href="goods_list.html?cat=4_27_30" >进口速溶咖啡</a></li>
                <li><a href="goods_list.html?cat=4_31_33" >进口海产品</a></li>
                <li><a href="goods_list.html?cat=4_24_25" >进口饼干</a></li>
                <li><a href="goods_list.html?cat=4_31_32" >进口膨化</a></li>
                <li><a href="goods_list.html?cat=4_24_26" >进口糕点</a></li>
                <li><a href="goods_list.html?cat=4_27_29" >进口绿茶</a></li>
                <li><a href="goods_list.html?cat=4_31_34" >进口果冻/布丁</a></li>
            </ul>
        </div>
    </div>
    <div class="wait_select">
        <div class="wait_left">按按价格：</div>
        <div class="wait_right">
            <ul>
                <li><a href="goods_list.html?cat=4&price=_5" >5元以下</a></li>
                <li><a href="goods_list.html?cat=4&price=5_10" >5-10元</a></li>
                <li><a href="goods_list.html?cat=4&price=10_20" >10-20元</a></li>
                <li><a href="goods_list.html?cat=4&price=20_50" >20-50元</a></li>
                <li><a href="goods_list.html?cat=4&price=50_100" >50-100元</a></li>
                <li><a href="goods_list.html?cat=4&price=100_" >100元以上</a></li>
            </ul>
        </div>
    </div>
    <div class="wait_select_other">
        <div class="wait_select " >
            <div class="wait_left">按包装：</div>
            <div class="wait_right">
                <ul>
                    <li><a href="goods_list.html?cat=4&prop=包装_袋装" >袋装</a></li>
                    <li><a href="goods_list.html?cat=4&prop=包装_盒装" >盒装</a></li>
                    <li><a href="goods_list.html?cat=4&prop=包装_杯装" >杯装</a></li>
                </ul>
            </div>
        </div>
        <div class="wait_select " >
            <div class="wait_left">按产地：</div>
            <div class="wait_right">
                <ul>
                    <li><a href="goods_list.html?cat=4&prop=产地_德国" >德国</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_斯里兰卡" >斯里兰卡</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_泰国" >泰国</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_台湾" >台湾</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_英国" >英国</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_其他国家和地区" >其他国家和地区</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_中国台湾" >中国台湾</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_韩国" >韩国</a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_马来西亚 " >马来西亚 </a></li>
                    <li><a href="goods_list.html?cat=4&prop=产地_波兰" >波兰</a></li>
                </ul>
            </div>
        </div>
        <div class="wait_select " >
            <div class="wait_left">按口味：</div>
            <div class="wait_right">
                <ul>
                    <li><a href="goods_list.html?cat=4&prop=口味_其他" >其他</a></li>
                    <li><a href="goods_list.html?cat=4&prop=口味_纯牛奶" >纯牛奶</a></li>
                    <li><a href="goods_list.html?cat=4&prop=口味_白咖啡" >白咖啡</a></li>
                    <li><a href="goods_list.html?cat=4&prop=口味_甜味" >甜味</a></li>
                    <li><a href="goods_list.html?cat=4&prop=口味_原味" >原味</a></li>
                    <li><a href="goods_list.html?cat=4&prop=口味_烧烤味" >烧烤味</a></li>
                    <li><a href="goods_list.html?cat=4&prop=口味_香辣味" >香辣味</a></li>
                    <li><a href="goods_list.html?cat=4&prop=口味_巧克力" >巧克力</a></li>
                </ul>
            </div>
        </div>
        <div class="wait_select last" >
            <div class="wait_left">按品种：</div>
            <div class="wait_right">
                <ul>
                    <li><a href="goods_list.html?cat=4&prop=品种_酸奶" >酸奶</a></li>
                    <li><a href="goods_list.html?cat=4&prop=品种_全脂" >全脂</a></li>
                    <li><a href="goods_list.html?cat=4&prop=品种_低脂" >低脂</a></li>
                    <li><a href="goods_list.html?cat=4&prop=品种_脱脂" >脱脂</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        //搜索结果

        $(".top_have_chosen_goods .have_chosen_goods_list").mouseover(function(){
            var ulwidth = $(this).width()
            var ulwidth_white = parseInt(ulwidth)+parseInt("30");
            var ulborder_width = parseInt(ulwidth)+parseInt("141")   //减去ul的2像素边框
            $(".top_have_chosen_goods .have_chosen_goods_list").find(".goods_list_other").hide();
            $(".top_have_chosen_goods .have_chosen_goods_list").find(".ul_border").hide();
            $(this).find(".goods_list_other").show();
            $(this).find(".ul_border").show();
            $(this).find(".goods_list_other").css("width",ulborder_width);
            $(this).find(".ul_border").css("width",ulwidth_white);
            $(this).css({"border":"1px solid #e4393e","border-bottom":"0px none"});
        })

        $(".top_have_chosen_goods .have_chosen_goods_list").mouseleave(function(){
            $(this).find(".goods_list_other").hide();
            $(this).find(".ul_border").hide();
            $(this).css("border","1px solid #ccc");
        })






        /*
         $(".cat_brand_img").mouseover(function(){
         $(this).find("img").hide();
         $(this).find("span").show();
         $(this).css({"border":"2px solid #e4393e","padding":"1px"});
         })
         $(".cat_brand_img").mouseleave(function(){
         $(this).find("img").show();
         $(this).find("span").hide();
         $(this).css({"border":"1px solid #ccc","padding":"2px"});
         })
         */
    })
</script>


<div class="goods_list_all" >
    <!-- 排序 -->
    <div class="goods_bar">
        <div class="sorting_goods">
            <p>排序方式：</p>
            <ul class="goodslist_sort">
                <li><a href="goods_list.html?cat=4&sort=def_asc" class="selected asc" >默认</a></li>
                <li><a href="goods_list.html?cat=4&sort=buynum_desc"  >销量</a></li>
                <li><a href="goods_list.html?cat=4&sort=price_desc"  >价格</a></li>
                <li><a href="goods_list.html?cat=4&sort=grade_desc"  >评价</a></li>
            </ul>
            <div class="bar_page">
                <div class="page" ><span class="info" >共43条记录</span>
                    <span class="info">1/3</span>
                    <ul><li><a  class="selected">1</a></li>
                        <li><a  class="unselected"href='/version4/goods_list.html?cat=4&page=2'>2</a></li>
                        <li><a  class="unselected"href='/version4/goods_list.html?cat=4&page=3'>3</a></li>
                        <li><a  class="unselected" href='/version4/goods_list.html?cat=4&page=2'>&gt;&gt;</a></li>
                        <li><a  class="unselected" href='/version4/goods_list.html?cat=4&page=3'>&gt;|</a></li>
                    </ul></div>			   	</div>
        </div>
    </div>
    <!-- 商品列表循环  -->
    <div class="goodslist_circulate" >
        <ul class="goodslist_all ">
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-56.html" target="_blank" title="欧德堡 超高温处理全脂纯牛奶1L/盒(德国)">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202221957156907_thumbnail.jpg" alt="欧德堡 超高温处理全脂纯牛奶1L/盒(德国)" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="12.79">￥12.79</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-56.html" target="_blank" title="欧德堡 超高温处理全脂纯牛奶1L/盒(德国)">欧德堡 超高温处理全脂纯牛奶1L/盒(德国)</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-56.html" class="add_cart" rel="56"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-57.html" target="_blank" title="欧德堡 超高温处理减脂牛奶1L/盒(德国)">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222000570832_thumbnail.jpg" alt="欧德堡 超高温处理减脂牛奶1L/盒(德国)" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="12.79">￥12.79</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-57.html" target="_blank" title="欧德堡 超高温处理减脂牛奶1L/盒(德国)">欧德堡 超高温处理减脂牛奶1L/盒(德国)</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-57.html" class="add_cart" rel="57"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-58.html" target="_blank" title="多美鲜低脂牛奶 1L/盒(德国)  多美鲜">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222004054609_thumbnail.jpg" alt="多美鲜低脂牛奶 1L/盒(德国)  多美鲜" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="9.9">￥9.9</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-58.html" target="_blank" title="多美鲜低脂牛奶 1L/盒(德国)  多美鲜">多美鲜低脂牛奶 1L/盒(德国)  多美鲜</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-58.html" class="add_cart" rel="58"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-59.html" target="_blank" title="多美鲜脱脂牛奶 1L/盒(德国)  多美鲜">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222007326077_thumbnail.jpg" alt="多美鲜脱脂牛奶 1L/盒(德国)  多美鲜" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="9.9">￥9.9</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-59.html" target="_blank" title="多美鲜脱脂牛奶 1L/盒(德国)  多美鲜">多美鲜脱脂牛奶 1L/盒(德国)  多美鲜</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-59.html" class="add_cart" rel="59"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-60.html" target="_blank" title="欧德堡 超高温处理全脂纯牛奶1L/盒(德国) X 6 组合装 ">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222010463574_thumbnail.jpg" alt="欧德堡 超高温处理全脂纯牛奶1L/盒(德国) X 6 组合装 " border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="76.7">￥76.7</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-60.html" target="_blank" title="欧德堡 超高温处理全脂纯牛奶1L/盒(德国) X 6 组合装 ">欧德堡 超高温处理全脂纯牛奶1L/盒(德国) X 6 组合装 </a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-60.html" class="add_cart" rel="60"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-61.html" target="_blank" title="多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国)">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222013387540_thumbnail.jpg" alt="多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国)" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="4.62">￥4.62</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-61.html" target="_blank" title="多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国)">多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国)</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-61.html" class="add_cart" rel="61"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-62.html" target="_blank" title="多美鲜 全脂果粒酸奶-桃果粒+西番莲汁 100g/盒(德国)">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222016318873_thumbnail.jpg" alt="多美鲜 全脂果粒酸奶-桃果粒+西番莲汁 100g/盒(德国)" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="4.62">￥4.62</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-62.html" target="_blank" title="多美鲜 全脂果粒酸奶-桃果粒+西番莲汁 100g/盒(德国)">多美鲜 全脂果粒酸奶-桃果粒+西番莲汁 100g/盒(德国)</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-62.html" class="add_cart" rel="62"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-63.html" target="_blank" title="多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国) X 24 组合装">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222019075611_thumbnail.jpg" alt="多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国) X 24 组合装" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="110.0">￥110.0</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-63.html" target="_blank" title="多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国) X 24 组合装">多美鲜 全脂果粒酸奶-草莓果粒 100g/盒(德国) X 24 组合装</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-63.html" class="add_cart" rel="63"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-64.html" target="_blank" title="爱尔曼 0.1%低脂常温香蕉酸奶+低脂芒果橙酸奶 4*100g/盒 ">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222022044099_thumbnail.jpg" alt="爱尔曼 0.1%低脂常温香蕉酸奶+低脂芒果橙酸奶 4*100g/盒 " border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="19.8">￥19.8</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-64.html" target="_blank" title="爱尔曼 0.1%低脂常温香蕉酸奶+低脂芒果橙酸奶 4*100g/盒 ">爱尔曼 0.1%低脂常温香蕉酸奶+低脂芒果橙酸奶 4*100g/盒 </a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-64.html" class="add_cart" rel="64"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-65.html" target="_blank" title="爱尔曼 0.1%低脂常温草莓酸奶+低脂桃子热情果酸奶 4*100g/盒 ">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222025212839_thumbnail.jpg" alt="爱尔曼 0.1%低脂常温草莓酸奶+低脂桃子热情果酸奶 4*100g/盒 " border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="19.8">￥19.8</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-65.html" target="_blank" title="爱尔曼 0.1%低脂常温草莓酸奶+低脂桃子热情果酸奶 4*100g/盒 ">爱尔曼 0.1%低脂常温草莓酸奶+低脂桃子热情果酸奶 4*100g/盒 </a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-65.html" class="add_cart" rel="65"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-66.html" target="_blank" title="北田 能量99棒蛋黄味180g/包">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222028265324_thumbnail.jpg" alt="北田 能量99棒蛋黄味180g/包" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="14.1">￥14.1</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-66.html" target="_blank" title="北田 能量99棒蛋黄味180g/包">北田 能量99棒蛋黄味180g/包</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-66.html" class="add_cart" rel="66"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-67.html" target="_blank" title="北田 蒟蒻糙米卷（蛋黄）160g/包">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222032179405_thumbnail.jpg" alt="北田 蒟蒻糙米卷（蛋黄）160g/包" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="10.9">￥10.9</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-67.html" target="_blank" title="北田 蒟蒻糙米卷（蛋黄）160g/包">北田 蒟蒻糙米卷（蛋黄）160g/包</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-67.html" class="add_cart" rel="67"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-68.html" target="_blank" title="北田 五谷168青葱夹心棒180g/包">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222037574232_thumbnail.jpg" alt="北田 五谷168青葱夹心棒180g/包" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="11.5">￥11.5</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-68.html" target="_blank" title="北田 五谷168青葱夹心棒180g/包">北田 五谷168青葱夹心棒180g/包</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-68.html" class="add_cart" rel="68"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-69.html" target="_blank" title="北田 燕麦五谷（海苔）150g/包">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222041290747_thumbnail.jpg" alt="北田 燕麦五谷（海苔）150g/包" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="11.5">￥11.5</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-69.html" target="_blank" title="北田 燕麦五谷（海苔）150g/包">北田 燕麦五谷（海苔）150g/包</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-69.html" class="add_cart" rel="69"></a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="item">
                <div class="goodslist">
                    <div class="goodslist_img">
                        <a href="/version4/goods-70.html" target="_blank" title="丹麦蓝罐 曲奇125g">
                            <img src="http://static.v4.javamall.com.cn/attachment/goods/201202222045380887_thumbnail.jpg" alt="丹麦蓝罐 曲奇125g" border="0" />			        			</a>
                    </div>
                    <div class="goodslist_intro">
                        <div class="goodslist_price">
                            <em class="sale_price" title="10.5">￥10.5</em>
                            <del>市场价：</del>
                        </div>
                        <div class="goodslist_name">
                            <a href="/version4/goods-70.html" target="_blank" title="丹麦蓝罐 曲奇125g">丹麦蓝罐 曲奇125g</a>
                        </div>
                        <div class="goodslist_gocart">
                            <p>评论数：0</p>
                            <a href="/version4/goods-70.html" class="add_cart" rel="70"></a>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="goods_list_page">
        <!-- 结束 -->
        <div class="page" ><span class="info" >共43条记录</span>
            <span class="info">1/3</span>
            <ul><li><a  class="selected">1</a></li>
                <li><a  class="unselected"href='/version4/goods_list.html?cat=4&page=2'>2</a></li>
                <li><a  class="unselected"href='/version4/goods_list.html?cat=4&page=3'>3</a></li>
                <li><a  class="unselected" href='/version4/goods_list.html?cat=4&page=2'>&gt;&gt;</a></li>
                <li><a  class="unselected" href='/version4/goods_list.html?cat=4&page=3'>&gt;|</a></li>
            </ul></div>  		</div>
</div>
<script>
    $(function(){
        $(".goodslist_all li").mouseover(function(){
            $(".goodslist_all li").removeClass("item-hover");
            $(this).addClass("item-hover");
        })
        $(".goodslist_all li").mouseleave(function(){
            $(".goodslist_all li").removeClass("item-hover");
        })
    })
</script>
<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp"%>
</div>

</body>
</html>
