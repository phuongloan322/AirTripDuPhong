<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>AirTrip</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
		<%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<script>
			$(document).ready(function(){
			jQuery('#camera_wrap').camera({
				loader: false,
				pagination: false ,
				minHeight: '444',
				thumbnails: false,
				height: '48.375%',
				caption: true,
				navigation: true,
				fx: 'mosaic'
			});
			/*carousel*/
			var owl=$("#owl");
				owl.owlCarousel({
				items : 2, //10 items above 1000px browser width
				itemsDesktop : [995,2], //5 items between 1000px and 901px
				itemsDesktopSmall : [767, 2], // betweem 900px and 601px
				itemsTablet: [700, 2], //2 items between 600 and 0
				itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
				navigation : true,
				pagination : false
				});
			$().UItoTop({ easingType: 'easeOutQuart' });
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
							<a href="<c:url value="/index" />"><b class="head3">AirPay</b></a>
						</div>
						
					</div >
					<div class="col-sm-5 pull-left">
						<form action="<c:url value="/places" />" method="post" width="100%">
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
								<li><a href="<c:url value="/become-a-host" />" class="i-chu">Trở thành chủ nhà</a></li>
									<c:if test="${accLogin != null }">
										<li class="dropdown"><a class="i-chu"><i class="fa fa-user"></i>${accLogin.name }<i class="fa fa-angle-down"></i></a>
	                                    	<ul role="menu" class="sub-menu">
	                                    		<li><a href="<c:url value="/manager-account" />">Thông tin cá nhân</a></li>
	                                    		<li><a href="<c:url value="/loveplace" />">Danh sách Yêu thích</a></li>
	                                    		<li><a href="<c:url value="/bookroom" />">Nhà / phòng đã đặt</a></li>
	                                    		<hr>
	                                    		<li><a href="<c:url value="/become-a-host/index" />">Chế độ chủ nhà</a></li>
		                                        <li><a href="<c:url value="/logout" />">Đăng xuất</a></li>
		                                    </ul>
		                                </li>
	                                </c:if> 
									<c:if test="${accLogin == null }">
										<li><a href="<c:url value="/login" />" class="i-chu"><i class="fa fa-lock"></i> Đăng nhập</a></li>
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
								<li><a href="<c:url value="/index" />">TRANG CHỦ</a></li>
								<li class="current"><a href="<c:url value="/places" />">KHÁM PHÁ</a></li>
								<li><a href="<c:url value="/bookroom" />">CHUYẾN ĐI</a></li>
								<li><a href="<c:url value="/index" />">BLOG</a></li>
								<li><a href="<c:url value="/index" />">LIÊN HỆ</a></li>
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
						<div class="title1" style="font-size: 40px;	font-weight: 600;	letter-spacing: -0.02em;	line-height: 36px;">
						Bạn chưa biết nên đi đâu?<br><br> Tuyệt!</div>
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
		<div class="content">
		<div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
			<div class="container_12">
				<div class="grid_4">
					<div class="banner">
						<img src="asset/images/ban_img1.jpg" alt="">
						<div class="label">
							<div class="title">Barcelona</div>
							<div class="price">FROM<span>$ 1000</span></div>
							<a href="<c:url value="/detailplace/2" />">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="asset/images/ban_img2.jpg" alt="">
						<div class="label">
							<div class="title">GOA</div>
							<div class="price">FROM<span>$ 1.500</span></div>
							<a href="<c:url value="/detailplace/5" />">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="asset/images/ban_img3.jpg" alt="">
						<div class="label">
							<div class="title">PARIS</div>
							<div class="price">FROM<span>$ 1.600</span></div>
							<a href="<c:url value="/detailplace/8" />">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="grid_6">
					
				</div>
				<div class="grid_5 prefix_1">
					<h3>Welcome</h3>
					<img src="asset/images/page1_img1.jpg" alt="" class="img_inner fleft">
					<div class="extra_wrapper">
						<p>Lorem ipsum dolor sit ere amet, consectetur ipiscin.</p>
						In mollis erat mattis neque facilisis, sit ametiol
					</div>
					<div class="clear cl1"></div>
					<p>Find the detailed description of this <span class="col1"><a href="http://blog.templatemonster.com/free-website-templates/" rel="dofollow">freebie</a></span> at TemplateMonster blog.</p>
					<p><span class="col1"><a href="http://www.templatemonster.com/category/travel-website-templates/" rel="nofollow">Travel Website Templates</a></span> category offers you a variety of designs that are perfect for travel sphere of business.</p>
					Proin pharetra luctus diam, a scelerisque eros convallis
					<h4>Clients’ Quotes</h4>
					<blockquote class="bq1">
						<img src="asset/images/page1_img2.jpg" alt="" class="img_inner noresize fleft">
						<div class="extra_wrapper">
							<p>Duis massa elit, auctor non pellentesque vel, aliquet sit amet erat. Nullam eget dignissim nisi, aliquam feugiat nibh. </p>
							<div class="alright">
								<div class="col1">Miranda Brown</div>
								<a href="#" class="btn">More</a>
							</div>
						</div>
					</blockquote>
				</div>
				
			</div>
		</div>
<!--==============================footer=================================-->
	<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
	</body>
</html>

