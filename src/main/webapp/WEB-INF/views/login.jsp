<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Login</title>
		<script src="https://kit.fontawesome.com/a076d05399.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
		<%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
	</head>
	<body style="background: #fff !important">
	<%@ include file="/WEB-INF/views/layouts/header2.jsp" %>	
	<div class="w-detail">
		<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 panel panel-default">
					<div class="login-form"><!--login form-->
						<b class="login">ĐĂNG NHẬP</b><hr>
						<h4>Chào mừng bạn đến với AirPay</h4><br>
						<form action="/j_spring_security_check" method="post" class="has-error">
							<input type="text" placeholder="User name" name="username"/>
							<input type="password" placeholder="Password" name="password"/>
							<span>
								<input type="checkbox" class="checkbox"  name="remember-me">
								Keep me signed in
							</span>
							<p class="error">${error}</p>
							<button type="submit" class="btn btn-default btnlogin d-dat">Login</button>
							<a class="textcenter" href="/forgot-password">Quên mật khẩu ?</a>
							<hr>
							<a href="<%=request.getContextPath() %>/register" class="btn btn-default btnregister1 btnregister2 vertical-center">Tạo tài khoản mới</a>
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