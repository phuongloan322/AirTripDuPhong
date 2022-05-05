<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="/asset/login/img/apple-icon.png">
    <link rel="icon" type="image/png" href="/asset/login/img/favicon.png">
    <title>
        Material Dashboard 2 by Creative Tim
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
    <style>
        input {
            width: 100% !important;
        }
    </style>
</head>

<body class="">
<div class="container position-sticky z-index-sticky top-0">
    <div class="row">
        <div class="col-12">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg blur border-radius-lg top-0 z-index-3 shadow position-absolute mt-4 py-2 start-0 end-0 mx-4">
                <div class="container-fluid ps-2 pe-0">
                    <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="../pages/dashboard.html">
                        <h4>AirTrip</h4>
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
                    <div class="col-xl-6 col-lg-5 col-md-7  d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
                        <div class="card card-plain">
                            <div class="card-header">
                            </div>
                            <div class="card-body">
                                <form class="form" method="post" action="/change-password">
                                    <div class="col-50">
                                        <h3>Thay đổi mật khẩu</h3><br>
                                        <div class="input-group input-group-outline mb-3">
                                            <label>Nhập mật khẩu mới</label><br>
                                            <input type="password" id="password" name="password" class="form-control">
                                        </div>
                                        <div class="input-group input-group-outline mb-3">
                                            <label>Nhập lại mật khẩu mới</label><br>
                                            <input type="password" id="passwordnew" name="passwordnew" class="form-control">
                                        </div>
                                    </div>
                                    <p style="color:darkred" id="error">${message}</p>
                                    <div class="text-center">
                                        <button onclick="return validate()" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0">Hoàn thành</button>
                                    </div>
                                </form>
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

    function validate() {
        let flag = true;
        const password = document.getElementById("password").value;
        const passwordnew = document.getElementById("passwordnew").value;
        if(password != passwordnew) {
            flag = false;
            document.getElementById("error").innerHTML = "Mật khẩu không trùng khớp!";
        } else if(password.length < 8) {
            flag = false;
            document.getElementById("error").innerHTML = "Mật khẩu phải ít nhất 8 ký tự!";
        }
        else {
            flag = true;
            document.getElementById("error").innerHTML = "";
        }
        return flag;
    }
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/asset/login/js/material-dashboard.min.js?v=3.0.2"></script>
</body>

</html>