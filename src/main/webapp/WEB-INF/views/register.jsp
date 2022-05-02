<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Register</title>
		<script src="https://kit.fontawesome.com/a076d05399.js"></script>
		<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
		<%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
	</head>
	<body style="background: #fff !important">
	<%@ include file="/WEB-INF/views/layouts/header2.jsp" %>	
	<div class="w-detail">
		<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 panel panel-default">
					<div class="login-form"><!--login form-->
						<b class="login">ĐĂNG KÝ</b><hr>
						<h4>Chào mừng bạn đến với AirPay</h4><br>
						<form action="<c:url value="/register" />" method="post" class="has-error">
							<input type="text" placeholder="Nhập tên đăng nhập" name="username" required/>
							<input type="text" placeholder="Nhập họ và tên" name="name" required/>
							<input type="email" placeholder="Nhập email" name="email" required/>
							<input type="number" placeholder="Nhập số điện thoại" name="phone" required/>
							<input type="text" placeholder="Nhập địa chỉ" name="address" required/>
							<input type="password" placeholder="Nhập mật khẩu" name="password" required/>
							<input type="password" placeholder="Nhập lại mật khẩu" name="repassword" required/>
							<br>
							<p class="error">${error}</p>
							
							<div class="g-recaptcha" data-sitekey="6LeWa5kdAAAAALGbpJ11WCEUv2LhWmDaSID9QmaX"></div>
      						<br/>
							
							<button type="submit" class="btn btn-default btnlogin d-dat">Đăng ký</button>
							<hr>
							<a href="<c:url value="/login" />" class="btn btn-default btnregister1 btnregister2 vertical-center">Bạn đã có tài khoản?</a>
							<br>
						</form>
					</div><!--/login form-->
				</div>
			</div>
		</div>
	</section>
	</div>
	
	</body>
</html>