<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div class="sidebar" data-color="purple" data-background-color="black" data-image="/asset/images/sidebar-2.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo"><a href="/admin/index" class="simple-text logo-normal">
          <h2>AirPay</h2>
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
        
        <li class="nav-item ">
            <a class="nav-link" href="/admin/account-admin">
              <i class="material-icons">person</i>
              <p>${adminLogin.name }</p>
            </a>
          </li>
          
          <li class="nav-item  ">
            <a class="nav-link" href="/admin/index">
              <i class="material-icons">dashboard</i>
              <p>Trang chủ</p>
            </a>
          </li>
          
          <li class="nav-item ">
            <a class="nav-link" href="/admin/manager-category">
              <i class="material-icons">content_paste</i>
              <p>Quản lý danh mục</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/admin/manager-place">
              <i class="material-icons">home</i>
              <p>Quản lý Nhà / phòng</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/admin/manager-account">
              <i class="material-icons">account_circle</i>
              <p>Quản lý Khách Hàng</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/admin/manager-bookroom">
              <i class="material-icons">assignment_turned_in</i>
              <p>Quản lý đặt phòng</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/admin/manager-review">
              <i class="material-icons">library_books</i>
              <p>Quản lý Đánh giá</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/admin/manager-blog">
              <i class="material-icons">library_books</i>
              <p>Quản lý Blog</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/admin/manager-payment">
              <i class="material-icons">library_books</i>
              <p>Quản lý giao dịch</p>
            </a>
          </li><li class="nav-item ">
          <a class="nav-link" href="/admin/account-admin">
            <i class="material-icons">library_books</i>
            <p>Tài khoản Admin</p>
          </a>
        </li>
          
          <li class="nav-item ">
            <a class="nav-link" href="/admin/logout">
              <i class="material-icons">keyboard_backspace</i>
              <p>Đăng xuất</p>
            </a>
          </li>
         
        </ul>
      </div>
    </div>