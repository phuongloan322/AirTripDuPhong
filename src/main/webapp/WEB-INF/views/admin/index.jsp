<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    AirPay - Trang quản lý
  </title>
  <%@ include file="/WEB-INF/views/layout/head.jsp" %>
</head>

<body class="dark-edition">
  <div class="wrapper ">
    <%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
            <form class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <button type="submit" class="btn btn-default btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
           
            <%@ include file="/WEB-INF/views/layout/nav-link.jsp" %>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
          
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 t">
              <div class="card card-stats">
              	<a href="<c:url value="/manager-category" />">
	                <div class="card-header card-header-warning card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">content_paste</i>
	                  </div>
	                  <h4 style="padding: 20px;">Quản lý loại</h4>
	                  
	                </div>
               	</a>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 t">
              <div class="card card-stats">
	              <a href="<c:url value="/manager-place" />">
	                <div class="card-header card-header-success card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">home</i>
	                  </div>
	                  <h4 style="padding: 9px;">Quản lý Nhà/phòng</h4>
	                </div>
	               </a>	
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 t" >
              <div class="card card-stats">
              	<a href="<c:url value="/manager-account" />">
	                <div class="card-header card-header-danger card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">account_circle</i>
	                  </div>
	                  <h4 style="padding: 10px;">Quản lý <br> Khách hàng</h4>
	                </div>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 t" style="margin-left: 20%;">
              <div class="card card-stats">
              	<a href="<c:url value="/manager-bookroom" />">
	                <div class="card-header card-header-primary card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">assignment_turned_in</i>
	                  </div>
	                 <h4 style="padding: 10px;">Quản lý <br> Đặt phòng</h4>
	                </div> 
	            </a>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 t">
              <div class="card card-stats">
              	<a href="<c:url value="/manager-review" />">
	                <div class="card-header card-header-info card-header-icon">
	                  <div class="card-icon">
	                    <i class="material-icons">library_books</i>
	                  </div>
	                 <h4 style="padding: 10px;">Quản lý <br> Bài đánh giá</h4>
	                </div> 
	             </a>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      
    </div>
  </div>
  
</body>

</html>