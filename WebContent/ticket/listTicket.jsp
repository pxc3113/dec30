<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table border="1">
       <tr>
         <td>id</td>
         <td>出发城市</td>
         <td>到达城市</td>
         <td>舱位</td>
         <td>到达日期</td>
         <td>航空公司</td>
       </tr>
       <c:forEach items="${page.list }" var="t">
       <tr>
         <td>${t.tid }</td>
         <td>${t.tstartCity }</td>
         <td>${t.tendCity }</td>
         <td>
           <c:if test="${t.tberth==1 }">经济舱</c:if>
           <c:if test="${t.tberth==2 }">头等舱</c:if>
         </td>
         <td>${t.tstartDate }</td>
         <td>${t.company.cname }</td>
       </tr>
       </c:forEach>
    </table>
    <jsp:include page="/common/page.jsp"></jsp:include>
</body>
</html>