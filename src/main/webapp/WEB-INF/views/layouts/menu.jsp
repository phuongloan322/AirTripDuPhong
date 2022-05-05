<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-3">
	<div class="shop-menu pull-right">
		<ul class="nav navbar-nav">
			<c:if test="${accLogin != null }">
				<li class="dropdown"><a class="i-chu"><i class="fa fa-user"></i>${accLogin.name }<i
						class="fa fa-angle-down"></i></a>
					<ul role="menu" class="sub-menu">
						<li><a href="<c:url value="/manager-account" />">Thông tin cá nhân</a></li>
						<li><a href="<c:url value="/loveplace" />">Danh sách Yêu thích</a></li>
						<li><a href="<c:url value="/bookroom" />">Nhà / phòng đã đặt</a></li>
						<hr>
						<li style="padding-top: 0"><a href="<c:url value="/become-a-host" />" >Trở thành chủ nhà</a></li>
						<li><a href="<c:url value="/become-a-host/index" />">Chế độ chủ nhà</a></li>
						<li><a href="<c:url value="/chat" />" >Trợ giúp</a></li>
						<li><a href="<c:url value="/logout" />">Đăng xuất</a></li>
					</ul>
				</li>
			</c:if>
			<c:if test="${accLogin == null }">
				<li><a href="<c:url value="/login" />" class="i-chu"><i class="fa fa-lock"></i> Đăng
					nhập</a></li>
			</c:if>
		</ul>
	</div>
</div>