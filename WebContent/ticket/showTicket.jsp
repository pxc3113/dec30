<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/inc.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form id="queryForm" class="form-inline">
    出发城市：<input type="text" name="tstartCity" class="form-control"><br>
   航空公司：<select name="cid" id="cid" class="form-control">
           <option value="-1">请选择</option>
        </select> <br>
   出发日期：<input type="date" name="startDate">---<input type="date" name="endDate"><br>
        
    <input type="button" value="查询" class="byn btn-info" onclick="serach(1)">
      <div id="showTicket">
      </div>
      <input type="hidden" name="cpage" id="currentPage">
    </form>
</body>
<script type="text/javascript">
  $(function(){
	  serach(1);
	  getCompany();
  })
  //获得公司列表
  function getCompany(){
	  $.ajax({
		  url:"<%=request.getContextPath()%>/company/queryCompanyList.do",
		  type:"get",
		  dataType:"json",
		  success:function(data){
			  var str=" <option value='-1'>请选择</option>";
			  for(var i=0;i<data.length;i++){
				  str+="<option value='"+data[i].cid+"'>"+data[i].cname+"</option>";
			  }
			  $("#cid").html(str);
		  },error:function(){
			  alert("查询失败");
		  }
	  })
  }
  
  
  function serach(cpage){
	  $("#currentPage").val(cpage);
	  $.ajax({
		  url:"<%=request.getContextPath()%>/ticket/queryTicketList.do",
		  type:"post",
		  data:$("#queryForm").serialize(),
		  dataType:"html",
		  success:function(data){
			  $("#showTicket").html(data);
		  },error:function(){
			  alert("查询失败");
		  }	 
		 })
  }

</script>
</html>