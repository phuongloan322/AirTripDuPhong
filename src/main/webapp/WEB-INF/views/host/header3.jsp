 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="top-bar d-none d-md-block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="top-bar-left">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="top-bar-right">
                            <div class="social">
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Top Bar End -->

        <!-- Nav Bar Start -->
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a href="<c:url value="/become-a-host/index" />" class="navbar-brand">A<span>ir</span>Pay</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                        <a href="<c:url value="/become-a-host/index" />" class="nav-item nav-link">Trang chủ</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Menu</a>
                            <div class="dropdown-menu">
                                <a href="<c:url value="/become-a-host/listings" />" class="dropdown-item">Nhà / phòng cho thuê</a>
                                <a href="<c:url value="/become-a-host/upcoming/all-accept" />" class="dropdown-item">Đặt phòng</a>
                                <a href="<c:url value="/become-a-host" />" class="dropdown-item">Tạo mục cho thuê mới</a>
                                <a href="<c:url value="/become-a-host/history" />" class="dropdown-item">Lịch sử giao dịch</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${accLogin.name }</a>
                            <div class="dropdown-menu">
                                <a href="<c:url value="/index" />" class="dropdown-item">Chế độ du lịch</a>
                                <a href="<c:url value="/manager-account" />" class="dropdown-item">Quản lý tài khoản</a>
                                <a href="<c:url value="/logout" />" class="dropdown-item">Đăng xuất</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>