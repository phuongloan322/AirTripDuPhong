<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/host/head3.jsp" %>
<%--	  RTE--%>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/asset/richtextediter/richtext.min.css">
<style>
    .richText .richText-editor {
        height: 500px;
    }
</style>
<body>
<%@ include file="/WEB-INF/views/host/header3.jsp" %>
<!-- Page Header Start -->
<div class="page-header">
</div>
<!-- Page Header End -->


<!-- About Start -->
<div class="about wow fadeInUp" data-wow-delay="0.1s">
    <div class="container">
        <h4><b><a href="/become-a-host/manager-blog"><i class="fas fa-angle-left"></i></a> Quản lý Blog</b></h4>
        <br>
        <div class="table-responsive cart_info" >
            <div class="border">
                <form style="margin: 50px 100px" method="post"
                      enctype="multipart/form-data">
                        <h5><b>Tạo bài Blog</b></h5><br>
<%--                    <div class="form-group">--%>
<%--                        <label>Tài khoản<label>--%>
                        <input class="form-control" name="account" id="account" style="height: 50px" value="${accLogin.accountId}" hidden>
<%--                        <p class="text-danger" id="err-account"></p>--%>
<%--                    </div>--%>
                    <div class="form-group">
                        <label>Tiêu đề</label>
                        <input class="form-control" name="title" id="title" style="height: 50px">
                        <p class="text-danger" id="err-title"></p>
                    </div>
                    <div class="form-group">
                        <label>Nội dung bài blog</label>
                        <textarea class="form-control" name="content" id="content"></textarea>
                        <p class="text-danger" id="err-content"></p>
                    </div>
                    <br>
                    <div class="form-group">
                        <label>Ảnh nền bài viết</label><br>
                        <img id="imgSrc" class="anhdaidien borderavt" width="300px" height="200px"
                             src="" style="margin-bottom: 30px; display: none"/><br>
                        <input type="file" name="image" id="imgUpload" accept="image/*"
                               title="Click để thay đổi hình ảnh!">
                        <p class="text-danger" id="err-imgUpload"></p>
                    </div>
                    <div>
                        <button onclick="return validate()" class="btn btn-primary float-lg-right" style="background: #ef4365;border: none;">Tạo bài viết</button>
                    </div>
                    <br>
                </form>
            </div>
        </div>
    </div>
</div>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

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

        if (content == '') {
            flag = false;
            showError('content', 'Bạn cần nhập dữ liệu cho trường này');
        } else {
            showError('content', '');
        }

        if (imgUpload == '') {
            flag = false;
            showError('imgUpload', 'Bạn cần nhập dữ liệu cho trường này');
        } else {
            showError('imgUpload', '');
        }

        return flag;
    }

</script>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
</body>
</html>
