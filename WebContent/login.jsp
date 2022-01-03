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
     <form class="form-inline" id="loginForm">
       <table>
         <tr>
           <td>
             	用户名：
           </td>
           <td>
             	<input type="text" name="cname" id="cname" class="form-control">
           </td>
         </tr>
          <tr>
           <td>
             	密码：
           </td>
           <td>
             	<input type="password" id="cpassword"  name="cpassword" class="form-control">
           </td>
         </tr>
          <tr>
           <td>
             	验证码：
           </td>
           <td>
             	 <input type="text" name="checkcode" id="checkcode" class="form-control">
            <img id="imgcode" alt="" src="<%=request.getContextPath()%>/company/imgcode.do">
           </td>
         </tr>
         <tr>
          <td colspan="2">
             <input type="button" value="登录" onclick="login()" class="btn btn-success">
             <input type="reset" value="重置" class="btn btn-danger">
          </td>
         </tr>
       </table>
     </form>
</body>
<script type="text/javascript">

	function login(){
		var checkcode=$("#checkcode").val();
		var cname=$("#cname").val();
		var cpassword=$("#cpassword").val();
		if((cname!=null&&cname!="")&&(cpassword!=null &&cpassword!="") ){
			$.ajax({
				url:"<%=request.getContextPath()%>/company/login.do",
				type:"post",
				data:$("#loginForm").serialize(),
				dataType:"json",
				success:function(data){
					if(data==1){
						alert("验证码错误");
					}
					if(data==2){
						alert("用户名错误");
					}
					if(data==3){
						alert("密码错误");
					}
					if(data==4){
						location.href="<%=request.getContextPath()%>/index.jsp";
					}
				},error:function(){
					alert("登录失败");
				}
			})
		}else{
			alert("用户名密码或者验证码是否填写了");
		}
	}


//点击刷新验证码
$("#imgcode").click(function(){
	 $("#imgcode").attr("src","<%=request.getContextPath()%>/company/imgcode.do?t="+new Date().getTime())
})

</script>
</html>