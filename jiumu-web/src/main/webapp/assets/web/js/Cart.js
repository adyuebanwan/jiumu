var Cart={
    init:function(staticserver){
        var self=this;
        this.bindEvent();
    },
    bindEvent:function(){
        var self=this;

        //购物数量调整
        $(".Numinput .increase,.Numinput .decrease").click(function(){
            $this = $(this);
            var number = $this.parents(".Numinput");
            var itemid =number.attr("itemid");
            var productid =number.attr("productid");
            var objipt = number.find("input");
            var num=objipt.val();
            num =parseInt(num);
            if (!isNaN(num)){
                if($this.hasClass("increase")){
                    num++;
                }
                if($this.hasClass("decrease")){
                    if(num == 1 ){
                        //if(confirm("确定要删除该商品?")){
                            self.deleteGoodsItem(itemid);
                        //}
                        return false;
                    }
                    num--;
                }
                num = (num <=1 || num > 100000) ? 1 : num;
                self.updateNum(itemid, num, productid,objipt);
            }
        });

        //购物数量手工输入
        $(".Numinput input").keydown(function(e){
            var kCode = $.browser.msie ? event.keyCode : e.which;
            //判断键值
            if (((kCode > 47) && (kCode < 58))
                || ((kCode > 95) && (kCode < 106))
                || (kCode == 8) || (kCode == 39)
                || (kCode == 37)) {
                return true;
            } else{
                return false;
            }
        }).focus(function() {
            this.style.imeMode='disabled';// 禁用输入法,禁止输入中文字符
        }).keyup(function(){
            var pBuy   = $(this).parent();//获取父节点
            var itemid  = pBuy.attr("itemid");
            var productid  = pBuy.attr("productid");
            var numObj = pBuy.find("input[name='num']");//获取当前商品数量
            var num    = parseInt(numObj.val());
            if (!isNaN(num)) {
                var numObj = $(this);
                var num    = parseInt(numObj.val());
                num = (num <=1 || num > 100000) ? 1 : num;
                self.updateNum(itemid, num, productid,numObj);
            }
        });

        //删除商品
        $("#cart-wrapper .delete").click(function(){
            var cartid = $(this).parents("tr").attr("itemid");
            //if(confirm("您确实要把该商品移出购物车吗？") ){
                self.deleteGoodsItem(cartid);
            //}
        });

        //清空购物车
        $("#cart-wrapper .clean_btn").click(function(){
            //if(confirm("您确认要清空购物车吗？") ){
                self.clean();
            //}
        });

        //继续购物
        $("#cart-wrapper .returnbuy_btn").click(function(){
            location.href="/";
        });

        //去结算
        $("#cart-wrapper .checkout-btn").click(function(){
            //if(isLogin){
                location.href="myorder/userinfo";
           // }else{
             //   self.showLoginWarnDlg();
           // }
        });
    },

    //提示登录信息
    showLoginWarnDlg:function(btnx,btny){
        var html = $("#login_tip").html();
        $.dialog({ title:'提示信息',content:html,lock:true,init:function(){

            $(".button-wrapper .btn").jbtn();
            $(".button-wrapper .to-login-btn").click(function(){
                location.href="login.html?forward=checkout.html";
            });

            //
            $(".button-wrapper .to-checkout-btn").click(function(){
                location.href="register.html?forward=checkout.html";
            });
        }});
    },

    //删除一个购物项
    deleteGoodsItem:function(itemid){
        var self=this;
        $.Loading.show("请稍候...");
        $.ajax({
            url:ctx+"/mycart/delete/"+itemid,
            data:"time="+new Date().getTime(),
            dataType:"json",
            success:function(result){
                if(result== 'ok'){
                    self.refreshTotal();
                    self.removeItem(itemid);
                }else{
                    $.alert("失败");
                }
                $.Loading.hide();
            },
            error:function(){
                $.Loading.hide();
                $.alert("出错了:(");
            }
        });
    },

    //移除商品项
    removeItem:function(itemid){
        $("#cart-wrapper tr[itemid="+itemid+"]").remove();
    },

    //清空购物车
    clean:function(){
        $.Loading.show("请稍候...");
        var self=this;
        $.ajax({
            url:ctx+"/mycart/clean",
            data:"time="+new Date().getTime(),
            dataType:"json",
            success:function(result){
                $.Loading.hide();
                if(result=="ok"){
                    location.href='mycart/';
                }else{
                    $.alert("清空失败");
                }
            },
            error:function(){
                $.Loading.hide();
                $.alert("出错了:(");
            }
        });
    },

    //更新数量
    updateNum:function(itemid,num,productid,num_input){
        var self = this;
        var url = ctx+"/mycart/update_cart_num/"+itemid+"/"+productid+"/"+num
        $.ajax({
            url:url,
            data:"time="+new Date().getTime(),
            dataType:"json",
            success:function(result){
                if(result == 'ok'){
                    self.refreshTotal();
                    var price = parseFloat($("tr[itemid="+itemid+"]").attr("price"));
                    price =self.changeTwoDecimal_f(price* num);
                    $("tr[itemid="+itemid+"] .itemTotal").html("￥"+price);
                    num_input.val(num);
                }else{
                    alert(result);
                }
            },
            error:function(){
                alert("出错了:(");
            }
        });
    },

    //刷新价格
    refreshTotal:function(){
        $.ajax({
            url:ctx+"/mycart/cart_account",
            data:"time="+new Date().getTime(),
            dataType:"json",
            success:function(data){
                $("#bonded_price").val(data);
                $("#cartAccount").html("￥"+data);
            },
            error:function(){
                alert("糟糕，出错了:(");
            }
        });
    },

    changeTwoDecimal_f:function(x) {
        var f_x = parseFloat(x);
        if (isNaN(f_x)) {
            alert('参数为非数字，无法转换！');
            return false;
        }
        var f_x = Math.round(x * 100) / 100;
        var s_x = f_x.toString();
        var pos_decimal = s_x.indexOf('.');
        if (pos_decimal < 0) {
            pos_decimal = s_x.length;
            s_x += '.';
        }
        while (s_x.length <= pos_decimal + 2) {
            s_x += '0';
        }
        return s_x;
    }
};

$(function(){
    Cart.init();
});