<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../common/head.jsp" %>
    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    </meta>

    <%@include file="include/head.jsp" %>
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
                            <a href="/version4/cart.html" class="index-go-cart">购物车(<span class="num">0</span>)件<i
                                    class="common-cart-down"></i></a>

                            <div class="cart_content02" style="display:none">
                                <div class="cart_list"><img src="assets/web/img/ajax-loader.gif" class="loading"/></div>
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
    $(".login_bar").load("/version4/common/member_bar.html", function () {
        $("#logout").click(function () {
            $.ajax({
                url: "/version4/api/shop/member!logout.do?ajax=yes",
                dataType: "json",
                cache: false,             //清楚缓存，暂时测试，如果产生冲突，请优先考虑是否是这条语句。
                success: function (result) {
                    if (result.result == 1) {
                        $.alert(result.message);
                        location.href = "/version4/index.html";

                    } else {
                        $.alert(result.message);
                    }
                    $.Loading.hide();
                },
                error: function () {
                    $.Loading.hide();
                    $.alert("出错了:(");
                }
            });
            return false;
        })
    });

    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseenter(function () {
        $("#cart_bar_wrapper .cart_content02").slideDown(300);
        $(".common-cart-down").addClass("common-cart-up");
        $(this).addClass("cart-hover");
        //加载购物项
        $("#cart_bar_wrapper .cart_content02").remove(".cart_list");
//	$(".checkout").load("cart/common_totle.html");

    })
    //购物车显示隐藏
    $("#cart_bar_wrapper").mouseleave(function () {
        $("#cart_bar_wrapper .cart_content02").stop(true, true).hide();
        $(".common-cart-down").removeClass("common-cart-up");
        $(this).removeClass("cart-hover");
    })


</script>


<!--header-->
<div class="header">
    <div class="logo_area">
        <div class="logo">
            <a href="/version4/index.html">
                <img src="http://www.javashop.cn/version4/statics/attachment//201512112001371904.jpg" title="logo"/>
            </a>
        </div>
        <div class="search_area">
            <div class="search">
                <input type="text" class="hunt" id="keyword" placeholder="请输入产品关键字等..."/>
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
            <img src="assets/web/img/cn.png" alt="承诺图片"/></div>
    </div>
</div>
<div class="common_menu">
    <div class="menu">
        <div class="menu_left">
            <!-- 导航  start -->
            <%@include file="include/category.jsp"%>
            <!-- 导航  end -->
        </div>
        <div class="menu_right">
            <ul>
                <li><a href="/version4/index.html">首 页</a></li>
                <%--<li><a href="/version4/goods_list.html?cat=1">零食天地</a></li>
                <li><a href="/version4/goods_list.html?cat=4">进口食品</a></li>
                <li><a href="/version4/goods_list.html?cat=38">个人护理</a></li>
                <li><a href="/version4/goods_list.html?cat=35">箱包钟表</a></li>--%>
            </ul>
        </div>
    </div>
</div>
<!--header end-->

<script>
    $(function () {
        $("#logout").click(function () {
            $.ajax({
                url: "api/shop/member!logout.do?ajax=yes",
                dataType: "json",
                cache: false,             //清楚缓存，暂时测试，如果产生冲突，请优先考虑是否是这条语句。
                success: function (result) {
                    if (result.result == 1) {
                        $.alert(result.message);
                        location.href = "/version4/index.html";

                    } else {
                        $.alert(result.message);
                    }
                    $.Loading.hide();
                },
                error: function () {
                    $.Loading.hide();
                    $.alert("出错了:(");
                }
            });
            return false;
        })

        $("#keyword").keypress(function (event) {
            //	$("#keyword").attr("class","seek");
            if (event.keyCode == "13") {
                search();
            }
        });
        $("#keyword").click(function () {
            if ($(this).val() == searchTipText) {
                $(this).val("");
            }
        });
        $("#keyword").blur(function () {
            if ($(this).val() == '') {
                $(this).val(searchTipText);
            }
        });

        $("#searchBtn").click(function () {
            search();
        });
    })

    $('.all-sort-list > .item').hover(function () {
        var eq = $('.all-sort-list > .item').index(this),				//获取当前滑过是第几个元素
                h = $('.all-sort-list').offset().top,						//获取当前下拉菜单距离窗口多少像素
                s = $(window).scrollTop(),									//获取游览器滚动了多少高度
                i = $(this).offset().top,									//当前元素滑过距离窗口多少像素
                item = $(this).children('.item-list').height(),				//下拉菜单子类内容容器的高度
                sort = $('.all-sort-list').height();						//父类分类列表容器的高度

        $(this).children('.item-list').css('top', 0);

        $(this).addClass('hover');
        $(this).children('.item-list').css('display', 'block');
    }, function () {
        $(this).removeClass('hover');
        $(this).children('.item-list').css('display', 'none');
    });

    $('.item > .item-list > .close').click(function () {
        $(this).parent().parent().removeClass('hover');
        $(this).parent().hide();
    });


    var searchTipText = "请输入产品关键字，如品牌、型号等";
    function search() {
        var keyword = $.trim($("#keyword").val());
        if (keyword == searchTipText) {
            keyword = '';
        }
        if (keyword.indexOf('\\') != -1) {
            alert("请输入正确的关键词");
            return false;
        }
        if (keyword == '') {
            alert("请输入关键字");
        } else {
            keyword = keyword.replace(/\//g, "-xie-")
            location.href = "/version4/goods_list.html?keyword=" + keyword;
        }
    }


    function addfavorite(title, url) {

        if (document.all) {
            window.external.addFavorite(url, title);
        } else if (window.sidebar) {
            window.sidebar.addPanel(title, url, "");
        }

    }

</script>
<script>
    $(function () {
        $(".all-sort-list .item_box").mouseover(function () {
            $(this).find(".item").addClass("children-show");
            $(this).find(".index-show-children").css("left", "195px");
            $(this).find(".item_list").show();
            $(this).css("background", "#fff");
        })
        $(".all-sort-list .item_box").mouseleave(function () {
            $(this).find(".item").removeClass("children-show");
            $(this).find(".index-show-children").css("left", "190px");
            $(this).find(".item_list").hide();
            $(this).css("background", "none");
        })

        $(".menu_left").mouseover(function () {
            $(".all-sort-list").addClass("is_show");

        });
        $(".menu_left").mouseleave(function () {
            $(".all-sort-list").removeClass("is_show");

        })


        var url_ = "/version4/api/shop/goods-words.do";
        $("#keyword").bigAutocomplete({
            url: url_, callback: function (data) {
                location.href = "/version4/goods_list.html?keyword=" + data.title;
            }
        });
    })
</script>

<script src="assets/web/js/slider.js" type="text/javascript"></script>
<!-- 获取商品列表标签 -->
<!-- 调用广告标签 -->
<!-- 调用广告信息,传递参数acid:1 -->
<!-- 获取广告列表 -->
<%--<div class="max-adv">
    <div id="index-adv" class="flexslider">
        <ul class="slides">
            <li style="background:transparent url(http://www.javashop.cn/version4/statics/attachment/adv/201512211629309212.jpg) no-repeat scroll center top / cover "/>
            </li>
            <li style="background:transparent url(http://www.javashop.cn/version4/statics/attachment/adv/201512232158274233.jpg) no-repeat scroll center top / cover "/>
            </li>
        </ul>

    </div>
</div>--%>
<script type="text/javascript">
    //计算广告高度
    function advheight() {
        var advBoxHeight = $(window).height() * 0.565;
        $(".slides").css("height", advBoxHeight + "px");
    }
    $(function () {
        $('#index-adv').flexslider({
            animation: "slide",
            direction: "horizontal",
            easing: "swing"
        });

        $(".flexslider").mouseover(function () {
            $(".max-adv .flexslider .flex-direction-nav li a").show(500);
        })

        $(".flexslider").mouseleave(function () {
            $(".max-adv .flexslider .flex-direction-nav li a").hide();
        })
//	advheight();
    });
</script>
<div class="index-main">
    <script>
        $(function () {
            $('#groupbuy').flexslider({
                animation: "slide",
                direction: "horizontal",
                easing: "swing"
            });
        })
    </script>
    <!--  相同楼层 -->
    <div class="index-same-fool">
        <div class="index-same-tile index-food">
            <h1>食品饮料<span>FOOD AND BEVERAGE</span></h1>
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
                             <a href="goods_list.html?brand=1">
                                 <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211150124684.jpg"
                                      alt="旺旺" border="0"/> </a>
                         </li>

                         <li>
                             <a href="goods_list.html?brand=2">
                                 <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211143461491.jpg"
                                      alt="新农哥" border="0"/> </a>
                         </li>

                         <li>
                             <a href="goods_list.html?brand=7">
                                 <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211200113292.jpg"
                                      alt="天喔" border="0"/> </a>
                         </li>

                         <li>
                             <a href="goods_list.html?brand=4">
                                 <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211152387107.gif"
                                      alt="百味林" border="0"/> </a>
                         </li>

                         <li>
                             <a href="goods_list.html?brand=96">
                                 <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240103545878.jpg"
                                      alt="百变猪排" border="0"/> </a>
                         </li>

                         <li>
                             <a href="goods_list.html?brand=17">
                                 <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221658088525.jpg"
                                      alt="大白兔" border="0"/> </a>
                         </li>

                         <li>
                             <a href="goods_list.html?brand=16">
                                 <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221654250514.jpg"
                                      alt="阿尔卑斯" border="0"/> </a>
                         </li>

                         <li>
                             <a href="goods_list.html?brand=10">
                                 <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221035341549.gif"
                                      alt="瑞士莲" border="0"/> </a>
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
                <img src="http://static.v5.javamall.com.cn/attachment/adv/201512091708414759.jpg" alt="1楼美食、饮料广告"
                     border="0"/>                            </a>
            </div>
            <div class="same-box-right">
                <ul>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-267.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240149492509_thumbnail.jpg"
                                     alt="哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240144049007_thumbnail.jpg"
                                     alt="牛叉叉蜜汁猪肉脯烟熏炭烤猪肉干正宗靖江猪肉铺浦特产零食200g" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240139201504_thumbnail.jpg"
                                     alt="【三只松鼠_碧根果210gx2袋】零食坚果山核桃长寿果干果奶油味 " class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240133438025_thumbnail.jpg"
                                     alt="歌斐颂 纯可可脂纯黑巧克力320g 58%可可进口料休闲零食品黑巧" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240123138244_thumbnail.jpg"
                                     alt="绿岭新鲜有机生薄皮非新疆纸皮大核桃500G新货特产 原味坚果零食" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240115430875_thumbnail.jpg"
                                     alt="【沃隆_每日坚果25g*30袋】精美礼盒原味混合干果综合坚果仁箱装" class="scrollLoading"/> </a>
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
    <div class="index-same-fool">
        <div class="index-same-tile index-food">
            <h1>食品饮料<span>FOOD AND BEVERAGE</span></h1>
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
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211150124684.jpg"
                                     alt="旺旺" border="0"/> </a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=2">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211143461491.jpg"
                                     alt="新农哥" border="0"/> </a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=7">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211200113292.jpg"
                                     alt="天喔" border="0"/> </a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=4">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202211152387107.gif"
                                     alt="百味林" border="0"/> </a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=96">
                                <img src="http://static.v5.javamall.com.cn/attachment/brand/201511240103545878.jpg"
                                     alt="百变猪排" border="0"/> </a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=17">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221658088525.jpg"
                                     alt="大白兔" border="0"/> </a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=16">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221654250514.jpg"
                                     alt="阿尔卑斯" border="0"/> </a>
                        </li>

                        <li>
                            <a href="goods_list.html?brand=10">
                                <img src="http://static.v4.javamall.com.cn/attachment/brand/201202221035341549.gif"
                                     alt="瑞士莲" border="0"/> </a>
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
                <img src="http://static.v5.javamall.com.cn/attachment/adv/201512091708414759.jpg" alt="1楼美食、饮料广告"
                     border="0"/>                            </a>
            </div>
            <div class="same-box-right">
                <ul>
                    <li>
                        <div class="goods-img">
                            <a target="_blank" href="/version4/goods-267.html">
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240149492509_thumbnail.jpg"
                                     alt="哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240144049007_thumbnail.jpg"
                                     alt="牛叉叉蜜汁猪肉脯烟熏炭烤猪肉干正宗靖江猪肉铺浦特产零食200g" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240139201504_thumbnail.jpg"
                                     alt="【三只松鼠_碧根果210gx2袋】零食坚果山核桃长寿果干果奶油味 " class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240133438025_thumbnail.jpg"
                                     alt="歌斐颂 纯可可脂纯黑巧克力320g 58%可可进口料休闲零食品黑巧" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240123138244_thumbnail.jpg"
                                     alt="绿岭新鲜有机生薄皮非新疆纸皮大核桃500G新货特产 原味坚果零食" class="scrollLoading"/> </a>
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
                                <img src="http://static.v5.javamall.com.cn/attachment/goods/201511240115430875_thumbnail.jpg"
                                     alt="【沃隆_每日坚果25g*30袋】精美礼盒原味混合干果综合坚果仁箱装" class="scrollLoading"/> </a>
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

</div>
<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp"%>
</div>

</body>
</html>
