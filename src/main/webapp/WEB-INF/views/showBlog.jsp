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
                    <div style="margin-top: 10px">
                        <a href="<c:url value="/index" />"><b class="head3" style="color: #ef4365; ">
                            <i class="fas fa-cannabis" style="margin-right: 10px;margin-top: -5px"></i>AirTrip</b>
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
                                    <button class="btn btn-danger" type="button" style="margin-top: 10px;">
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
</header>


<!-- Single Post Start-->
<div class="single">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-content wow fadeInUp">
                    <img src="/asset/images/${blog.image}" />
                    <h2>${blog.title}</h2>
                    <div>${blog.content}</div>
                </div>
<%--                <div class="single-tags wow fadeInUp">--%>
<%--                    <a href="">National</a>--%>
<%--                    <a href="">International</a>--%>
<%--                    <a href="">Economics</a>--%>
<%--                    <a href="">Politics</a>--%>
<%--                    <a href="">Lifestyle</a>--%>
<%--                    <a href="">Technology</a>--%>
<%--                    <a href="">Trades</a>--%>
<%--                </div>--%>
                <div class="single-bio wow fadeInUp">
                    <div class="single-bio-img">
                        <a href="/detail-account/${blog.account.accountId}">
                            <img src="/asset/images/${blog.account.image}" class="image-blog"/>
                        </a>
                    </div>
                    <div class="single-bio-text" style="padding-left: 0px !important;">
                        <a href="/detail-account/${blog.account.accountId}"><h3>${blog.account.name}</h3></a>
                        <p>Bắt đầu tham gia vào tháng ${blog.account.createDate.split("-")[1]} năm ${blog.account.createDate.split("-")[0]}</p>
                    </div>
                </div>
                <div class="single-related wow fadeInUp">
<%--                    <h2>Related Post</h2>--%>
<%--                    <div class="owl-carousel related-slider">--%>
<%--                        <div class="post-item">--%>
<%--                            <div class="post-img">--%>
<%--                                <img src="/asset/images/i11.jpg" />--%>
<%--                            </div>--%>
<%--                            <div class="post-text">--%>
<%--                                <a href="">Lorem ipsum dolor sit amet consec adipis elit</a>--%>
<%--                                <div class="post-meta">--%>
<%--                                    <p>By<a href="">Admin</a></p>--%>
<%--                                    <p>In<a href="">Design</a></p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="post-item">--%>
<%--                            <div class="post-img">--%>
<%--                                <img src="/asset/images/i12.jpg" />--%>
<%--                            </div>--%>
<%--                            <div class="post-text">--%>
<%--                                <a href="">Lorem ipsum dolor sit amet consec adipis elit</a>--%>
<%--                                <div class="post-meta">--%>
<%--                                    <p>By<a href="">Admin</a></p>--%>
<%--                                    <p>In<a href="">Design</a></p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="post-item">--%>
<%--                            <div class="post-img">--%>
<%--                                <img src="/asset/images/i13.jpg" />--%>
<%--                            </div>--%>
<%--                            <div class="post-text">--%>
<%--                                <a href="">Lorem ipsum dolor sit amet consec adipis elit</a>--%>
<%--                                <div class="post-meta">--%>
<%--                                    <p>By<a href="">Admin</a></p>--%>
<%--                                    <p>In<a href="">Design</a></p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="post-item">--%>
<%--                            <div class="post-img">--%>
<%--                                <img src="/asset/images/i14.jpg" />--%>
<%--                            </div>--%>
<%--                            <div class="post-text">--%>
<%--                                <a href="">Lorem ipsum dolor sit amet consec adipis elit</a>--%>
<%--                                <div class="post-meta">--%>
<%--                                    <p>By<a href="">Admin</a></p>--%>
<%--                                    <p>In<a href="">Design</a></p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>

<%--                <div class="single-comment wow fadeInUp">--%>
<%--                    <h2>3 Comments</h2>--%>
<%--                    <ul class="comment-list">--%>
<%--                        <li class="comment-item">--%>
<%--                            <div class="comment-body">--%>
<%--                                <div class="comment-img">--%>
<%--                                    <img src="/asset/images/i11.jpg" />--%>
<%--                                </div>--%>
<%--                                <div class="comment-text">--%>
<%--                                    <h3><a href="">Josh Dunn</a></h3>--%>
<%--                                    <span>01 Jan 2045 at 12:00pm</span>--%>
<%--                                    <p>--%>
<%--                                        Lorem ipsum dolor sit amet elit. Integer lorem augue purus mollis sapien, non eros leo in nunc. Donec a nulla vel turpis tempor ac vel justo. In hac platea dictumst.--%>
<%--                                    </p>--%>
<%--                                    <a class="btn" href="">Reply</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="comment-item">--%>
<%--                            <div class="comment-body">--%>
<%--                                <div class="comment-img">--%>
<%--                                    <img src="/asset/images/i11.jpg" />--%>
<%--                                </div>--%>
<%--                                <div class="comment-text">--%>
<%--                                    <h3><a href="">Josh Dunn</a></h3>--%>
<%--                                    <p><span>01 Jan 2045 at 12:00pm</span></p>--%>
<%--                                    <p>--%>
<%--                                        Lorem ipsum dolor sit amet elit. Integer lorem augue purus mollis sapien, non eros leo in nunc. Donec a nulla vel turpis tempor ac vel justo. In hac platea dictumst.--%>
<%--                                    </p>--%>
<%--                                    <a class="btn" href="">Reply</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <ul class="comment-child">--%>
<%--                                <li class="comment-item">--%>
<%--                                    <div class="comment-body">--%>
<%--                                        <div class="comment-img">--%>
<%--                                            <img src="/asset/images/i11.jpg" />--%>
<%--                                        </div>--%>
<%--                                        <div class="comment-text">--%>
<%--                                            <h3><a href="">Josh Dunn</a></h3>--%>
<%--                                            <p><span>01 Jan 2045 at 12:00pm</span></p>--%>
<%--                                            <p>--%>
<%--                                                Lorem ipsum dolor sit amet elit. Integer lorem augue purus mollis sapien, non eros leo in nunc. Donec a nulla vel turpis tempor ac vel justo. In hac platea dictumst.--%>
<%--                                            </p>--%>
<%--                                            <a class="btn" href="">Reply</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

            </div>

            <div class="col-lg-4">
                <div class="sidebar">
                    <div class="sidebar-widget wow fadeInUp">
                        <div class="search-widget">
                            <form>
                                <input class="form-control" type="text" placeholder="Search Keyword">
                                <button class="btn"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>

                    <div class="sidebar-widget wow fadeInUp">
                        <h2 class="widget-title">Bài đăng mới</h2>
                        <div class="recent-post">

                            <c:forEach var="i" items="${blogsNew }" varStatus="loop">
                                <c:if test="${loop.index < 5}">
                                    <div class="post-item">
                                        <div class="post-img">
                                            <img src="/asset/images/${i.image}" />
                                        </div>
                                        <div class="post-text">
                                            <a href="">${i.title}</a>
                                            <div class="post-meta">
                                                <p>By<a href="/detail-account/${i.account.accountId}">${i.account.name}</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="sidebar-widget wow fadeInUp">
                        <div class="image-widget">
                            <a href="#"><img src="/asset/images/n3.jpg" width="100%" alt="Image"></a>
                        </div>
                    </div>

                    <div class="sidebar-widget wow fadeInUp">
                        <div class="tab-post">
                            <ul class="nav nav-pills nav-justified">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#featured">Featured</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#popular">Popular</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#latest">Latest</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div id="featured" class="container tab-pane active">
                                    <c:forEach var="i" items="${blogsNew }" varStatus="loop">
                                        <c:if test="${loop.index < 3}">
                                            <div class="post-item">
                                                <div class="post-img">
                                                    <img src="/asset/images/${i.image}" />
                                                </div>
                                                <div class="post-text">
                                                    <a href="">${i.title}</a>
                                                    <div class="post-meta">
                                                        <p>By<a href="/detail-account/${i.account.accountId}">${i.account.name}</a></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div id="popular" class="container tab-pane fade">
                                    <c:forEach var="i" items="${blogsNew }" varStatus="loop">
                                        <c:if test="${loop.index >= 3 and loop.index < 6}">
                                            <div class="post-item">
                                                <div class="post-img">
                                                    <img src="/asset/images/${i.image}" />
                                                </div>
                                                <div class="post-text">
                                                    <a href="">${i.title}</a>
                                                    <div class="post-meta">
                                                        <p>By<a href="/detail-account/${i.account.accountId}">${i.account.name}</a></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div id="latest" class="container tab-pane fade">
                                    <c:forEach var="i" items="${blogs }" varStatus="loop">
                                        <c:if test="${loop.index < 3}">
                                            <div class="post-item">
                                                <div class="post-img">
                                                    <img src="/asset/images/${i.image}" />
                                                </div>
                                                <div class="post-text">
                                                    <a href="">${i.title}</a>
                                                    <div class="post-meta">
                                                        <p>By<a href="/detail-account/${i.account.accountId}">${i.account.name}</a></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="sidebar-widget wow fadeInUp">
                        <div class="image-widget">
                            <a href="#"><img src="/asset/images/n7.jpg" width="100%" alt="Image"></a>
                        </div>
                    </div>

                    <div class="sidebar-widget wow fadeInUp">
                        <div class="image-widget">
                            <img src="/asset/images/n5.jpg" width="100%" alt="Image">
                        </div>
                    </div>

<%--                    <div class="sidebar-widget wow fadeInUp">--%>
<%--                        <h2 class="widget-title">Tags Cloud</h2>--%>
<%--                        <div class="tag-widget">--%>
<%--                            <a href="">National</a>--%>
<%--                            <a href="">International</a>--%>
<%--                            <a href="">Economics</a>--%>
<%--                            <a href="">Politics</a>--%>
<%--                            <a href="">Lifestyle</a>--%>
<%--                            <a href="">Technology</a>--%>
<%--                            <a href="">Trades</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="sidebar-widget wow fadeInUp">
                        <h2 class="widget-title">Text Widget</h2>
                        <div class="text-widget">
                            <p>
                                Lorem ipsum dolor sit amet elit. Integer lorem augue purus mollis sapien, non eros leo in nunc. Donec a nulla vel turpis tempor ac vel justo. In hac platea nec eros. Nunc eu enim non turpis id augue.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Single Post End-->


<!-- Footer Start -->

<!-- Footer End -->

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
</body>
</html>
