<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="/asset/login/img/apple-icon.png">
    <link rel="icon" type="image/png" href="/asset/login/img/favicon.png">
    <title>
        AirTrip | Thanh Toán
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
                    <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="/bookroom">
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
                    <div class="col-5 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 justify-content-center flex-column">
                        <div class="position-relative border h-100 m-3 px-5 border-radius-lg d-flex flex-column justify-content-center" style="background-color: aliceblue">
                            <div class="row" style="margin-top: 30px">
                                <div class="col-5">
                                    <img src="/asset/images/${bookPayment.place.images[0].name}" width="200px" style="border-radius: 15px">
                                </div>
                                <div class="col-7 ml-2 text-left">
                                    <h5>${bookPayment.place.name}</h5>
                                    <p>${bookPayment.place.address}</p>
                                    <p><b>$${bookPayment.place.price}</b>/đêm</p>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 20px">
                                <div class="col-1"></div>
                                <div class="col-4">
                                    <p>Ngày nhận phòng : </p>
                                    <p>Ngày trả phòng :</p>
                                    <p>Tổng số người :</p>
                                </div>
                                <div class="col-5 ml-2 text-left">
                                    <p>${bookPayment.startDay}</p>
                                    <p>${bookPayment.endDay}</p>
                                    <p>${bookPayment.people} người</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row" style="margin-top: 20px">
                                <div class="col-1"></div>
                                <div class="col-4">
                                    <p>Tiền thanh toán : </p>
                                    <p>Phí dịch vụ :</p>
                                    <p>Phí vệ sinh :</p>
                                    <p><b>Tổng thanh toán:</b></p>
                                </div>
                                <div class="col-5 ml-2 text-left">
                                    <p>
                                        $ <fmt:formatNumber type="number" groupingUsed="true" value="${bookPayment.totalPrice }" />
                                    </p>
                                    <p>$ 5</p>
                                    <p>$ 5</p>
                                    <p><b>
                                        $ <fmt:formatNumber type="number" groupingUsed="true" value="${bookPayment.totalPrice + 10 }" />
                                    </b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
                        <div class="card card-plain">
                            <div class="card-body"><br>
                                <form class="form" method="post" action="/pay">
                                    <div class="col-50">
                                        <h3>Thanh toán</h3>
                                        <label>Accepted Cards</label>
                                        <div class="icon-container">
                                            <i class="fa fa-cc-visa" style="color:navy;"></i>
                                            <i class="fa fa-cc-amex" style="color:blue;"></i>
                                            <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                            <i class="fa fa-cc-discover" style="color:orange;"></i>
                                        </div>
                                        <div class="input-group input-group-outline mb-3">
                                            <label>Total</label><br>
                                            <input type="text" id="price" name="price" value="${bookPayment.totalPrice + 10}" class="form-control">
                                        </div>
                                        <div class="input-group input-group-outline mb-3">
                                            <label>Currency</label><br>
                                            <input type="text" id="currency" name="currency"  class="form-control" value="USD">
                                        </div>
                                        <div class="input-group input-group-outline mb-3" >
                                            <label>Intent</label><br>
                                            <input type="text" id="intent" name="intent" value="sale" class="form-control">
                                        </div>
                                        <div class="input-group input-group-outline mb-3">
                                            <label>Payment Description</label><br>
                                            <input type="text" id="description" name="description" class="form-control">
                                        </div>

                                        <input type="text" id="method" name="method" placeholder="Payment Method" value="paypal" hidden>
                                    </div>
                                    <div class="text-center" style="margin-top: 50px">
                                        <button type="submit" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0">Thanh toán</button>
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
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/asset/login/js/material-dashboard.min.js?v=3.0.2"></script>
</body>

</html>