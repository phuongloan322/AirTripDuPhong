<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" style="background-color: #fff">

<head>
    <meta charset="utf-8"/>
    <title>${place.name }</title>
    <%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    </style>
    <%--	  RTE--%>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/asset/richtextediter/richtext.min.css">
    <style>
        .richText .richText-editor {
            height: 500px;
        }
    </style>
</head>

<body class="light-edition">
<div class="wrapper ">
    <%@ include file="/WEB-INF/views/admin/layout/sidebar.jsp" %>
    <div class="main-panel" style="background: white !important;">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top "
             id="navigation-example" style="background-color: darkslategrey !important;color:#fff">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="<c:url value="/admin/manager-blog" />">
                        <i class="fas fa-angle-left"></i>QUẢN LÝ BLOG</a>
                </div>
                <div class="collapse navbar-collapse justify-content-end">
                    <%@ include file="/WEB-INF/views/admin/layout/nav-link.jsp" %>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content setw" style="background-color: #fff">
            <%@ include file="/WEB-INF/views/admin/layout/message.jsp" %>
            <div class="table-responsive cart_info" >
                <div class="border">
                    <form action="/admin/manager-blog/edit" style="margin: 50px 100px" method="post" enctype="multipart/form-data">
                        <h4><b style="font-weight: 700">Chỉnh sửa bài Blog</b></h4><br>
<%--                        <p style="color: green; font-weight: 500">${msg}</p>--%>
                        <%--                    <div class="form-group">--%>
                        <%--                        <label>Tài khoản<label>--%>
                        <input class="form-control" name="blogId" id="blogId" style="height: 50px" value="${blog.blogId}" hidden>
                        <%--                        <p class="text-danger" id="err-account"></p>--%>
                        <%--                    </div>--%>
                        <div class="form-group">
                            <label>Tiêu đề</label>
                            <input class="form-control" name="title" value="${blog.title}" id="title" style="height: 50px">
                            <p class="text-danger" id="err-title"></p>
                        </div>
                        <div class="form-group">
                            <label>Nội dung bài blog</label><br>
                            <textarea class="form-control" name="content" id="content">${blog.content}</textarea>
                            <p class="text-danger" id="err-content"></p>
                        </div>
                        <div class="form-group">
                            <label>Tác giả</label><br>
                            <input class="form-control" name="account" id="account" value="${blog.account.name}" readonly style="height: 50px; background-color: #fff">
                            <p class="text-danger" id="err-account"></p>
                        </div>
                        <br>

                            <label>Ảnh nền bài viết</label><br>

                            <img id="imgSrc" class="anhdaidien borderavt" width="300px" height="200px"
                                 src="/asset/images/${blog.image}" style="margin-bottom: 30px;"/><br>
                        <input type="file" name="image" id="imgUpload" accept="image/*"
                               title="Click để thay đổi hình ảnh!" /><br>
                            <p class="text-danger" id="err-imgUpload"></p>

                        <div>
                            <button onclick="return validate()" class="btn btn-primary float-lg-right">Cập nhật bài viết</button>
                        </div>
                        <br>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="/asset/richtextediter/jquery.richtext.js"></script>
<script src="/asset/richtextediter/jquery.richtext.min.js"></script>

<script>
    $('#content').richText();

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgSrc').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgUpload").change(function () {
        readURL(this);
        $("#imgSrc").show();
    });

    function getValue(id) {
        return document.getElementById(id).value.trim();
    }
    function showError(key, mess) {
        document.getElementById('err-'+key).innerHTML = mess;
    }

    function validate() {
        var flag = true;
        var title = getValue('title');
        var content = getValue('content');
        var imgUpload = getValue('imgUpload');

        if (title == '') {
            flag = false;
            showError('title', 'Bạn cần nhập dữ liệu cho trường này');
        } else {
            showError('title', '');
        }

        if (content == "<div><br></div>") {
            flag = false;
            showError('content', 'Bạn cần nhập dữ liệu cho trường này');
        } else {
            showError('content', '');
        }
        return flag;
    }

</script>
</body>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>

</html>