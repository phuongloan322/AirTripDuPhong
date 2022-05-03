<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Detail Place</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
    <%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
    <%@ include file="/WEB-INF/views/layouts/header.jsp" %>
</head>
<body style="background: #fff !important">
<%@ include file="/WEB-INF/views/layouts/header2.jsp" %>
<div class="w-detail">
    <div>
        <a href="/detailplace/${images[0].place.placeId}">
            <i class="fas fa-arrow-left"></i>
        </a>
    </div>
    <br>
   <c:forEach var="item" items="${images}">
       <div>
           <img src="/asset/images/${item.name}" class="setimgdetail3">
       </div>
       <br>
   </c:forEach>
</div>

</body>
</html>