<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/inc.jsp" %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <title>add a student</title>
    <script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
</head>

<body>
    <form id="form" action="<%=request.getContextPath()%>/ticket/add" method="post" onsubmit="return check()">
        书籍名称<input type="text" id="name" name="name"><span id="span0" style="color:red"></span><br>
        价格<input type="text" id="price" name="price"><span id="span1" style="color:red"></span><br>
        类型<select id="typeId" name="typeId"></select><br>
        介绍：<textarea id="content" name="show" ></textarea> <br>  
        是否上架<input type="radio" name="userUp" value="1">是<input type="radio" name="berth" value="2">否<br>
        <input type="submit" value="提交">
    </form>
</body>
<script type="text/javascript">
    $(function () {
        init();
    })

    function init() {
        $.ajax({
            url: "<%=request.getContextPath()%>/company/getAll",
            type: "get",
            dataType: "json",
            success: function (data) {
                var str = " <option value='-1'>请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    str += "<option value='" + data[i].id + "'>" + data[i].name + "</option>";
                }
                str += "<option value=\"-2\">add a new company</option>"
                $("#companies").html(str)
            },
            error: function () {
                window.alert("查询失败");
            }
        })
    }

    function addCompany() {
        if ($("#companies").val()=="-2"){
            $("#span2").html("<input type=\"text\" name=\"company.name\"><input type=\"text\" name=\"company.password\">")
        }
    }

    function check(){
        if ($("#name").val()==null ||
            $("#name").val()=="" 
        ){
            $("#span0").html("start city is required")
            return false
        }

        if ($("#price").val()==null ||
            $("#price").val()=="" 
        ){
            $("#span1").html("end city is required")
            return false
        }

        return true
    }
var editor;
 KindEditor.ready(function(K) {//将编辑器添加到文档中
  editor = K.create('#content', {
   width:"400px",	  
   cssPath : '<%=request.getContextPath()%>/js/kindeditor-4.1.10/plugins/code/prettify.css',
  //指定编辑器iframe document的CSS文件，用于设置 可视化区域的样式。
  uploadJson: "<%=request.getContextPath()%>/js/kindeditor-4.1.10/jsp/upload_json.jsp",
  //指定上传文件的服务器端程序。
 fileManagerJson: "<%=request.getContextPath()%>/js/kindeditor-4.1.10/jsp/file_manager_json.jsp",
  //指定浏览远程图片的服务器端程序。
  allowFileManager : true,//true时显示浏览远程服务器按钮 ;默认值: false
 //将富文本编辑中的内容同步到表单序列化中
  afterBlur:function(){this.sync();}
   });
});

</script>

</html>