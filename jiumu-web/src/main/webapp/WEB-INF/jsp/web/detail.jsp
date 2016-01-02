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
                            <a href="/version4/cart.html" class="index-go-cart">购物车(<span class="num">0</span>)件<i class="common-cart-down"></i></a>
                            <div class="cart_content02" style="display:none">
                                <div class="cart_list"><img src="assets/web/images/ajax-loader.gif" class="loading" /></div>
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
            <img src="assets/web/images/cn.png" alt="承诺图片" />		</div>
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
                <li><a href="/index">首 页</a></li>
            </ul>
        </div>
    </div>
</div>
<!--header end-->

<script>
    $(function(){
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

<link rel="stylesheet" href="assets/web/css/goods.css" type="text/css" />

<script src="assets/web/js/magiczoom.js" type="text/javascript"></script>
<script src="assets/web/js/jcarousellite_1.0.1.min.js" type="text/javascript"></script>
<script src="assets/web/js/favorite.js" type="text/javascript"></script>
<script src="assets/web/js/jquery.numinput.js" type="text/javascript"></script>
<script src="assets/web/js/Goods.js" type="text/javascript"></script>
<script src="assets/web/js/Comment.js" type="text/javascript"></script>
<script src="assets/web/js/spec.js" type="text/javascript"></script>
<script  src="assets/web/js/airlines.js"  ></script>

<!--Main开始-->
<div class="goods-main">
    <div class="goods-navigation">
        <span class="float b">您的当前位置：</span><span class="nav-title"><span><a href="index.html">首页</a></span>&gt;<span><a href='goods_list.html?cat=1'>食品、饮料、酒水</a></span>&gt;<span><a href='goods_list.html?cat=2'>休闲零食 </a></span>&gt;<span><a href='goods_list.html?cat=6'>坚果</a></span>&gt;<span class="last">哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食</span></span>
    </div>
    <!-- 商品相册 -->
    <div id="detail-wrapper">
        <!-- 商品相册 -->
        <div class="gallery">
            <div class="preview">
                <a href="${CTX}${goods.bigPic}"  id="zoom" rel="zoom-width:400px;zoom-height:400px;"  class="MagicZoom">
                    <img   src="${CTX}${goods.bigPic}" />
                </a>
            </div>
            <div class="control_bar">
                <div class="control left-control"></div>
                <div class="thumblist">
                    <ul>
                        <li  class="selected"> <img src="${CTX}${goods.smallPic}" big="${CTX}${goods.bigPic}" small="${CTX}${goods.smallPic}" /></li>
                    </ul>
                </div>
                <div class="control right-control "></div>
            </div>
        </div>
        <!-- 商品详细 -->
        <div class="base">
            <!-- 商品基本信息 -->
            <div class="summary">
                <h2>${goods.name}</h2>
                <p class="sn">商品货号： ${goods.serialNum}</p>
                <div class="midden-area-priceArea">
                    <div class="priceArea-leftArea">
                        <p class="kaben-price">
                            商城价：
                            <span>￥${goods.sellPrice}</span>
                        </p>
                        <p>市场价：${goods.marketPrice}</p>
                    </div>

                </div>
                <!-- 配送范围 -->
            </div>
            <form action="cart.html" id="goodsform" method="post">
                <div class="choose">
                    <div class="rer-quantity" style="margin-top:10px;">
                        <label>订购数量：</label>
                        <div class="Numinput" id="num"></div>
                    </div>
                    <div class="btn-box">
                        <input type="hidden" id="goodsId" name="goodsid" value="${goods.id}" />
                        <div class="btn">
                            <input type="button" class="buynow-btn green-btn" value="立即购买" id="buyNow" />
                        </div>
                        <div class="btn">
                            <input type="button" class="addtocart-btn yellow-btn" value="加入购物车"  id="addbutton"  />
                        </div>
                        <div class="btn">
                            <a href="javascript:void(0);" class="favorite" goodsid="${goods.id}"></a>
                        </div>
                    </div>
                </div>
                <div style="clear:both;" ></div>
            </form>
        </div>

    </div>
    <div class="add-success-msg" style="display:none">
        <div >
            <div class="message">
                恭喜，该商品已添加到您的购物车！
            </div>
            <div class="button_wrapper">
                <div class="btn"><input type="button" class="returnbuy_btn small-green" value="继续购物"></div>
                <div class="btn"><input type="button" class="checkout_btn small-white" value="去结算"></div>
            </div>
        </div>
    </div>
    <script>
        var goodsid = 267;
        $(function(){
            Goods.init(true);

        });
    </script>	<div class="main-details">
    <div class="rer-detail float-nav">
        <div class="nav content-main-tit" id="comment-tab">
            <span class="selected goods_d" rel="1">商品详情</span>
        </div>
        <script type="text/javascript">
            $(function(){
                $('#comment-tab').waypoint(function(event, direction) {
                    $(this).parent().parent().parent().toggleClass('sticky', direction === "down");
                    $(".float-go-cart").toggle(100);
                    event.stopPropagation();
                });
            });
        </script>

        <!-- 详细及其他内容 -->
        <div class="tab_main">
            <div class="proDcon goods_tab_intro1" >
                <div class="rer_para">
                    <table cellspacing="0" cellpadding="0" width="100%" class="liststyle data">
                        <tbody>
                        <tr>
                            <th>计价单位：</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>产地：</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>包装：</th>
                            <td></td>
                        </tr>
                        <!-- 获得 paramList下的json数组，使用第二层list循环-->
                        <tr>
                            <th>规格:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>重量:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>产品标准号:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>生产日期:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>保质期:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>储存方法:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>配料:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>产地:</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>厂家:</th>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <p>${goods.goodDesc}</p>
            </div>
        </div>
    </div>
</div>
</div>

<script type="text/javascript">
    var jiathis_config = {data_track_clickback:'true'};
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1988640" charset="utf-8"></script>
<!-- JiaThis Button END -->
<!--Main end-->
<!--footer-->
<div class="footer">
    <%@include file="include/foot.jsp"%>
</div>

</body>
</html>
</html>
