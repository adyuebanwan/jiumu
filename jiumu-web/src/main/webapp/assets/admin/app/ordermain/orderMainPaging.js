$(function(){
 getItemPage(1);
    //绑定排序事件
    $("#thead").find("th").click(function(){
        var orderField = $(this).attr("orderField");
        var thClass = $(this).attr("class");
        //改变自己的
        if(typeof thClass != 'undefined'){
            //还原其他的th
            $("#thead").find("th").each(function(){
                var thCls = $(this).attr("class");
                if(typeof thCls != 'undefined'){
                    $(this).attr("class","sorting");
                }
            })
            if( thClass.indexOf('sorting_asc')!=-1){
                $(this).attr("class","sorting_desc")
                //倒序排列
            }else if(thClass.indexOf('sorting_desc')!=-1){
                //升序排列
                $(this).attr("class","sorting_asc")
            }else if(thClass.indexOf('sorting')!=-1){
                //倒序排列
                $(this).attr("class","sorting_desc")
            }
            getItemPage(1);
        }
    });
    //查询
    $("#querySubmit").click(function(){
        getItemPage(1);
    })
    //批量删除
    $("#checkAll").on("ifClicked",function(){
        if($("#checkAll").is(":checked")){
            $(".tdcheckbox").attr("checked",false);
        }else{
            $(".tdcheckbox").attr("checked",true);
        }
    })
});
function notBlank(str){
    return typeof str != 'undefined' && str !=''
}
function buildOrderBy(){
    var orderBy = ''
    $("#thead").find("th").each(function(){
        var thCls = $(this).attr("class");
        var orderField = $(this).attr("orderField");
        if(typeof thCls != 'undefined'){
            if(thCls.indexOf("sorting_desc")!=-1){
                if(notBlank(orderField)){
                    orderBy = orderField + " desc "
                    return
                }
            }else if(thCls.indexOf("sorting_asc")!=-1){
                if(notBlank(orderField)){
                    orderBy = orderField + " asc "
                    return
                }
            }
        }
    })
    return orderBy;
}
function deleteItem(id){
    if(!confirm("确定要删除？")){
        return
    }
    $.getJSON("admin/ordermain/delete/"+id,{date:new Date().getTime()},function(data){
        if(data.code =='ok'){
            alert("删除成功")
            $("#tr"+id).remove()
        }else{
            alert("删除失败")
        }
    })
}


function batchDeleteItem(){
    if(!confirm("确定要删除？")){
        return
    }
    var ids = []
    $(".tdcheckbox").each(function(){
        if($(this).is(":checked")){
            var id = $(this).val();
            ids.push(id)
        }
    })
    if(ids.length<=0){
        alert("请选择要删除的记录");
        return;
    }
    $.getJSON("admin/ordermain/batchdelete/"+ids.join(","),{date:new Date().getTime()},function(data){
        if(data.code =='ok'){
            alert("删除成功")
            for(var i=0;i<ids.length;i++){
                $("#tr"+ids[i]).remove()
            }
        }else{
            alert("删除失败")
        }
    })
}

/*pageIndex 当前是第几页 */
function  getItemPage(pageIndex){
    var template = '<tr id="tr{id}"><td><input type="checkbox" value="{id}" class="tdcheckbox"></td><td>{rankNum}</td>'+
    '<td>{id}</td><td>{account}</td><td>{realPay}</td><td>{buyerName}</td><td>{buyerAdress}</td><td>{buyerPhone}</td><td>{createTime}</td><td>{updateTime}</td><td>{operator}</td><td>{orderStatus}</td>' +
    '<td><a target="_blank" href="admin/ordermain/detail/{id}">编辑</a> <a href="javascript:{}" onclick="deleteItem({id})">删除</a></td></tr>';
    var pageSize = 20;//每页多少条记录
    var pageCount = parseInt($("#pageCount").val());//总共多少条记录
    var url ='admin/ordermain/page/'+pageIndex+'/'+pageCount;
    var requestParam = {date:new Date().getTime()}




    var id = $("#id").val();
    if(id!=''){
        requestParam.id=id;
    }


    var buyerName = $("#buyerName").val();
    if(buyerName!=''){
        requestParam.buyerName=buyerName;
    }


    var buyerAdress = $("#buyerAdress").val();
    if(buyerAdress!=''){
        requestParam.buyerAdress=buyerAdress;
    }


    var createTimeBegin = $("#createTimeBegin").val();
    if(createTimeBegin!=''){
        requestParam.createTimeBegin=createTimeBegin;
    }
    var createTimeEnd = $("#createTimeEnd").val();
    if(createTimeEnd!=''){
        requestParam.createTimeEnd=createTimeEnd;
    }


    var operator = $("#operator").val();
    if(operator!=''){
        requestParam.operator=operator;
    }


    var orderStatus = $("#orderStatus").val();
    if(orderStatus!=''){
        requestParam.orderStatus=orderStatus;
    }


    //排序
    var orderBy = buildOrderBy()
    if(typeof orderBy =='undefined' || orderBy!=''){
        requestParam.orderBy = orderBy;
    }
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


                        var orderStatusMap = {"":"全部","0":"待审核","1":"审核通过","2":"拒绝"};
                        value.orderStatus = orderStatusMap[value.orderStatus+""]

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
