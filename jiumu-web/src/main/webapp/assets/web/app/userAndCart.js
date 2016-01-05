//加载头部会员信息
/*$(".login_bar").load("/version4/common/member_bar.html", function () {
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
});*/

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



$(function(){
    /*$("#logout").click(function(){
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
    })*/

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
        location.href="list?keyword="+keyword;
    }
}


function addfavorite(title,url){

    if (document.all){
        window.external.addFavorite(url,title);
    }else if (window.sidebar){
        window.sidebar.addPanel(title, url, "");
    }

}


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
   /* var url_ = "/version4/api/shop/goods-words.do";
    $("#keyword").bigAutocomplete({url:url_, callback:function(data){
        location.href="/version4/goods_list.html?keyword="+data.title;
    }});*/
})