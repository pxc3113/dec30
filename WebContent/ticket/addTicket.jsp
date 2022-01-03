<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/inc.jsp" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="addForm" class="form-inline">
    出发城市：<input type="text" name="tstartCity" class="form-control"><br>
    到达城市：<input type="text" name="tendCity" class="form-control"><br>
 舱位：<input type="radio" value="1" name="tberth">经济舱
 <input type="radio" value="2" name="tberth">头等舱<br>  
   出发日期：<input type="date" name="tstartDate"><br>
  航空公司：<select name="company.cid" id="cid" class="form-control" onchange="changeCompany()">
           <option value="-1">请选择</option>
           <c:forEach items="${list }" var="c">
           <option value="${c.cid }">${c.cname }</option>
           </c:forEach>
           <option value="-2">其他</option>
        </select><span id="sp1"></span> <br>      
    <input type="button" value="新增" class="byn btn-info" onclick="addTicket()">
    </form>
</body>
<script type="text/javascript">
  function addTicket(){
	 $.ajax({
		 url:"<%=request.getContextPath()%>/ticket/addTicket.do",
		 type:"post",
		 data:$("#addForm").serialize(),
		 success:function(){
			 location.href="<%=request.getContextPath()%>/ticket/toShowTicket.do";
		 },error:function(){
			 alert("新增失败");
		 }
	 }) 
  }
  
  function changeCompany(){
	  var cid=$("#cid").val();
	  //判断用户是否要自己新增公司
	  if(cid==-2){
		  $("#sp1").html("<br>航空公司名称：<input class='form-control' name='company.cname'><br>航空公司密码：<input type='password' class='form-control' name='company.cpassword'>");
	  }else{
		  $("#sp1").html("");
	  }
  }
</script>
</html>