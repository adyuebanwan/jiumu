var ctx = $("#ctx").val();
function uploadFile(index,folder){
    $.ajaxFileUpload({
        //处理文件上传操作的服务器端地址(可以传参数)
        url:ctx + '/commonfile/fileupload/'+folder+'?date='+new Date().getTime(),
        secureuri:false,                       //是否启用安全提交,默认为false
        fileElementId:index+"File",           //文件选择框的id属性
        dataType:'text',                       //服务器返回的格式,可以是json或xml等
        success:function(data, status){        //服务器响应成功时的处理函数
            data = data.split(">")[1];
            data = data.replace("<pre>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
            data = data.replace("</PRE>", '');
            data = data.replace("</PRE", '');
            data = data.replace("<pre>", '');
            data = data.replace("</pre", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
            if(data.substring(0, 1) == 0){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
                var uploadSrc = data.substring(2)
                $("#"+index+"Review").attr("src", ctx + uploadSrc);
                $("#"+index).val(uploadSrc);
            }else{
                alert("上传失败请重试")
            }
        },
        error:function(data, status, e){ //服务器响应失败时的处理函数
            alert("上传失败请重试")
        }
    });
}
function createKindEditor(textName,itemArr){
    var items =
        itemArr ||
        [
        'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|','image', 'multiimage',
        'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
        'anchor', 'link', 'unlink', '|', 'about'
        ]
    KindEditor.create('textarea[name="'+textName+'"]', {
        uploadJson : '/commonfile/ckfileupload/goods?maxWidth=952',
        allowFileManager : true,
        extraFileUploadParams : {sessionid : 'abcdef'},
        items : items,
        afterCreate : function() {
            var self = this;
            self.sync();
        },afterChange : function() {
            var self = this;
            self.sync();
        }
    });
}
//如果不空 就必须是数字
function mustBeNumOrNull(idArr,alertArr){
    for(var i=0;i<idArr.length;i++){
        var v = $("#"+idArr[i]).val()
        if(v!='' && isNaN(v)){
            alert(alertArr[i]+"必须为数字");
            $("#"+idArr[i]).focus()
            return false
        }
    }
    return true
}
//不能为空
function mustBeNotBlank(idArr,alertArr){
    for(var i=0;i<idArr.length;i++){
        var v = $("#"+idArr[i]).val()
        if(v==''){
            alert("请输入"+alertArr[i]);
            $("#"+idArr[i]).focus()
            return false
        }
    }
    return true
}

function trimInput(idArr){
    for(var i=0;i<idArr.length;i++){
        var jqDom = $("#"+idArr[i]);
        jqDom.val($.trim(jqDom.val()))
    }
}