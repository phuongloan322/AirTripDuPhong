<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>
        Quản Lý Blog
    </title>
    <%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
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
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example"
             style="background-color: darkslategrey !important;color:#fff">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="javascript:void(0)">QUẢN LÝ BLOG</a>
                </div>

                <div class="collapse navbar-collapse justify-content-end">

                    <form action="/admin/manager-blog/page/1" method="post" class="navbar-form">
                        <div class="input-group no-border">
                            <input type="text" value="${search}" class="form-control" style="color: #fff" name="search"
                                   placeholder="Search..." >
                            <button type="submit" class="btn btn-default btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="ripple-container"></div>
                            </button>
                        </div>
                    </form>

                    <%@ include file="/WEB-INF/views/admin/layout/nav-link.jsp" %>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->

        <div class="content">

            <%@ include file="/WEB-INF/views/admin/layout/message.jsp" %>


            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalThem">
                            <i class="material-icons large">add_box</i> Add new
                        </button>

                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title ">Manager Blog</h4>
                                <p class="card-category"> Danh sách Blog</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <c:choose>
                                        <c:when test="${blogList.size() > 0 }">
                                            <table class="table">
                                                <thead class=" text-primary">
                                                <th>
                                                    STT
                                                </th>
                                                <th>
                                                    Ảnh bìa
                                                </th>
                                                <th width="30%">
                                                    Tiêu đề
                                                </th>
                                                <th>
                                                    Ngày đăng
                                                </th>
                                                <th width="15%">
                                                    Tác giả
                                                </th>
                                                <th>
                                                    Chức năng
                                                </th>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="i" items="${blogList }" varStatus="loop">
                                                    <tr>
                                                        <td>
                                                                ${loop.index + 1 }
                                                        </td>
                                                        <td>
                                                            <img src="/asset/images/${i.image}" width="110px"
                                                                 height="80px" style="border-radius: 10px">
                                                        </td>
                                                        <td class="textoverflow3" style="padding-bottom: 0;">
                                                                ${i.title }
                                                        </td>
                                                        <td>
                                                                ${i.createDate.split(" ")[1].substring(0,5) }
                                                            &nbsp;${i.createDate.split(" ")[0].split("-")[2] }-${i.createDate.split(" ")[0].split("-")[1] }-${i.createDate.split(" ")[0].split("-")[0] }
                                                        </td>
                                                        <td>
                                                            <a href="/admin/detail-account/${i.account.accountId}"> ${i.account.name}</a>
                                                        </td>
                                                        <td class="chucnang">
<%--                                                            <a href="<c:url value="/admin/manager-blog/findById/${i.blogId }" />"--%>
<%--                                                               class="detailButton"><i class="material-icons detail">event_note</i></a>--%>
                                                            <a href="<c:url value="/admin/manager-blog/edit/${i.blogId }" />"
                                                               class="editButton"><i class="material-icons edit">mode_edit</i></a>
                                                            <a href="<c:url value="/admin/manager-blog/delete/${i.blogId }" />"
                                                               class="deleteButton"><i class="material-icons delete">delete</i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:when>
                                        <c:otherwise>
                                            Không tìm thấy kết quả nào
                                        </c:otherwise>
                                    </c:choose>
                                    <ul class="pagination modal-6">
                                        <c:if test="${currentPage > 1}">
                                            <li>
                                                <a href="/admin/manager-blog/page/${currentPage-1}?search=${search}&filter=${filter}">&laquo</a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${totalPages }" varStatus="loop">
                                            <c:if test="${currentPage == loop.index}">
                                                <li>
                                                    <a href="/admin/manager-blog/page/${loop.index}?search=${search}&filter=${filter}"
                                                       class="active">${loop.index }</a></li>
                                            </c:if>
                                            <c:if test="${currentPage != loop.index}">
                                                <li>
                                                    <a href="/admin/manager-blog/page/${loop.index}?search=${search}&filter=${filter}">${loop.index }</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${currentPage < totalPages}">
                                            <li>
                                                <a href="/admin/manager-blog/page/${currentPage+1}?search=${search}&filter=${filter}">&raquo;</a>
                                            </li>
                                        </c:if>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Modal ADD-->
<div class="modal fade" id="modalThem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document" style="min-width: 900px">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin bài blog</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/admin/manager-blog/add" method="post"
                      enctype="multipart/form-data">

                    <label class="">Tiêu đề</label>
                    <input type="text" class="form-control-file " id="addtitle" name="title">
                    <p class="text-danger" id="err-addtitle"></p><br>

                    <label class="">Nội dung</label>
                    <input type="text" class="form-control-file " id="addcontent" name="content" readonly><br>
                    <p class="text-danger" id="err-addcontent"></p><br>

                    <br>
                    <label>Ảnh nền bài viết</label><br>
                    <img id="imgSrc" class="anhdaidien borderavt" width="300px" height="200px"
                         src="" style="margin-bottom: 30px; display: none"/><br>
                    <input type="file" name="image" id="imgUpload" accept="image/*"
                           title="Click để thay đổi hình ảnh!">
                    <p class="text-danger" id="err-imgUpload"></p>

                    <%--                    <label class="">Ảnh bìa</label><br>--%>
                    <%--                    <img src="" id="add-image" width="300" height="250" style="border-radius: 10px; margin-left: 50px"><br>--%>
                    <%--                    <input type="file" >--%>

                    <div class="modal-footer" style="border-top: none; ">
                        <button type="button" class="btn btn-secondary closeModal" data-dismiss="modal">Thoát</button>
                        <button type="submit" onclick="return validate()" class="btn btn-primary">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- MODAL EDIT -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document" style="min-width: 900px">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa bài blog</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/admin/manager-blog/edit" method="post"
                      enctype="multipart/form-data">
                    <input type="text" class="form-control-file " id="editblogId" name="blogId">

                    <label class="">Tiêu đề</label>
                    <input type="text" class="form-control-file " id="edittitle" name="title">

                    <label class="">Nội dung</label>
                    <input type="text" class="form-control-file " id="editcontent" name="content" ><br>

                    <label class="">Tác giả</label>
                    <input type="text" class="form-control-file " id="editaccount" name="litleName" readonly><br>

                    <label class="">Ảnh bìa</label><br>
                    <img id="editimgSrc" class="anhdaidien borderavt" width="300px" height="200px"
                         src="/asset/images/${blog.image}" style="margin-bottom: 30px;"/><br>
                    <input type="file" name="image" id="imageEdit" accept="image/*"
                           title="Click để thay đổi hình ảnh!">
                    <p class="text-danger" id="err-editimgUpload"></p><br>

                    <div class="modal-footer" style="border-top: none; ">
                        <button type="button" class="btn btn-secondary closeModal" data-dismiss="modal">Thoát</button>
                        <button type="submit" class="btn btn-primary">Chỉnh sửa</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%--<!-- MODAL DETAIL -->--%>
<%--<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"--%>
<%--     aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document" style="min-width: 900px">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel">Thông tin bài blog</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <form>--%>

<%--                    <label class="">Tiêu đề</label>--%>
<%--                    <input type="text" class="form-control-file " id="detailtitle" readonly>--%>

<%--                    <label class="">Nội dung</label>--%>
<%--                    <input type="text" class="form-control-file " id="detailcontent" name="litleCategoryId"--%>
<%--                           readonly><br>--%>

<%--                    <label class="">Tác giả</label>--%>
<%--                    <input type="text" class="form-control-file " id="detailaccount" name="litleName"><br>--%>

<%--                    <label class="">Ảnh bìa</label><br>--%>
<%--                    <img src="" id="detailimage" width="300" height="250"--%>
<%--                         style="border-radius: 10px; margin-left: 50px"><br>--%>

<%--                    <div class="modal-footer" style="border-top: none; ">--%>
<%--                        <button type="button" class="btn btn-secondary closeModal" data-dismiss="modal">Thoát</button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- DELETE MODAL -->

<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xác nhận xóa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xóa bài blog này?</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" id="confirmDeleteButton" href="">Xóa</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="/asset/richtextediter/jquery.richtext.js"></script>
<script src="/asset/richtextediter/jquery.richtext.min.js"></script>

<script>

    <%--    add--%>
    $('#addcontent').richText();

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

    //edit
    // function readURL2(input) {
    //     if (input.files && input.files[0]) {
    //         var reader = new FileReader();
    //         reader.onload = function (e) {
    //             $('#editimgSrc').attr('src', e.target.result);
    //         }
    //         reader.readAsDataURL(input.files[0]);
    //     }
    // }
    //
    // $("#imageEdit").change(function () {
    //     readURL2(this);
    //     $("#editimgSrc").show();
    // });

    function getValue(id) {
        return document.getElementById(id).value.trim();
    }

    function showError(key, mess) {
        document.getElementById('err-' + key).innerHTML = mess;
    }

    function validate() {
        var flag = true;
        var addtitle = getValue('addtitle');
        var addcontent = getValue('addcontent');
        var imgUpload = getValue('imgUpload');


        if (addcontent == '') {
            flag = false;
            showError('addcontent', 'Bạn cần nhập dữ liệu cho trường này');
        } else {
            showError('addcontent', '');
        }

        if (addtitle == '') {
            flag = false;
            showError('addtitle', 'Bạn cần nhập dữ liệu cho trường này');
        } else {
            showError('addtitle', '');
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

<script type="text/javascript">


    // var html = '';
    // $('table .detailButton').on('click', function (event) {
    //     event.preventDefault();
    //
    //     var href = $(this).attr('href')
    //     $.get(href, function (data, status) {
    //         $('#detailtitle').val(data.title);
    //         $('#detailaccount').val(data.account.name);
    //         $("#detailimage").attr("src", "/asset/images/" + data.image);
    //         html = '' + data.content + '';
    //         localStorage.setItem("html", html);
    //     });
    //     $('#detailModal').modal();
    // });
    //
    // $('.closeModal').on('click', function (event) {
    //     // localStorage.removeItem("html");
    //     location.reload();
    // });
    //
    // $('#detailcontent').val(localStorage.getItem('html'));
    // $('#detailcontent').richText();


    $('table .deleteButton').on('click', function () {
        event.preventDefault();
        var href = $(this).attr('href');
        $('#confirmDeleteButton').attr('href', href);
        $('#deleteModal').modal();
    });

</script>

<script>
    // var htmledit = '';
    // $('table .editButton').on('click', function (event) {
    //     event.preventDefault();
    //
    //     var href = $(this).attr('href')
    //     $.get(href, function (data, status) {
    //         $('#editblogId').val(data.blogId);
    //         $('#edittitle').val(data.title);
    //         $('#editaccount').val(data.account.name);
    //         $("#editimgSrc").attr("src", "/asset/images/" + data.image);
    //         htmledit = '' + data.content + '';
    //         localStorage.setItem("htmledit", htmledit);
    //     });
    //     $('#editModal').modal();
    // });
    //
    // $('.closeModal').on('click', function (event) {
    //     // localStorage.removeItem("html");
    //     location.reload();
    // });
    //
    // $('#editcontent').val(localStorage.getItem('htmledit'));
    // $('#editcontent').richText();
</script>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
</body>
</html>