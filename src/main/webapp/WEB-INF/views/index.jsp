<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #fff">
<head>
    <title>AirTrip</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
    <%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
    <%@ include file="/WEB-INF/views/layouts/header.jsp" %>
    <script>
        $(document).ready(function () {
            jQuery('#camera_wrap').camera({
                loader: false,
                pagination: false,
                minHeight: '444',
                thumbnails: false,
                height: '48.375%',
                caption: true,
                navigation: true,
                fx: 'mosaic'
            });
            /*carousel*/
            var owl = $("#owl");
            owl.owlCarousel({
                items: 2, //10 items above 1000px browser width
                itemsDesktop: [995, 2], //5 items between 1000px and 901px
                itemsDesktopSmall: [767, 2], // betweem 900px and 601px
                itemsTablet: [700, 2], //2 items between 600 and 0
                itemsMobile: [479, 1], // itemsMobile disabled - inherit from itemsTablet option
                navigation: true,
                pagination: false
            });
            $().UItoTop({easingType: 'easeOutQuart'});
        });
    </script>
</head>
<body class="page1" id="top">
<!--==============================header=================================-->

<header>
    <div class="i-head">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo pull-left">

                        <div style="margin-top: 30px">
                            <a href="<c:url value="/index" />"><b class="head3" style="color: #fff; ">
                                <i class="fas fa-cannabis" style="margin-right: 10px;margin-top: -5px"></i>AirTrip</b>
                            </a>
                        </div>

                </div>

            </div>
            <div class="col-sm-6 pull-left">
                <form action="/places/page/1" method="post" width="100%">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" name="search" value="${search}" class="search-query form-control" placeholder="T??m ki???m nh?? / ph??ng mong mu???n..." />
                            <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                        </div>
                    </div>
                </form>
            </div>
            <%@ include file="/WEB-INF/views/layouts/menu.jsp" %>
        </div>
    </div>

    <div class="container_12">
        <div class="grid_12">
            <div class="menu_block">
                <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                    <ul class="sf-menu">
                        <li class="current"><a href="<c:url value="/index" />">TRANG CH???</a></li>
                        <li ><a href="<c:url value="/places" />">KH??M PH??</a></li>
                        <li><a href="<c:url value="/bookroom" />">CHUY???N ??I</a></li>
                        <li><a href="<c:url value="/blog" />">BLOG</a></li>
                        <li><a href="<c:url value="/index" />">LI??N H???</a></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </div>
        </div>
        <div class="grid_12">
            <h1>
                <a href="<c:url value="/index" />">
                    <img src="asset/images/logo.png" alt="Your Happy Family">
                </a>
            </h1>
        </div>
    </div>
</header>
<div class="slider_wrapper">
    <div id="camera_wrap" class="">
        <div data-src="asset/images/anh2.jpg">
            <div class="caption fadeIn">
                <div class="title1"
                     style="font-size: 40px;	font-weight: 600;	letter-spacing: -0.02em;	line-height: 36px;">
                    B???n ch??a bi???t n??n ??i ????u?<br><br> Tuy???t!
                </div>
                <a href="<c:url value="/places" />">LEARN MORE</a>
            </div>
        </div>
        <div data-src="asset/images/slide1.jpg">
            <div class="caption fadeIn">
                <h2>Maldives</h2>
                <div class="price">
                    FROM
                    <span>$2000</span>
                </div>
                <a href="<c:url value="/places" />">LEARN MORE</a>
            </div>
        </div>
        <div data-src="asset/images/slide2.jpg">
            <div class="caption fadeIn">
                <h2>Venice</h2>
                <div class="price">
                    FROM
                    <span>$1600</span>
                </div>
                <a href="<c:url value="/places" />">LEARN MORE</a>
            </div>
        </div>
    </div>
</div>
<!--==============================Content=================================-->
<div class="content" style="background-color: #fff">
    <div class="container_12">
        <div class="wow fadeInUp" data-wow-delay="0.4s">
        <div class="grid_4">
            <div class="banner">
                <img src="asset/images/ban_img1.jpg" alt="">
                <div class="label">
                    <div class="title">H?? N???I</div>
                    <div class="price">FROM<span>$ 200</span></div>
                    <a href="/places/page/1?search=H?? N???i">LEARN MORE</a>
                </div>
            </div>
        </div>
        </div>
        <div class="wow fadeInUp" data-wow-delay="0.4s">
        <div class="grid_4">
            <div class="banner">
                <img src="asset/images/ban_img2.jpg" alt="">
                <div class="label">
                    <div class="title">???? N???NG</div>
                    <div class="price">FROM<span>$ 100</span></div>
                    <a href="/places/page/1?search=???? N???ng">LEARN MORE</a>
                </div>
            </div>
        </div>
        </div>
        <div class="wow fadeInUp" data-wow-delay="0.4s">
        <div class="grid_4">
            <div class="banner">
                <img src="asset/images/ban_img3.jpg" alt="">
                <div class="label">
                    <div class="title">H??? CH?? MINH</div>
                    <div class="price">FROM<span>$ 250</span></div>
                    <a href="/places/page/1?search=H??? Ch?? Minh">LEARN MORE</a>
                </div>
            </div>
        </div>
        </div>
        <div class="clear"></div>
    </div>

	<div style="margin: 50px; margin-bottom: 100px; height: 2200px">
		<p class="oans">C???m h???ng cho chuy???n ??i ti???p theo c???a b???n</p>
        <div class="wow fadeInUp" data-wow-delay="0.4s">
		<div class="ihihk">
			<a href="/places/page/1?search=H???i Ph??ng">
                <div class="setw-25">
                    <img src="/asset/images/b1.jpg" width="100%" class="suahs">
                    <div class="idna1">
                        <p class="a">H???i Ph??ng</p>
                        <p class="aihdi">C??ch 756 km</p>
                    </div>
                </div>
            </a>
            <a href="/places/page/1?search=Hu???">
			<div class="setw-25">
                <img src="/asset/images/b2.jpg" width="100%" class="suahs">
                <div class="idna2">
                    <p class="a">Hu???</p>
                    <p class="aihdi">C??ch 5 km</p>
                </div>
			</div>
            </a>
            <a href="/places/page/1?search=Nha Trang">
			<div class="setw-25">
                <img src="/asset/images/b3.jpg" width="100%" class="suahs">
                <div class="idna3">
                    <p class="a">Nha Trang</p>
                    <p class="aihdi">C??ch 874 km</p>
                </div>
			</div>
            </a>
            <a href="/places/page/1?search=C???n Th??">
			<div class="setw-25">
                <img src="/asset/images/b4.jpg" width="100%" class="suahs">
                <div class="idna4">
                    <p class="a">C???n Th??</p>
                    <p class="aihdi">C??ch 1274 km</p>
                </div>
			</div>
            </a>
		</div>
        </div>

        <p class="oans" style="padding-top: 500px;">Kh??m ph?? tr???i nghi???m AirTrip</p>
        <div class="ihihk">
            <div class="setw-50">
                <img src="/asset/images/nen2.jpg" width="100%" height="800px" style="border-radius: 15px;">
                <div class="pdwjod">
                    <p class="asihd">Nh???ng ??i???u n??n tr???i nghi???m trong chuy???n ??i c???a b???n</p>
                    <a class="dadww">Tr???i nghi???m</a>
                </div>
            </div>
            <div class="setw-50">
                <img src="/asset/images/nen4.jpg" width="100%" height="800px" style="border-radius: 15px;">
                <div class="pdwjod">
                    <p class="asihd">Nh???ng ??i???u tr???i nghi???m khi du l???ch</p>
                    <a class="dadww">Tr???i nghi???m tr???c tuy???n</a>
                </div>
            </div>
        </div>
        <div class="ihihk" >
            <div class="setw-100" style="position: relative">
                <img src="/asset/images/nen5.jpg" width="100%" height="800px" style="border-radius: 15px;">
                <div class="pdwjod" style="margin-top: 1000px;">
                    <p class="asihd">B???n c?? th???cc m???c v??? vi???c ????n ti???p kh??ch</p>
                    <a href="/chat" class="dadww">Li??n h??? v???i ch??ng t??i</a>
                </div>
            </div>
        </div>
	</div>



</div>
<br>
<br>


<!--==============================footer=================================-->
	<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
</body>
</html>

