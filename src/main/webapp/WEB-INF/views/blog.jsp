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
    <%@ include file="/WEB-INF/views/host/head3.jsp" %>
    <style>
        h5, h4, h3, h2 {
            text-transform: none !important;
            padding-bottom: 0 !important;
            font-weight: unset !important;
            color: #1b1e21 !important;
            font-size: 16px !important;
        }
    </style>
</head>
<body>
<!--==============================header=================================-->
<header>
    <div class="i-head">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo pull-left">
                    <div style="margin-top: 20px">
                        <a href="<c:url value="/index" />"><b class="head3" style="color: #ef4365; ">
                            <i class="fas fa-cannabis" style="margin-right: 10px;margin-top: 5px"></i>AirTrip</b>
                        </a>
                    </div>
                </div>

            </div >
            <div class="col-sm-6 pull-left">
                <form action="/places/page/1?" method="post" width="100%">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" name="search" value="${search}" class="search-query form-control" placeholder="Tìm kiếm nhà / phòng mong muốn..." />
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
    					<h1>
    						<a href="/places">
    							<img src="/asset/images/logo.png" alt="Your Happy Family">
    						</a>
    					</h1>
    				</div>
    			</div>
</header>
<!--==============================Content=================================-->
<div class="content" style="padding-bottom: 50px">

    <!-- Blog Start -->
    <div class="blog">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>From Blog</p>
                <h3>Trải nghiệm mới trong tuần này</h3>
            </div>
            <div class="row blog-page">


                <c:forEach var="i" items="${blogs }" varStatus="loop">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                        <div class="blog-item">
                            <div class="blog-img">
                                <img src="/asset/images/${i.image}" alt="Blog" class="setanh43">
                            </div>
                            <div class="blog-text sethis">
                                <a href="/show-blog/${i.blogId}">
                                    <p class="title">${i.title}</p>
                                </a>
                                <div class="blog-meta">
                                    <p><i class="far fa-list-alt"></i>${i.account.name}</p>
                                    <p><i class="far fa-calendar-alt"></i>${i.createDate.split(" ")[0].split("-")[2] } - ${i.createDate.split(" ")[0].split("-")[1] } - ${i.createDate.split(" ")[0].split("-")[0] }</p>
                                    <p><i class="far fa-comments"></i>5</p>
                                </div>
                                <div class="textoverflow3 settielws">
                                    ${i.content}
                                </div>
                                <a class="btn" href="/show-blog/${i.blogId}" style="    position: absolute;bottom: 20px;">Xem thêm <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
    </div>
    <!-- Blog End -->

</div>

    <%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
</body>
</html>