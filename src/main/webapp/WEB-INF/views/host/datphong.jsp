<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/WEB-INF/views/host/head3.jsp" %>

<body>
<%@ include file="/WEB-INF/views/host/header3.jsp" %>
<!-- Page Header Start -->
<div class="page-header" style="padding: 50px 0 30px 0 !important; margin-bottom: 5px;">
</div>
<!-- Page Header End -->


<!-- About Start -->
<div class="about wow fadeInUp" data-wow-delay="0.1s">
    <div style="margin: 50px">
        <h4><b><a href="/become-a-host/index"><i class="fas fa-angle-left"></i></a> Đặt phòng</b></h4>
        <br>
        <ul class="ds">
            <c:if test="${chooseHost.equals(\"tatca\")}">
                <li><a href="/become-a-host/upcoming/all-accept" class="itemmenu active">Tất cả
                    (${acceptList.size()})</a></li>
            </c:if>
            <c:if test="${!chooseHost.equals(\"tatca\")}">
                <li><a href="/become-a-host/upcoming/all-accept" class="itemmenu">Tất cả</a></li>
            </c:if>
            <c:if test="${chooseHost.equals(\"currentwelcoming\")}">
                <li><a href="/become-a-host/upcoming/current-welcoming" class="itemmenu active">Hiện đang sắp đón
                    (${acceptList.size()})</a></li>
            </c:if>
            <c:if test="${!chooseHost.equals(\"currentwelcoming\")}">
                <li><a href="/become-a-host/upcoming/current-welcoming" class="itemmenu">Hiện đang sắp đón</a></li>
            </c:if>

            <c:if test="${chooseHost.equals(\"comingsoon\")}">
                <li><a href="/become-a-host/upcoming/coming-soon" class="itemmenu active">Sắp đến
                    (${acceptList.size()})</a></li>
            </c:if>
            <c:if test="${!chooseHost.equals(\"comingsoon\")}">
                <li><a href="/become-a-host/upcoming/coming-soon" class="itemmenu">Sắp đến</a></li>
            </c:if>
            <c:if test="${chooseHost.equals(\"chenkoutsoon\")}">
                <li><a href="/become-a-host/upcoming/chenkout-soon" class="itemmenu active">Sắp trả phòng
                    (${acceptList.size()})</a></li>
            </c:if>
            <c:if test="${!chooseHost.equals(\"chenkoutsoon\")}">
                <li><a href="/become-a-host/upcoming/chenkout-soon" class="itemmenu">Sắp trả phòng</a></li>
            </c:if>
            <c:if test="${chooseHost.equals(\"finish\")}">
                <li><a href="/become-a-host/upcoming/finish" class="itemmenu active">Hoàn thành
                    (${acceptList.size()})</a></li>
            </c:if>
            <c:if test="${!chooseHost.equals(\"finish\")}">
                <li><a href="/become-a-host/upcoming/finish" class="itemmenu">Hoàn thành</a></li>
            </c:if>
            <c:if test="${chooseHost.equals(\"cancel\")}">
                <li><a href="/become-a-host/upcoming/cancel" class="itemmenu active">Từ chối (${acceptList.size()})</a>
                </li>
            </c:if>
            <c:if test="${!chooseHost.equals(\"cancel\")}">
                <li><a href="/become-a-host/upcoming/cancel" class="itemmenu">Từ chối</a></li>
            </c:if>


        </ul>
        <div class="table-responsive cart_info">
            <c:choose>
                <c:when test="${acceptList.size() > 0 }">
                    <%--							<p class="right">Có ${acceptList.size()} đơn đặt phòng</p><br>--%>
                    <form action="" method="post">
                        <table class="table table-condensed"
                               style="border-left: 1px solid #dee2e6;border-right: 1px solid #dee2e6;border-bottom: 1px solid #dee2e6;">
                            <thead>
                            <tr class="" style="font-weight: bold">
                                <td class="" style="text-align: center">STT</td>
                                <td class="image"></td>
                                <td class="" width="25%">Nhà / phòng cho thuê</td>
                                <td class="" width="15%">Khách hàng</td>
                                <td class="" width="15%">Thời gian</td>
                                <td class="" width="13%">Phí</td>
                                <td class="" width="15%">Chức năng</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${acceptList }" varStatus="loop">
                                <tr>
                                    <td style="text-align: center">
                                            ${loop.index + 1}
                                    </td>
                                    <td class="" width="90" height="90">
                                        <a href=""><img style="border-radius: 10px"
                                                        src="<c:url value="/asset/images/${item.place.images[0].name }"/>"
                                                        alt="" width="150" height="100"></a>
                                    </td>
                                    <td class="">
                                        <b><a href="<c:url value="/become-a-host/detailplace/${item.place.placeId }" />">${item.place.name }</a></b><br>
                                        <i class="iaddress">${item.place.address }</i><br>
                                        <i class="iaddress">$ ${item.place.price } / đêm</i>
                                    </td>
                                    <td class="chitiet">
                                        <a href="/detail-account/${item.account.accountId }">${item.account.name }</a>
                                        <br>
                                        SĐT: ${item.account.phone }<br>
                                        Số người: ${item.people }
                                    </td>
                                    <td class="chitiet">
                                        <c:if test="${item.place.startDay != null && item.place.endDay != null}">
                                            Từ: ${item.startDay.split("-")[2]} -
                                            ${item.startDay.split("-")[1]} -
                                            ${item.startDay.split("-")[0]}
                                            <br>
                                            Đến: ${item.endDay.split("-")[2]} -
                                            ${item.endDay.split("-")[1]} -
                                            ${item.endDay.split("-")[0]}
                                            <br>
                                        </c:if>
                                    </td>
                                    <td>
                                        Tổng thuê: $ <fmt:formatNumber type="number" groupingUsed="true" value="${item.totalPrice }" /><br>
                                        Phí vệ sinh: $10<br>
                                        Phí dịch vụ: $10
                                    </td>
                                    <td class="">
                                        <c:choose>
                                            <c:when test="${item.isAccept == 0 }">
                                                <div class="upcomingstatus" style="text-align: center">
                                                    <a href="<c:url value="/become-a-host/upcoming/accept/${item.bookId }" />">
                                                        <i class="fas fa-check"></i>
                                                    </a>
                                                    <a data-toggle="modal" data-target="#addModal"
                                                       data-id="${item.bookId}" class="cancel">
                                                        <i class="fas fa-remove"></i>
                                                    </a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="daxacnhan">
                                                    <c:choose>
                                                        <c:when test="${item.isAccept == 1 && item.isPayment == false}">
                                                            <div class="row">
                                                                <div class="col" style="margin-top: 10px">
                                                                    <a class="b-accept"><i class="fas fa-check"></i>Đã
                                                                        xác nhận</a>
                                                                </div>
                                                                <div>
                                                                    <a href="#" class="nav-link test"
                                                                       data-toggle="dropdown"></a>
                                                                    <div class="dropdown-menu">
                                                                        <a data-toggle="modal" data-target="#addModal"
                                                                           data-id="${item.bookId}"
                                                                           class="dropdown-item cancel">Từ chối</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${item.isAccept == 1 && item.isPayment == true}">
                                                            <div class="row">
                                                                <div class="col" style="margin-top: 10px">
                                                                    <a class="b-accept"><i class="fas fa-check"></i>Đã
                                                                        thanh toán</a>
                                                                </div>
                                                                <div>
                                                                    <a href="#" class="nav-link test"
                                                                       data-toggle="dropdown"></a>
                                                                    <div class="dropdown-menu">
                                                                        <a data-id="${item.bookId }"
                                                                           href="/show-payment/${item.bookId }"
                                                                           class="dropdown-item show-payment">Xem giao
                                                                            dịch</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:when>
<%--                                                        <c:when test="${item.isAccept == 1 && item.isPayment == true && item.isReview == true}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col" style="margin-top: 10px">--%>
<%--                                                                    <a class="b-accept"><i class="fas fa-check"></i>Đã--%>
<%--                                                                        đánh giá</a>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </c:when>--%>
                                                        <c:when test="${item.isAccept == -1}">
                                                            <div class="row">
                                                                <div class="col" style="margin-top: 10px">
                                                                    <a class="b-accept"><i class="fas fa-remove"></i>Đã
                                                                        từ chối</a>
                                                                </div>
                                                                <div>
                                                                    <a href="#" class="nav-link test"
                                                                       data-toggle="dropdown"></a>
                                                                    <div class="dropdown-menu">
                                                                        <a data-id="${item.bookId }"
                                                                           href="/show-reason/${item.bookId }"
                                                                           class="dropdown-item showcancel">Xem nguyên
                                                                            nhân</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>

                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                        <button id="delete" class="btn-link delete">Xóa</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p>Bạn không có yêu cầu đặt phòng nào</p>
                    <br>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- REASON MODAL-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title"><b>Từ chối huỷ phòng</b></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="myFormId">
                    <div class="form-group">
                        <p style="color: darkred">*Vui lòng chọn nguyên nhân từ chối huỷ phòng</p>
                        <input type="radio" value="Trùng lịch đặt phòng" name="reason" checked
                               onclick="handleClick(this);">
                        <label>Trùng lịch đặt phòng</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" value="Đã hết phòng trong khoảng thời gian này" name="reason"
                               onclick="handleClick(this);">
                        <label>Đã hết phòng trong khoảng thời gian này</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" value="Nhà/phòng đang được tu sửa" name="reason"
                               onclick="handleClick(this);">
                        <label>Nhà/phòng đang được tu sửa</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" value="Nhà/phòng bị ảnh hưởng bởi thời tiết" name="reason"
                               onclick="handleClick(this);">
                        <label>Nhà/phòng bị ảnh hưởng bởi thời tiết</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" value="Khách hàng không đáp ứng điều kiện đặt phòng" name="reason"
                               onclick="handleClick(this);">
                        <label>Khách hàng không đáp ứng điều kiện đặt phòng</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" value="Khách hàng thanh toán không thành công" id="reasonother"
                               name="reason" onclick="handleClick(this);">
                        <label>Khách hàng thanh toán không thành công</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" value="" name="reason" onclick="handleClick(this);">
                        <label>Nguyên nhân khác</label>
                        <input style="display: none" type="text" id="show-reason" class="form-control"
                               name="reasonother">
                    </div>
                    <br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">Thoát</button>
                        <button type="submit " class="btn btn-secondary review">Đánh giá</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal" id="showReasonModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title"><b style="font-size: 17px">Nguyên nhân hủy phòng</b></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input class="form-control reason1" id="reason" style="height: 50px">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="paymentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 500px">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title"><b style="font-size: 17px">Lịch sử thanh toán</b></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Mã giao dịch</label>
                    <input class="form-control" name="paymentId" id="paymentId">
                </div>
                <div class="form-group">
                    <label>Tài khoản thanh toán</label>
                    <input class="form-control" name="email" id="email">
                </div>
                <div class="form-group">
                    <label>Tổng tiền thanh toán</label>
                    <input class="form-control" name="totalPrice" id="totalPrice">
                </div>
                <div class="form-group">
                    <label>Phí giao dịch</label>
                    <input class="form-control" name="transactionFee" id="transactionFee">
                </div>
                <div class="form-group">
                    <label>Thời gian thanh toán</label>
                    <input class="form-control" name="createTime" id="createTime">
                </div>
                <div class="form-group">
                    <label>Nội dung thanh toán</label>
                    <input class="form-control" name="description" id="description">
                </div>
                <div class="form-group">
                    <label>Tình trạng</label>
                    <input class="form-control" name="status" id="status">
                </div>
                <div class="form-group">
                    <label>Country Code</label>
                    <input class="form-control" name="countryCode" id="countryCode">
                </div>
                <div class="form-group">
                    <label>Postal Code</label>
                    <input class="form-control" name="postalCode" id="postalCode">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>


<!-- Footer End -->

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script>

    $(document).ready(function () {
        $('.cancel').on('click', function () {
            event.preventDefault();
            var bookId = $(this).attr('data-id');
            var href = "/become-a-host/upcoming/cancel/" + bookId;
            $('#myFormId').attr('action', href);
        });
    });

    jQuery('.showcancel').click(function (evt) {
        evt.preventDefault();
        var href = $(this).attr('href')
        $.get(href, function (data, status) {
            $('#reason').val(data.reason);
        });
        $('#showReasonModal').modal();
    });

    jQuery('.show-payment').click(function (evt) {
        evt.preventDefault();
        var href = $(this).attr('href')
        $.get(href, function (data, status) {
            $('#paymentId').val(data.paymentId);
            $('#email').val(data.email);
            $('#totalPrice').val(data.totalPrice);
            $('#transactionFee').val(data.transactionFee);
            $('#description').val(data.description);
            $('#createTime').val(data.createTime);
            $('#status').val(data.status);
            $('#countryCode').val(data.countryCode);
            $('#postalCode').val(data.postalCode);
        });
        $('#paymentModal').modal();
    });

    function handleClick(myRadio) {
        var value = $("input[name='reason']:checked").val();
        if (value == "") {
            document.getElementById("show-reason").style.display = "block";
        } else {
            document.getElementById("show-reason").style.display = "none";
        }
    }

    function myFunction() {

        var checkBox = document.getElementById("checkbox");
        var text = document.getElementById("delete");
        if (checkBox.checked == true) {
            text.style.display = "block";
        } else {
            text.style.display = "none";
        }
    }

    var listItem = document.getElementsByClassName("itemmenu");

    /* for (var i = 0; i < listItem.length; i++) {
        listItem[i].onclick = function() {
            document.getElementById("active").style.background = "none";
            document.getElementById("active").style.color = "#333";
        }
        listItem[i].onmouseout = function() {
            document.getElementById("active").style.background = "#f89406";
            document.getElementById("active").style.color = "#fff";
        }
    } */
</script>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
</body>
</html>
