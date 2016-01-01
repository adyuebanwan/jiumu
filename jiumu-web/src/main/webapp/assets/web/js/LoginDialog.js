(function($){
    var defaultOptions =
    {
        title: "登陆",modal:true,draggable:true,fixed:false,
        afterHide:function(){this.unload();},
        onLoadComplete:bindloginEvent,
        parent:null

    };
    var dialog;
    var loginSuccess;
    var loginError;
    $.LoginDialog = $.LoginDialog || {};


    $.LoginDialog.open=function(options){

        var loginurl=  ctx+"/login_dialog.html";
        options = $.extend({}, defaultOptions, options || {});

        //登陆成功和失败的事件
        loginSuccess =  options.loginSuccess;
        loginError = options.loginError;

        dialog = $.dialog({ title:"会员登录", width:475, height:312,lock:true,min:false,max:false});

        $.ajax({
            url:loginurl,
            success:function(html){
                dialog.content(html);
                bindloginEvent();
            },
            error:function(){
                $.alert("登录页面获取出错");
            },
            async: false
        });

        return false;
    };

    $.LoginDialog.close=function(){
        dialog.cancel();
    };

    function reLoadLoginBar(){
        $("#widget_login_bar").html("加载中...");
        $("#widget_login_bar").load("login_bar.html?widgetid=/login_bar.html&ajax=yes");
    }

    function bindloginEvent(){

        $(".regis_ent").click(function(){
            if($("#username").val()==""){
                alert("请输入用户名！");
                return false;
            }
            if($("#password").val()==""){
                alert("请输入密码！");
                return false;
            }
            if($("#validcode").val()==""){
                alert("请输入验证码！");
                return false;
            }
            var options = {
                url : ctx+"/api/shop/member!login.do",
                type : "POST",
                dataType : 'json',
                success : function(data) {
                    if(data.result==1){
                        location.reload();
                    }
                    else{
                        alert(data.message);
                    }
                },
                error : function(e) {
                    alert("出现错误 ，请重试");
                }
            };
            $('#login_form').ajaxSubmit(options);
        });
    }
})(jQuery);