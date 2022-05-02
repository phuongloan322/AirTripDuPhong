<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hot Tours</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
    <%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
    <%@ include file="/WEB-INF/views/layouts/header.jsp" %>
    <script>$(document).ready(function(){
        $().UItoTop({ easingType: 'easeOutQuart' });
    });
    </script>

</head>
<body>
<!--==============================header=================================-->
<header>
    <div class="i-head">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo pull-left">
                    <a href="/index" />"><b class="head3">AirPay</b></a>
                </div>

            </div >
            <div class="col-sm-5 pull-left">
                <form action="/places/pagination/1" method="post" width="100%">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" name="search" class="search-query form-control" placeholder="Tìm kiếm nhà / phòng mong muốn..." />
                            <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-4">
                <div class="shop-menu pull-right">
                    <ul class="nav navbar-nav">
                        <li><a href="/become-a-host" class="i-chu">Trở thành chủ nhà</a></li>
                        <c:if test="${accLogin != null }">
                            <li class="dropdown"><a class="i-chu"><i class="fa fa-user"></i>${accLogin.name }<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager-account">Thông tin cá nhân</a></li>
                                    <li><a href="/loveplace">Danh sách Yêu thích</a></li>
                                    <li><a href="/bookroom">Nhà / phòng đã đặt</a></li>
                                    <hr>
                                    <li><a href="/become-a-host/index">Chế độ chủ nhà</a></li>
                                    <li><a href="/logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${accLogin == null }">
                            <li><a href="/login" class="i-chu"><i class="fa fa-lock"></i> Đăng nhập</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container_12">
        <div class="grid_12">
            <div class="menu_block">
                <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                    <ul class="sf-menu">
                        <li><a href="/index">TRANG CHỦ</a></li>
                        <li class="current"><a href="/places">KHÁM PHÁ</a></li>
                        <li><a href="/bookroom">CHUYẾN ĐI</a></li>
                        <li><a href="/index">BLOG</a></li>
                        <li><a href="/index">LIÊN HỆ</a></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
        </div>
        <div class="grid_12">
            <h1>
                <a href="/places">
                    <img src="/asset/images/logo.png" alt="Your Happy Family">
                </a>
            </h1>
        </div>
    </div>
</header>
<!--==============================Content=================================-->
<div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
    <div class="">
        <br>
        <c:if test="${categoryList.size() > 0 }">
            <ul class="category"class="category">
                <c:forEach var="item" items="${categoryList }">
                    <a href="/places/${item.categoryId }"><li >${item.name }</li></a>
                </c:forEach>
                <a href="/places/"><li >Tất cả</li></a>
            </ul>

        </c:if>

        <div style="display: none">
            <c:forEach var="item" items="${listPost }" varStatus="loop">
                <div class="item">
                    <p class="image">${item.images[0].name}</p>
                    <p class="placeId">${item.placeId }</p>
                    <p class="title">${item.name }</p>
                    <p class="price">$ ${item.price } / đêm</p>
                    <p class="address">${item.address }</p>
                </div>
            </c:forEach>
        </div>
    </div>
    <div id="map" style="width: 100%; height: 900px"></div>
</div>
<!--==============================footer=================================-->

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"
        defer
></script>
<script src="/asset/map/showmap.js" ></script>

<script>
    jQuery('.con1 a').click(function(evt) {
        evt.preventDefault();

        var placeId = jQuery(this).attr("data-id");
        var item = 'item-'+placeId;

        $.ajax({
            type : "GET",
            contentType : "application/json",
            url : "/AddLovePlace",
            data : {
                placeId : placeId,
            },
            timeout : 2000,
            success : function(data) {
                console.log("SUCCESS: ");
                if(document.getElementById(item).style.color == "red")
                    document.getElementById(item).style.color = "white";
                else document.getElementById(item).style.color = "red";
            },
            error : function(e) {
                console.log("ERROR: ", e);
            }
        });

    });
</script>

</body>
</html>