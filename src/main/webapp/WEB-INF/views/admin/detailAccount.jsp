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
                    <a class="navbar-brand" href="<c:url value="/admin/manager-account" />">QUẢN LÝ KHÁCH HÀNG</a>
                </div>
                <div class="collapse navbar-collapse justify-content-end">
                    <%@ include file="/WEB-INF/views/admin/layout/nav-link.jsp" %>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content setw" style="background-color: #fff">
            <h3>
                <a href="<c:url value="/admin/manager-account" />"><i class="material-icons detail">chevron_left</i></a>
                <b>Thông tin cơ bản</b>
            </h3>
            <div class="row">
                <div class="col-8">
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <p style="font-weight: 400; font-size: 18px">Họ và tên:</p>
                            <p style="font-weight: 400; font-size: 18px">Trạng thái:</p>
                            <p style="font-weight: 400; font-size: 18px">Email:</p>
                            <p style="font-weight: 400; font-size: 18px">Tên đăng nhập:</p>
                            <p style="font-weight: 400; font-size: 18px">Số điện thoại:</p>
                            <p style="font-weight: 400; font-size: 18px">Địa chỉ:</p>
                            <p style="font-weight: 400; font-size: 18px">Ngày tạo:</p>
                            <p style="font-weight: 400; font-size: 18px">Giới thiệu:</p>
                        </div>
                        <div class="col-6 detailaccount">
                            <p style="font-weight: 300; font-size: 18px">${account.name}</p>
                            <c:if test="${account.isIdentity == true}">
                                <p style="font-weight: 300; font-size: 18px">Chưa xác nhận danh tính
                                    <i class="fas fa-check"></i></p>
                            </c:if>
                            <c:if test="${account.isIdentity == false}">
                                <p style="font-weight: 300; font-size: 18px">Chưa xác nhận danh tính
                                    <i class="fas fa-exclamation"></i>
                                </p>
                            </c:if>

                            <p style="font-weight: 300; font-size: 18px">${account.email}</p>
                            <p style="font-weight: 300; font-size: 18px">${account.username}</p>
                            <p style="font-weight: 300; font-size: 18px">${account.phone}</p>
                            <p style="font-weight: 300; font-size: 18px">${account.address}</p>
                            <p style="font-weight: 300; font-size: 18px">${account.createDate.split(" ")[0].split("-")[2]}-${account.createDate.split(" ")[0].split("-")[1]}-${account.createDate.split(" ")[0].split("-")[0]}</p>
                            <p style="font-weight: 300; font-size: 18px">${account.introduce}</p>
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <img src="/asset/images/${account.image}" width="200px" height="200px" style="border-radius: 50%">
                </div>
            </div>
            <hr>
            <h3><b><i class="fas fa-home"></i> Danh sách nhà/phòng cho thuê (${places.size()})</b></h3><br>
            <div class="row">
                <c:choose>
                    <c:when test="${places.size() > 0 }">
                        <c:forEach var="item" items="${places }" varStatus="loop">
                            <c:forEach var="rate" items="${ratings }" varStatus="i">
                                <c:if test="${(loop.index == 0 || loop.index == 1 || loop.index == 2) && loop.index == i.index}">
                                    <div class="col-3">
                                        <div class="iPlace" style="margin: 0">
                                            <div class="aa">
                                                <img src="/asset/images/${item.images[0].name }"
                                                     style="border-radius: 15px" width="260px" height="172px">
                                            </div>
                                            <div class="label1">
                                                <div>
                                                    <i class="fas fa-star"
                                                       style="color: #ef4365; margin: 10px 0"></i>${rate}
                                                </div>
                                                <a href="/detailplace/${item.placeId }">
                                                    <b class="textoverflow1" style="color:#1a2035">${item.name }</b>
                                                </a>
                                                <p class="textoverflow1">${item.address}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test="${ (loop.index + 1) % 4 == 0 || (loop.index + 1) == placeList.size() }">

                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h5 style="text-align: center;"><b>Không có kết quả nào được tìm thấy</b></h5>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="row" style="display: none;" id="more">
                <c:forEach var="item" items="${places }" varStatus="loop">
                    <c:forEach var="rate" items="${ratings }" varStatus="i">
                        <c:if test="${loop.index > 2 && loop.index == i.index}">
                            <div class="col-3">
                                <div class="iPlace" style="margin: 0">
                                    <div class="aa">
                                        <img src="/asset/images/${item.images[0].name }"
                                             style="border-radius: 15px" width="260px" height="172px">
                                    </div>
                                    <div class="label1">
                                        <div>
                                            <i class="fas fa-star"
                                               style="color: #ef4365; margin: 10px 0"></i>${rate}
                                        </div>
                                        <a href="/detailplace/${item.placeId }">
                                            <b class="textoverflow1" style="color:#1a2035">${item.name }</b>
                                        </a>
                                        <p class="textoverflow1">${item.address}</p>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${ (loop.index + 1) % 4 == 0 || (loop.index + 1) == placeList.size() }">

                            </c:if>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
            <c:if test="${places.size() > 3}" >
                <u id="xemthem">Xem tất cả nhà/phòng</u>
            </c:if>

            <hr>
            <h3><b><i class="fas fa-check" style="margin-right: 10px"></i>Thông tin đặt phòng</b></h3><br>
            <div class="card-body">
                <div class="table-responsive">
                    <c:choose>
                        <c:when test="${bookroomList.size() > 0 }">
                            <table class="table">
                                <thead class=" text-primary">
                                <th>
                                    ID
                                </th>
                                <th></th>
                                <th width="20%">
                                    Thông tin nhà/phòng
                                </th>
                                <th>
                                    Người cho thuê
                                </th>
                                <th>
                                    Người thuê
                                </th>
                                <th>
                                    Chi tiết thuê
                                </th>
                                <th>
                                    Tình trạng
                                </th>
                                </thead>
                                <tbody id="noidung" >
                                <c:forEach var="item" items="${bookroomList }" varStatus="loop">
                                    <tr>
                                        <td>
                                                ${loop.index +1 }
                                        </td>
                                        <td>
                                            <a href=""><img style="border-radius: 10px"
                                                            src="<c:url value="/asset/images/${item.place.images[0].name }"/>"
                                                            alt="" width="80" height="70"></a>
                                        </td>
                                        <td>
                                            <b><a href="<c:url value="/admin/manager-place/detail/${item.place.placeId }" />">${item.place.name }</a></b><br>
                                            <i class="iaddress">${item.place.address }</i><br>
                                            <i class="iaddress"><b>$ ${item.place.price } / đêm</b></i>
                                        </td>
                                        <td>
                                                ${item.place.account.name }<br>
                                            Sđt: ${item.place.account.phone }
                                        </td>
                                        <td>
                                                ${item.account.name }<br>
                                            Sđt: ${item.account.phone }
                                        </td>
                                        <td class="chitiet">
                                            <c:if test="${item.place.startDay != null && item.place.endDay != null}">
                                                Ngày bắt đầu: ${item.startDay.split("-")[2]} -
                                                ${item.startDay.split("-")[1]} -
                                                ${item.startDay.split("-")[0]}
                                                <br>
                                                Ngày kết thúc: ${item.endDay.split("-")[2]} -
                                                ${item.endDay.split("-")[1]} -
                                                ${item.endDay.split("-")[0]}
                                                <br>
                                            </c:if>
                                            Tổng tiền thuê: $${item.totalPrice }<br>
                                            Số người: ${item.people }
                                        </td>
                                        <td >
                                            <c:choose>
                                                <c:when test="${item.isAccept == 0 }">
                                                    <div class="upcomingstatus" >
                                                        <i class="fas fa-hourglass"></i> Chờ xác nhận
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
                                                                               href="/admin/show-payment/${item.bookId }"
                                                                               class="dropdown-item show-payment">Xem giao
                                                                                dịch</a>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:when>
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
                        </c:when>
                        <c:otherwise>
                            Không tìm thấy kết quả nào
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="paymentModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="min-width: 600px">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title"><b style="font-size: 17px">Lịch sử thanh toán</b></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <label>Mã giao dịch</label>
                <input class="form-control-file" name="paymentId" id="paymentId" readonly>


                <label>Mã đặt phòng</label>
                <input class="form-control-file" name="bookId" id="bookId" readonly>


                <label>Tên khách hàng</label>
                <input class="form-control-file" name="name" id="name" readonly>


                <label>Tài khoản thanh toán</label>
                <input class="form-control-file" name="email" id="email" readonly>


                <label>Tổng tiền thanh toán (USD)</label>
                <input class="form-control-file" name="totalPrice" id="totalPrice" readonly>


                <label>Phí giao dịch (USD)</label>
                <input class="form-control-file" name="transactionFee" id="transactionFee" readonly>


                <label>Thời gian thanh toán</label>
                <input class="form-control-file" name="createTime" id="createTime" readonly>


                <label>Nội dung thanh toán</label>
                <input class="form-control-file" name="description" id="description" readonly>


                <label>Tình trạng</label>
                <input class="form-control-file" name="status" id="status" readonly>


                <label>Country Code</label>
                <input class="form-control-file" name="countryCode" id="countryCode" readonly>


                <label>Postal Code</label>
                <input class="form-control-file" name="postalCode" id="postalCode" readonly>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

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
                $('#bookId').val(data.bookRoom.bookId);
                $('#name').val(data.bookRoom.account.name);
            });
            $('#paymentModal').modal();
        });

    });


</script>
<script>
    document.getElementById("xemthem").onclick = function () {
        var x = document.getElementById('more');
        if (x.style.display === 'none') {
            x.style.display = 'flex';
            document.getElementById("xemthem").innerText = "Ẩn xem thêm";
        } else {
            x.style.display = 'none';
            document.getElementById("xemthem").innerText = "Xem tất cả nhà/phòng";
        }
    }
</script>
</body>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>

</html>