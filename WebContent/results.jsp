<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
    <title>View tickets</title>
    <script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
</head>
<body>
    <table border="1">
        <thead>
            <tr>
                <td>card id</td>
                <td>card number</td>
                <td>bank</td>
                <td>user</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${page.list}" var="card">
                <tr>
                    <td>${card.id}</td>
                    <td>${card.number}</td>
                    <td>${card.bank.name}</td>
                    <td>${card.user.name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <input type="button" value="first" onClick="query(1)">
    <input type="button" value="previous" onClick="query('${page.currentPage-1}')">
    <input type="button" value="jump to" onClick="query($('#jumpTo').val())">
    <input type="text" value="${page.currentPage}" id="jumpTo">
    <input type="button" value="next" onClick="query('${page.currentPage+1}')">
    <input type="button" value="last" onClick="query('${page.lastPage}')">
  
</body>
<script type="text/javascript">
    function query(page) {
    $("#currentPage").val(page);
    $("#totalRowNum").val(200);
    $("#pageSize").val(10);
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
    function next() {

    }
    function previous() {

    }
    //删除
    function delUser(userid) {
        if (confirm("你确定删除吗？")) {
            $.ajax({
                url: "<%=request.getContextPath()%>/user/delUser.do",
                type: "post",
                data: {
                    "userid": userid
                },
                success: function () {
                    location.reload();
                },
                error: function () {
                }
            })
        }
    }

    //修改前的回填
    function toUpdateUser(userid) {
        location.href = "<%=request.getContextPath()%>/user/toUpdateUser.do?userid=" + userid;
    }

    //全选
    function checkAll() {
        $("input[name='userid']").prop("checked", $("#check").prop("checked"))
    }

    //批量删除
    function delsUser() {
        var ids = "";
        $("input[name='userid']:checked").each(function () {
            ids += "," + $(this).val();
        })
        if (ids != null && ids != "") {
            $.ajax({
                url: "<%=request.getContextPath()%>/user/delsUser.do",
                type: "post",
                data: {
                    "ids": ids.substring(1)
                },
                success: function () {
                    location.reload();
                },
                error: function () {
                }
            })
        } else {
        }
    }
</script>

</html>