<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>AirPay</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">

    <!-- Favicon -->
    <link href="<c:url value="/asset/host/img/favicon.ico" />" rel="icon">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="<c:url value="/asset/host/lib/animate/animate.min.css" />" rel="stylesheet">
    <link href="<c:url value="/asset/host/lib/flaticon/font/flaticon.css" />" rel="stylesheet">
    <link href="<c:url value="/asset/host/lib/owlcarousel/assets/owl.carousel.min.css" />" rel="stylesheet">
    <link href="<c:url value="/asset/host/lib/lightbox/css/lightbox.min.css" />" rel="stylesheet">
    <link href="<c:url value="/asset/host/css/style.css" />" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<%@ include file="/WEB-INF/views/host/header3.jsp" %>
<!-- Page Header Start -->
<div class="page-header">
</div>
<!-- Page Header End -->


<!-- About Start -->
<div class="about wow fadeInUp" data-wow-delay="0.1s">
    <div class="container">
        <h4><b><a href="/become-a-host/index"><i class="fas fa-angle-left"></i></a> Quản lý Blog</b></h4>
        <br>

        <div class="row">
            <div class="col-2 float-lg-right">
                <a href="/become-a-host/blog/add" class="btn" style="background: #F7CAC9"><i class="fas fa-plus"></i> Tạo blog</a>
            </div>
        </div>

        <br>
        <br>
        <div class="table-responsive cart_info" >
            <c:choose>
                <c:when test="${blogs.size() > 0}">
                    <c:forEach var="i" items="${blogs}" >
                        <div class="row" style="margin: 30px 0; border-bottom: 1px solid #f0f0f0; padding-bottom: 30px">
                            <div class="col-4">
                                <c:if test="${i.image != \"\"}">
                                    <img src="/asset/images/${i.image}" width="400px" height="300px" style="border-radius: 10px">
                                </c:if>
                                <c:if test="${i.image == \"\"}">
                                    <img src="/asset/images/i1.jpg" width="400px" height="300px" style="border-radius: 10px">
                                </c:if>
                            </div>
                            <div class="col-1"></div>
                            <div class="col-7">
                                <h4><b>${i.title}</b></h4>
                                <p>
                                        ${i.createDate.split(" ")[1].substring(0, 5) } ${i.createDate.split(" ")[0].split("-")[2] } - ${i.createDate.split(" ")[0].split("-")[1] } - ${i.createDate.split(" ")[0].split("-")[0] }
                                </p>
                                <div class="textoverflow3">
                                    ${i.content}
                                </div>
                                <div style="position: absolute; bottom: 0">
                                    <a href="/become-a-host/blog/edit/${i.blogId}" class="btn blog-edit">Chỉnh sửa</a>
                                    <a href="/become-a-host/blog/delete/${i.blogId}" class="btn btn-light border delete-blog">Xoá</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="thongbao">
                        <h5>Bạn chưa có bài đăng nào...</h5>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title">Xác nhận xoá</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xoá bài viết này không?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Đóng</button>
                <a class="btn btn-secondary" id="confirmDeleteButton" href="">Xoá nhà</a>
            </div>
        </div>
    </div>
</div>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script>

    $('.delete-blog').on('click', function(e) {
        e.preventDefault();
        var href = $(this).attr('href');
        console.log(href);
        $('#confirmDeleteButton').attr('href', href);
        $('#deleteModal').modal();
    });

</script>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
</body>
</html>
