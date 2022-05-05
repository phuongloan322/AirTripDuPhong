<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" style="background-color: #fff">

<head>
    <meta charset="utf-8"/>
    <title>${place.name }</title>
    <%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    <%--	  RTE--%>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/asset/richtextediter/richtext.min.css">
    <style>
        .richText .richText-editor {
            height: 500px;
        }

        .noidung label, .noidung p {
            font-size: 17px !important;
            color: #1b1e21 !important;
            font-weight: 400 !important;
        }

        .noidung h5 {
            font-size: 20px !important;
            color: #1b1e21 !important;
            font-weight: 600 !important;
        }

        .noidung .success {
            color: #009900 !important;
            font-size: 17px;
            font-weight: 500 !important;
            margin-top: 10px !important;
        }
    </style>
</head>

<body class="light-edition">
<div class="wrapper ">
    <%@ include file="/WEB-INF/views/admin/layout/sidebar.jsp" %>
    <div class="main-panel" style="background: white !important;">
        <!-- Navbar -->
        <nav
                class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top "
                id="navigation-example" style="background-color: darkslategrey !important;color:#fff">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="javascript:void(0)"></a>
                </div>

                <div class="collapse navbar-collapse justify-content-end">

                    <form
                            class="navbar-form">
                        <div class="input-group no-border">
                            <input type="text" value="" class="form-control" name="search"
                                   placeholder="Search...">
                            <button type="submit"
                                    class="btn btn-default btn-round btn-just-icon">
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

        <div class="content setw" style="background-color: #fff">

            <div class="container-fluid">
                <div class="row noidung">
                    <div class="col-md-12">
                        <h2 class="ptieude">
                            <a href="<c:url value="/admin/manager-place" />"><i class="material-icons detail">chevron_left</i></a>
                            <b>${place.name }</b>
                        </h2>
                        <b>Ảnh</b> <br>
                        <br>
                        <form action="<c:url value="/become-a-host/detailplace/add-image/${place.placeId }" />"
                              method="post"
                              enctype="multipart/form-data">
                            <div class="imgcha">
                                <c:forEach var="item" items="${place.images }">
                                    <div class="imgcon">
                                        <img alt="" width="250px" height="180px"
                                             src="<c:url value="/asset/images/${item.name }" />"
                                             style="margin: 2px 0;">
                                        <a href="/become-a-host/detailplace/delete-image/${item.imageId }">
                                            <i class="material-icons deleteimg">clear</i>
                                        </a>
                                    </div>
                                </c:forEach>
                                <br><br>
                                <input type="file" name="imageFile" multiple/>
                            </div>
                            <br>
                            <button class="editbtn">Chỉnh sửa</button>
                            <br>
                        </form>
                        <br>
                        <hr>
                        <br>
                        <h5>Thông tin cơ bản về nhà phòng cho thuê</h5>
                        <br>
                        <%-- <form action="<c:url value="/become-a-host/detailplace/editplace/${detailPlace.placeId }" />" method="post"> --%>
                        <label>Tiêu đề nhà / phòng cho thuê</label><br>
                        <input value="${place.name }" name="tieude" id="tieude" class="tieude"><br>
                        <div id="ajax-response1"></div>
                        <br>
                        <button class="editbtn" onclick="editTitle()">Chỉnh sửa</button>
                        <br><br>
                        <hr>
                        <br>

                        <label>Mô tả nhà phòng cho thuê</label><br>
                        <textarea value="" name="detail" id="detail" class="mota">${place.detail }</textarea><br>
                        <div id="ajax-response2"></div>
                        <br>
                        <button class="editbtn" onclick="editDetail()">Chỉnh sửa</button>
                        <br><br>
                        <hr>
                        <br>

                        <label>Vị trí</label><br>
                        <input value="${place.address }" id="address" name="address" class="tieude"><br>
                        <div id="ajax-response3"></div>
                        <br>
                        <button class="editbtn" onclick="editAddress()">Chỉnh sửa</button>
                        <br><br>
                        <hr>
                        <br>

                        <label>Giá cho thuê nhà / phòng</label>
                        <input value="${place.price }" name="price" id="price" type="number" class="price">$<br>
                        <div id="ajax-response4"></div>
                        <br>
                        <button class="editbtn" onclick="editPrice()">Chỉnh sửa</button>
                        <br><br>
                        <hr>

                        <p class="asa">Ngày cho thuê nhà / phòng</p><br>
                        <label>Ngày bắt đầu </label>
                        <input value="${place.startDay }" name="startDay" id="startDay" type="date"
                               class="date"><br><br>

                        <label>Ngày kết thúc </label>
                        <input value="${place.endDay }" name="endDay" type="date" id="endDay" class="date"><br>
                        <div id="ajax-response5"></div>
                        <br>
                        <button class="editbtn" onclick="editDate()">Chỉnh sửa</button>
                        <br><br>
                        <hr>
                        <br>

                        <!--  -->
                        <label class="asa">Trạng thái nhà / phòng cho thuê </label><br><br>
                        <c:choose>
                            <c:when test="${place.isEmpty == 'true' }">
                                <input value="true" name="radio" type="radio" class="date isEmpty" value="1"
                                       checked> Đã đăng<br>
                                <p class="note">Khách có thể tìm thấy nhà/phòng cho thuê của bạn trong kết quả tìm kiếm
                                    và yêu cầu thông
                                    tin về tình trạng còn phòng hoặc đặt phòng vào những ngày còn trống.</p>
                                <input value="false" name="radio" type="radio" class="date isEmpty"
                                       value="0"> Đã hủy đăng<br>
                                <p class="note">Khách không thể đặt phòng hoặc tìm thấy nhà/phòng cho thuê của bạn trong
                                    kết quả tìm
                                    kiếm.</p>
                            </c:when>
                            <c:otherwise>
                                <input value="true" name="radio" type="radio" class="date isEmpty"
                                       value="1"> Đã đăng<br>
                                <p class="note">Khách có thể tìm thấy nhà/phòng cho thuê của bạn trong kết quả tìm kiếm
                                    và yêu cầu thông
                                    tin về tình trạng còn phòng hoặc đặt phòng vào những ngày còn trống.</p>
                                <input value="false" name="radio" type="radio" class="date isEmpty" value="0"
                                       checked> Đã hủy đăng<br>
                                <p class="note">Khách không thể đặt phòng hoặc tìm thấy nhà/phòng cho thuê của bạn trong
                                    kết quả tìm
                                    kiếm.</p>
                            </c:otherwise>
                        </c:choose>

                        <!--  -->
                        <div id="ajax-response6"></div>
                        <br>
                        <button class="editbtn" onclick="editEmpty()">Chỉnh sửa</button>
                        <br><br>
                        <hr>
                        <!-- </form> -->
                        <!--  -->

                        <%-- <form action="<c:url value="/become-a-host/detailplace/editdetail/${detailPlace.detailId.detailId }" />" method="post"> --%>
                        <br>
                        <label>Số lượng khách cho phép</label>
                        <input type="number" value="${place.detailPlace.phongkhach }" name="khach" id="khach"
                               class="khach"/> <br>
                        <button class="editbtn" onclick="editDetail()">Chỉnh sửa</button>
                        <br>
                        <br>
                        <hr>
                        <%----%>
                        <br>
                        <label>Số lượng nhà/phòng cho thuê</label>
                        <input type="number" value="${place.numberPlace }" name="numberPlace" id="numberPlace"
                               class="khach"/> <br>
                        <button class="editbtn" onclick="editNumberPlace()">Chỉnh sửa</button>
                        <div id="ajax-response7"></div>
                        <br>
                        <br>
                        <hr>
                        <!--  -->
                        <br>
                        <p>Chỗ ở và phòng</p>

                        <label>Phòng ngủ: </label>
                        <input type="number" value="${place.detailPlace.phongngu }" name="phongngu" id="phongngu"
                               class="khach"/>
                        <label>Giường: </label>
                        <input type="number" value="${place.detailPlace.giuong }" name="giuong" id="giuong"
                               class="khach"/>
                        <label>Phòng vệ sinh: </label>
                        <input type="number" value="${place.detailPlace.phongvs }" name="phongvs" id="phongvs"
                               class="khach"/>
                        <br>
                        <input value="${place.detailPlace.detailId }" name="detailId" id="detailId" hidden/> <br>
                        <input value="${place.placeId }" name="placeId" id="placeId" hidden/> <br>
                        <div id="ajax-response"></div>

                        <button class="editbtn" onclick="editDetailPlace()">Chỉnh sửa</button>
                        <br>
                        <br>
                        <hr>

                        <div class="rating">
                            <h3>
                                <i class="fa fa-star" style="color:#ef4365"></i> ${rating } . ${reviewList.size() } đánh
                                giá
                            </h3>
                        </div>
                        <br>
                        <div>
                            <c:forEach var="item" items="${reviewList }">
                                <div class="item-review">
                                    <div class="row">
                                        <div class="">
                                            <img alt="" width="50px" height="50px" style="border-radius: 50%;"
                                                 class="border"
                                                 src="<c:url value="/asset/images/${item.account.image }" />">
                                        </div>
                                        <div class="col-5">
                                            <b>${item.account.name }</b><br>
                                            <c:forEach begin="1" end="${item.rate }" varStatus="loop">
                                                <i class="fa fa-star" style="color:#ef4365"></i>
                                            </c:forEach>
                                            <p class="review">${item.content }</p>
                                        </div>
                                    </div>
                                    <div style="margin-left: 50px">
                                        <c:forEach var="itemReaction" items="${reactionList }">
                                            <c:if test="${itemReaction.review.reviewId == item.reviewId }">
                                                <div class="row">
                                                    <div>
                                                        <img alt="" width="50px" height="50px"
                                                             style="border-radius: 50%;" class="border"
                                                             src="<c:url value="/asset/images/${itemReaction.account.image }" />">
                                                    </div>
                                                    <div class="col">
                                                        <b>${itemReaction.account.name }</b>
                                                        <p>${itemReaction.details }</p>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <br>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <hr>
                <!-- </form> -->
                <h3><b>Thông tin cơ bản về chủ nhà</b></h3><br>
                <p>Họ và tên: ${place.account.name }</p>
                <p>Số điện thoại: ${place.account.phone }</p>
                <p>Địa chỉ: ${place.account.address }</p>
                <p>Email: ${place.account.email }</p>
                <a href="/admin/detail-account/${place.account.accountId }" class="btn btn-primary">Xem chi tiết</a>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<script src="/asset/richtextediter/jquery.richtext.js"></script>
<script src="/asset/richtextediter/jquery.richtext.min.js"></script>

<script>
    $('#detail').richText();
</script>

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
        crossorigin="anonymous"></script>
<script>

    jQuery('.deletereaction').click(function (evt) {
        evt.preventDefault();

        var reactionId = jQuery(this).attr("data-delete");
        var item = "reac-avt-" + reactionId;
        console.log(reactionId);
        console.log(item);

        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/DeleteReaction",
            data: {
                reactionId: reactionId,
            },
            timeout: 2000,
            success: function (data) {
                console.log("SUCCESS: ");
                document.getElementById(item).style.display = "none";
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });
    });

    jQuery('.editreaction').click(function (evt) {
        evt.preventDefault();


        var reactionId = jQuery(this).attr("data-edit");
        var reviewId = $(this).parent().parent().parent().parent().parent().attr('id').split("-")[1];
        if (localStorage.getItem("reviewId") != null && localStorage.getItem("reviewId") != reviewId) {
            clear();
        }
        localStorage.setItem('reviewId', reviewId);
        localStorage.setItem('reactionId', reactionId);

        function clear() {
            document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "inline";
            document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "none";
            document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "none";
            document.getElementById("rep-" + localStorage.getItem("reviewId")).value = "";
            localStorage.removeItem("reviewId");
            localStorage.removeItem("reactionId");
        }

        console.log(localStorage.getItem("reviewId"))

        var value = document.getElementById("review-" + reactionId).innerText;
        document.getElementById("rep-" + localStorage.getItem("reviewId")).value = value;
        document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "none";
        document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "inline";
        document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "inline";
    });

    $('.sua').on('click', function (event) {
        event.preventDefault();
        var reactionId = localStorage.getItem('reactionId');
        var detail = document.getElementById("rep-" + localStorage.getItem('reviewId')).value
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/review-reaction/edit",
            data: {
                reactionId: reactionId,
                detail: detail
            },
            timeout: 2000,
            success: function (data) {
                console.log("SUCCESS: ", data);
                document.getElementById("review-" + reactionId).innerText = detail;
                document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "inline";
                document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "none";
                document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "none";
                document.getElementById("rep-" + localStorage.getItem("reviewId")).value = "";
                localStorage.removeItem("reviewId");
                localStorage.removeItem("reactionId");
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });
    });

    $('.huy').click(() => {
        document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "inline";
        document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "none";
        document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "none";
        document.getElementById("rep-" + localStorage.getItem("reviewId")).value = "";
        localStorage.removeItem("reviewId");
        localStorage.removeItem("reactionId");
    });

    $('.okrep').on('click', function (event) {
        event.preventDefault();
        var userName = '<c:out value="${accLogin.name}"/>';
        var imageAccount = '<c:out value="${accLogin.image}"/>';
        var reviewId = jQuery(this).attr("data-rep");
        var inputrep = 'rep-' + reviewId;
        var reactionHTML = 'reaction-' + reviewId;
        var detail = document.getElementById(inputrep).value;

        var htmlObj = document.getElementById(reactionHTML);
        var htmlChild = "reac-avt-" + reviewId;

        console.log(userName);
        console.log(htmlChild);
        console.log(htmlObj);
        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/review-reaction",
            dataType: "json",
            data: jQuery.param({
                reviewId: reviewId,
                detail: detail
            }),
            success: function (data) {
                console.log("SUCCESS: ", data);


                var result = '<div id="reac-avt-' + data.reactionId + '" class="reac-avt-' + data.reviewId + '">'
                    + ' 	<div class="avt">'
                    + ' 		<img alt="" width="50px" height="50px" src="/asset/images/' + imageAccount + '">'
                    + ' 	</div>'
                    + ' 	<div class="row">'
                    + '<div class="col">'
                    + ' 		<b>' + userName + '</b>'
                    + ' 		<p>' + data.dateSubmit + '</p>'
                    + '</div>'
                    + '<div>'
                    + '     <a href="#" class="nav-link test" data-toggle="dropdown"></a>'
                    + '     <div class="dropdown-menu" style="min-width: 0">'
                    + '         <a data-edit="' + data.reactionId + '" class="dropdown-item editreaction">Sửa</a>'
                    + '			<a data-delete="' + data.reactionId + '" class="dropdown-item deletereaction" >Xóa</a>'
                    + ' 	</div>'
                    + '</div></div>'
                    + '     <p class="review" id="review-' + data.reactionId + '">' + detail + '</p>'
                    + ' </div>';
                document.getElementById(reactionHTML).innerHTML = htmlObj.innerHTML + result;
                document.getElementById(inputrep).value = "";
                jQuery('.deletereaction').click(function (evt) {

                    var reactionId = jQuery(this).attr("data-delete")
                    var item = "reac-avt-" + reactionId;
                    console.log(reactionId);
                    console.log(item);

                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "/DeleteReaction",
                        data: {
                            reactionId: reactionId,
                        },
                        timeout: 2000,
                        success: function (data) {
                            console.log("SUCCESS: ");
                            document.getElementById(item).style.display = "none";
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }

                    });
                    document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "inline";
                    document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "none";
                    document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "none";
                    document.getElementById("rep-" + localStorage.getItem("reviewId")).value = "";
                    localStorage.removeItem("reviewId");
                    localStorage.removeItem("reactionId");
                });

                $('.editreaction').click(function (evt) {
                    evt.preventDefault();


                    var reactionId = jQuery(this).attr("data-edit");
                    var reviewId = $(this).parent().parent().parent().parent().parent().attr('id').split("-")[1];
                    if (localStorage.getItem("reviewId") != null && localStorage.getItem("reviewId") != reviewId) {
                        clear();
                    }
                    localStorage.setItem('reviewId', reviewId);
                    localStorage.setItem('reactionId', reactionId);

                    function clear() {
                        document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "inline";
                        document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "none";
                        document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "none";
                        document.getElementById("rep-" + localStorage.getItem("reviewId")).value = "";
                        localStorage.removeItem("reviewId");
                        localStorage.removeItem("reactionId");
                    }

                    console.log(localStorage.getItem("reviewId"))

                    var value = document.getElementById("review-" + reactionId).innerText;
                    document.getElementById("rep-" + localStorage.getItem("reviewId")).value = value;
                    document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "none";
                    document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "inline";
                    document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "inline";
                });

                $('.sua').on('click', function (event) {
                    event.preventDefault();
                    var reactionId = localStorage.getItem('reactionId');
                    var detail = document.getElementById("rep-" + localStorage.getItem('reviewId')).value
                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: "/review-reaction/edit",
                        data: {
                            reactionId: reactionId,
                            detail: detail
                        },
                        timeout: 2000,
                        success: function (data) {
                            console.log("SUCCESS: ", data);
                            document.getElementById("review-" + reactionId).innerText = detail;
                            document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "inline";
                            document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "none";
                            document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "none";
                            document.getElementById("rep-" + localStorage.getItem("reviewId")).value = "";
                            localStorage.removeItem("reviewId");
                            localStorage.removeItem("reactionId");
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    });
                });

                $('.huy').click(() => {
                    document.getElementById("btnrep-" + localStorage.getItem("reviewId")).style.display = "inline";
                    document.getElementById("btnedit-" + localStorage.getItem("reviewId")).style.display = "none";
                    document.getElementById("btnhuy-" + localStorage.getItem("reviewId")).style.display = "none";
                    document.getElementById("rep-" + localStorage.getItem("reviewId")).value = "";
                    localStorage.removeItem("reviewId");
                    localStorage.removeItem("reactionId");
                });
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });
    });

</script>

<script type="text/javascript">

    function editDetailPlace() {
        var detailId = $("#detailId").val();
        var khach = $("#khach").val();
        var phongngu = $("#phongngu").val();
        var giuong = $("#giuong").val();
        var phongvs = $("#phongvs").val();

        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/become-a-host/detailplace/editdetail",
            data: {
                detailId: detailId,
                khach: khach,
                phongngu: phongngu,
                giuong: giuong,
                phongvs: phongvs
            },
            timeout: 2000,
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });
    }

    function editTitle() {
        var placeId = $("#placeId").val();
        var tieude = $("#tieude").val();
        var detail = $("#detail").val();
        var address = $("#address").val();
        var price = $("#price").val();
        var startDay = $("#startDay").val();
        var endDay = $("#endDay").val();
        var isEmpty = $('input[name=radio]:checked').val();
        var numberPlace = $("#numberPlace").val();


        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/become-a-host/detailplace/editplace",
            dataType: "json",
            data: jQuery.param({
                placeId: placeId,
                tieude: tieude,
                detail: detail,
                address: address,
                price: price,
                startDay: startDay,
                endDay: endDay,
                isEmpty: isEmpty,
                numberPlace: numberPlace
            }),
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response1").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response1").html(result);
            }
        });
    }

    function editDetail() {
        var placeId = $("#placeId").val();
        var tieude = $("#tieude").val();
        var detail = $("#detail").val();
        var address = $("#address").val();
        var price = $("#price").val();
        var startDay = $("#startDay").val();
        var endDay = $("#endDay").val();
        var isEmpty = $('input[name=radio]:checked').val();
        var numberPlace = $("#numberPlace").val();


        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/become-a-host/detailplace/editplace",
            dataType: "json",
            data: jQuery.param({
                placeId: placeId,
                tieude: tieude,
                detail: detail,
                address: address,
                price: price,
                startDay: startDay,
                endDay: endDay,
                isEmpty: isEmpty,
                numberPlace: numberPlace
            }),
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response2").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response2").html(result);
            }
        });
    }

    function editAddress() {
        var placeId = $("#placeId").val();
        var tieude = $("#tieude").val();
        var detail = $("#detail").val();
        var address = $("#address").val();
        var price = $("#price").val();
        var startDay = $("#startDay").val();
        var endDay = $("#endDay").val();
        var isEmpty = $('input[name=radio]:checked').val();
        var numberPlace = $("#numberPlace").val();


        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/become-a-host/detailplace/editplace",
            dataType: "json",
            data: jQuery.param({
                placeId: placeId,
                tieude: tieude,
                detail: detail,
                address: address,
                price: price,
                startDay: startDay,
                endDay: endDay,
                isEmpty: isEmpty,
                numberPlace: numberPlace
            }),
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response3").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response3").html(result);
            }
        });
    }

    function editPrice() {
        var placeId = $("#placeId").val();
        var tieude = $("#tieude").val();
        var detail = $("#detail").val();
        var address = $("#address").val();
        var price = $("#price").val();
        var startDay = $("#startDay").val();
        var endDay = $("#endDay").val();
        var isEmpty = $('input[name=radio]:checked').val();
        var numberPlace = $("#numberPlace").val();


        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/become-a-host/detailplace/editplace",
            dataType: "json",
            data: jQuery.param({
                placeId: placeId,
                tieude: tieude,
                detail: detail,
                address: address,
                price: price,
                startDay: startDay,
                endDay: endDay,
                isEmpty: isEmpty,
                numberPlace: numberPlace
            }),
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response4").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response4").html(result);
            }
        });
    }

    function editDate() {
        var placeId = $("#placeId").val();
        var tieude = $("#tieude").val();
        var detail = $("#detail").val();
        var address = $("#address").val();
        var price = $("#price").val();
        var startDay = $("#startDay").val();
        var endDay = $("#endDay").val();
        var isEmpty = $('input[name=radio]:checked').val();
        var numberPlace = $("#numberPlace").val();


        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/become-a-host/detailplace/editplace",
            dataType: "json",
            data: jQuery.param({
                placeId: placeId,
                tieude: tieude,
                detail: detail,
                address: address,
                price: price,
                startDay: startDay,
                endDay: endDay,
                isEmpty: isEmpty,
                numberPlace: numberPlace
            }),
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response5").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response5").html(result);
            }
        });
    }

    function editEmpty() {
        var placeId = $("#placeId").val();
        var tieude = $("#tieude").val();
        var detail = $("#detail").val();
        var address = $("#address").val();
        var price = $("#price").val();
        var startDay = $("#startDay").val();
        var endDay = $("#endDay").val();
        var isEmpty = $('input[name=radio]:checked').val();
        var numberPlace = $("#numberPlace").val();


        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/become-a-host/detailplace/editplace",
            dataType: "json",
            data: jQuery.param({
                placeId: placeId,
                tieude: tieude,
                detail: detail,
                address: address,
                price: price,
                startDay: startDay,
                endDay: endDay,
                isEmpty: isEmpty,
                numberPlace: numberPlace
            }),
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response6").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response6").html(result);
            }
        });
    }

    function editNumberPlace() {
        var placeId = $("#placeId").val();
        var tieude = $("#tieude").val();
        var detail = $("#detail").val();
        var address = $("#address").val();
        var price = $("#price").val();
        var startDay = $("#startDay").val();
        var endDay = $("#endDay").val();
        var isEmpty = $('input[name=radio]:checked').val();
        var numberPlace = $("#numberPlace").val();


        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "/become-a-host/detailplace/editplace",
            dataType: "json",
            data: jQuery.param({
                placeId: placeId,
                tieude: tieude,
                detail: detail,
                address: address,
                price: price,
                startDay: startDay,
                endDay: endDay,
                isEmpty: isEmpty,
                numberPlace: numberPlace
            }),
            success: function (data) {
                console.log("SUCCESS: ");
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response7").html(result);
            },
            error: function (e) {
                console.log("ERROR: ", e);
                var result = "<p class=\"success\"> Đã lưu </h3>";
                $("#ajax-response7").html(result);
            }
        });
    }

</script>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

</body>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>

</html>