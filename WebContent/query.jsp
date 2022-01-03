<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
</head>
<body>
  <form id="form">
    bank<select id="bank_id" name="bank.id"></select><br>
    card number<input type="text" name="number"><br>
    user's name<input type="text" name="user.name"><br>
    <input type="button" value="query" onclick="query(1)"><input type="reset">
    <input type="hidden" name="currentPage" id="currentPage">
    <input type="hidden" name="pageSize" id="pageSize">
    <input type="hidden" name="user.id" id="user_id">
  </form>
  <div id="display"></div>

</body>
<script type="text/javascript">
  //页面加载事件
  $(function () {
    init();
    query(1);
  })

  function init() {
    $.ajax({
      url: "<%=request.getContextPath()%>/bank/getAll.do",
      type: "get",
      dataType: "json",
      success: function (data) {
        var str="<option value='-1'>select</option>";
			  for(var i=0;i<data.length;i++){
				  str+="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
			  }
        $("#bank_id").html(str)
      },
      error: function(xhr, status, error) {
        var err = eval("(" + xhr.responseText + ")");
        alert(err.Message);
      }
    })
  }

  function query(page) {
    $("#currentPage").val(page);
    $("#totalRowNum").val(200);
    $("#pageSize").val(10);
    $("#user_id").val(10);
    $.ajax({
      url: "<%=request.getContextPath()%>/card/getAll.do",
      type: "post",
      dataType: "html",
      data: $("#form").serialize(),
      success: function (data) {
        $("#display").html(data);
      },
      error: function(xhr, status, error) {
  var err = eval("(" + xhr.responseText + ")");
  alert(err.Message);
}
    })
  }
</script>

</html>