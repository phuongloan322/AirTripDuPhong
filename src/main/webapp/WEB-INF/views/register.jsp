<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--	<head>--%>
<%--		<title>Register</title>--%>
<%--		--%>
<%--		<link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">--%>
<%--		<%@ include file="/WEB-INF/views/layouts/head2.jsp" %>--%>
<%--	</head>--%>
<%--	<body style="background: #fff !important">--%>
<%--	<%@ include file="/WEB-INF/views/layouts/header2.jsp" %>	--%>
<%--	<div class="w-detail">--%>
<%--		<section id="form"><!--form-->--%>
<%--		<div class="container">--%>
<%--			<div class="row">--%>
<%--				<div class="col-md-6 col-md-offset-3 panel panel-default">--%>
<%--					<div class="login-form"><!--login form-->--%>
<%--						<b class="login">ĐĂNG KÝ</b><hr>--%>
<%--						<h4>Chào mừng bạn đến với AirPay</h4><br>--%>
<%--						<form action="<c:url value="/register" />" method="post" class="has-error">--%>
<%--							<input type="text" placeholder="Nhập tên đăng nhập" name="username" required/>--%>
<%--							<input type="text" placeholder="Nhập họ và tên" name="name" required/>--%>
<%--							<input type="email" placeholder="Nhập email" name="email" required/>--%>
<%--							<input type="number" placeholder="Nhập số điện thoại" name="phone" required/>--%>
<%--							<input type="text" placeholder="Nhập địa chỉ" name="address" required/>--%>
<%--							<input type="password" placeholder="Nhập mật khẩu" name="password" required/>--%>
<%--							<input type="password" placeholder="Nhập lại mật khẩu" name="repassword" required/>--%>
<%--							<br>--%>
<%--							<p class="error">${error}</p>--%>
<%--							--%>
<%--							<div class="g-recaptcha" data-sitekey="6LeWa5kdAAAAALGbpJ11WCEUv2LhWmDaSID9QmaX"></div>--%>
<%--      						<br/>--%>
<%--							--%>
<%--							<button type="submit" class="btn btn-default btnlogin d-dat">Đăng ký</button>--%>
<%--							<hr>--%>
<%--							<a href="<c:url value="/login" />" class="btn btn-default btnregister1 btnregister2 vertical-center">Bạn đã có tài khoản?</a>--%>
<%--							<br>--%>
<%--						</form>--%>
<%--					</div><!--/login form-->--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</section>--%>
<%--	</div>--%>
<%--	--%>
<%--	</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="apple-touch-icon" sizes="76x76" href="/asset/login/img/apple-icon.png">
	<link rel="icon" type="image/png" href="/asset/login/img/favicon.png">
	<title>
		AirTrip | Đăng ký
	</title>
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
	<!-- Nucleo Icons -->
	<link href="/asset/login/css/nucleo-icons.css" rel="stylesheet" />
	<link href="/asset/login/css/nucleo-svg.css" rel="stylesheet" />
	<!-- Font Awesome Icons -->
	<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
	<!-- Material Icons -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
	<!-- CSS Files -->
	<link id="pagestyle" href="/asset/login/css/material-dashboard.css?v=3.0.2" rel="stylesheet" />
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>

</head>

<body class="">
<div class="container position-sticky z-index-sticky top-0">
	<div class="row">
		<div class="col-12">
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg blur border-radius-lg top-0 z-index-3 shadow position-absolute mt-4 py-2 start-0 end-0 mx-4">
				<div class="container-fluid ps-2 pe-0">
					<a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="/index">
						<h4 style="color: #ef4365">AirTrip</h4>
					</a>
					<button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon mt-2">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </span>
					</button>
					<div class="collapse navbar-collapse" id="navigation">
						<ul class="navbar-nav mx-auto">
							<li class="nav-item">
								<a class="nav-link d-flex align-items-center me-2 active" aria-current="page" href="/index">
									<i class="fa fa-chart-pie opacity-6 text-dark me-1"></i>
									Trang chủ
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link me-2" href="/places">
									<i class="fa fa-user opacity-6 text-dark me-1"></i>
									Khám phá
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link me-2" href="/blog">
									<i class="fas fa-user-circle opacity-6 text-dark me-1"></i>
									Trải nghiệm
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link me-2" href="/contact">
									<i class="fas fa-key opacity-6 text-dark me-1"></i>
									Liên hệ
								</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>
	</div>
</div>
<main class="main-content  mt-0">
	<section>
		<div class="page-header min-vh-100">
			<div class="container">
				<div class="row">
					<div class="col-5 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
						<div class="bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center" style="background-image: url('/asset/login/img/illustrations/nenregister.jpg'); background-size: cover;position: -webkit-sticky;position: sticky; top: 0; height: 100%">
						</div>
					</div>
					<div class="col-xl-6 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-6" style="padding: 0 50px;">
						<div class="card card-plain">
							<div class="card-header" style="padding-bottom: 0">
								<h4 class="font-weight-bolder" style="margin-top: 80px;">Đăng ký</h4>
								<p>Chào mừng bạn đến với AirTrip</p>
							</div>
							<div class="card-body">
								<form action="<c:url value="/register" />" method="post"  role="form">
									<div class="input-group input-group-outline mb-3">
										<input type="text" placeholder="Nhập tên đăng nhập" name="username" required class="form-control">
									</div>
									<div class="input-group input-group-outline mb-3">
										<input  type="text" placeholder="Nhập họ và tên" name="name" required class="form-control">
									</div>
									<div class="input-group input-group-outline mb-3">
										<input type="email" placeholder="Nhập email" name="email" required class="form-control">
									</div>
									<div class="input-group input-group-outline mb-3">
										<input type="number" placeholder="Nhập số điện thoại" name="phone" required class="form-control">
									</div>
									<div class="input-group input-group-outline mb-3">
										<input  type="text" placeholder="Nhập địa chỉ" name="address" required class="form-control">
									</div>
									<div class="input-group input-group-outline mb-3">
										<input type="password" placeholder="Nhập mật khẩu" name="password" required class="form-control">
									</div>
									<div class="input-group input-group-outline mb-3">
										<input type="password" placeholder="Nhập lại mật khẩu" name="repassword" required class="form-control">
									</div>
									<div class="form-check form-check-info text-start ps-0">
										<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
										<label class="form-check-label" for="flexCheckDefault">
											Tôi đồng ý với các <a href="javascript:;" class="text-dark font-weight-bolder">Điều khoản và Điều kiện</a>
										</label>
									</div>
									<p class="text-danger">${error}</p>
									<div class="g-recaptcha" data-sitekey="6LeWa5kdAAAAALGbpJ11WCEUv2LhWmDaSID9QmaX"></div>
									<div class="text-center">
										<button type="submit" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0">ĐĂNG KÝ</button>
									</div>
								</form>
							</div>
							<div class="card-footer text-center pt-0 px-lg-2 px-1">
								<p class="mb-2 text-sm mx-auto">
									Đã có tài khoản?
									<a href="/login" class="text-primary text-gradient font-weight-bold">Đăng nhập</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<!--   Core JS Files   -->
<script src="/asset/login/js/core/popper.min.js"></script>
<script src="/asset/login/js/core/bootstrap.min.js"></script>
<script src="/asset/login/js/plugins/perfect-scrollbar.min.js"></script>
<script src="/asset/login/js/plugins/smooth-scrollbar.min.js"></script>
<script>
	var win = navigator.platform.indexOf('Win') > -1;
	if (win && document.querySelector('#sidenav-scrollbar')) {
		var options = {
			damping: '0.5'
		}
		Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
	}
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/asset/login/js/material-dashboard.min.js?v=3.0.2"></script>
</body>

</html>