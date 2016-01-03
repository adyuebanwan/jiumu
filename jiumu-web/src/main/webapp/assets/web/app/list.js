$(function(){
 getItemPage(1);
});


function sort(_t,orderBy){
    var cls = $(_t).attr("class");
    var desc = '';
    if(cls.indexOf("asc")!=-1){
        desc = "desc"
    }else{
        desc = "asc"
    }
    $(".goodslist_sort").find('li').find('a').each(
        function(){
            $(this) .attr("class","");
        }
    )

    $(_t).attr("class","selected "+desc);
    $("#orderBy").val(orderBy+" "+desc);
    getItemPage(1);
}

/*pageIndex 当前是第几页 */
function  getItemPage(pageIndex){
    var template =
        '<li class="item">'+
            '<div class="goodslist">'+
                '<div class="goodslist_img">'+
                    '<a href="goods/{id}" target="_blank" title="{name}">'+
                    '<img src="{smallPic}" alt="{name}" border="0" /></a>'+
                '</div>'+
                '<div class="goodslist_intro">'+
                    '<div class="goodslist_price">'+
                        '<em class="sale_price" title="12.79">￥{sellPrice}</em>'+
                        '<del>市场价：￥{marketPrice}</del>'+
                    '</div>'+
                    '<div class="goodslist_name">'+
                         '<a href="goods/{id}" target="_blank" title="{name}">{name}</a>'+
                    '</div>'+
                   /* '<div class="goodslist_gocart">'+
                        '<p>评论数：0</p>'+
                        '<a href="/version4/goods-56.html" class="add_cart" rel="56"></a>'+
                    '</div>'+*/
                '</div>'+
            '</div>'+
        '</li>';

    var pageSize = 20;//每页多少条记录
    var pageCount = parseInt($("#pageCount").val());//总共多少条记录
    var url ='list/page/'+pageIndex+'/'+pageCount;
    var requestParam = {date:new Date().getTime()}

    var oneCategoryId = $("#oneCategoryId").val();
    if(oneCategoryId!=''){
        requestParam.oneCategoryId=oneCategoryId;
    }
    var sellPrice = $("#sellPrice").val();
    if(sellPrice!=''){
        requestParam.sellPrice=sellPrice;
    }
    //排序
    requestParam.orderBy = $("#orderBy").val();

    $.ajax({
        url:url,
        type:'get',
        dataType:'json',
        data:requestParam,
        cache:false,
        beforeSend:function(xhr){},
        complete:function(xhr){},
        success:function(data){
            var rankNum = calcRankNum(pageIndex,20);
            $.each(data.result, function(index, val){
                if(index =="pageCount"){
                    $("#pageCount").val(pageCount)
                    pageCount = val;
                }
                if(index == "pageList"){
                    //var msg = val;
                    var templateHtml = "";
                    $.each(val, function(index1, value){
                        //排名
                        value.rankNum = ++rankNum;
                        //自定义输出

                        //赋值替换
                        var tm = template;
                        for(key in value){
                            var reg = new RegExp('{'+key+'}','g');
                            tm = tm.replace(reg , value[key]);
                        }
                        templateHtml+=tm;
                    });
                    $("#tbody").html(templateHtml);
                }
            });
            var page_bar =  build_bar(pageIndex,pageCount,pageSize);
            $("#pagination").html(page_bar);
            $("#pagination").find('a').click(function(){
                var pg = $(this).attr('pg');
                var li = $(this).parent();
                var liclass = li.attr('class')
                if(typeof liclass != 'undefined'){
                    if(liclass.indexOf('active')==-1){
                        getItemPage(parseInt(pg));
                    }
                }
            })
        }
    });
}
