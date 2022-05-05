<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <%@ include file="/WEB-INF/views/host/head3.jsp" %>--%>
<%--</head>--%>

<%--<body>--%>
<%--<%@ include file="/WEB-INF/views/host/header3.jsp" %>--%>


<%--<script src="<c:url value="/asset/host/lib/easing/easing.min.js" />"></script>--%>
<%--<script src="<c:url value="/asset/host/js/lib/wow/wow.min.js" />"></script>--%>
<%--<script src="<c:url value="/asset/host/lib/owlcarousel/owl.carousel.min.js" />"></script>--%>
<%--<script src="<c:url value="/asset/host/lib/isotope/isotope.pkgd.min.js" />"></script>--%>
<%--<script src="<c:url value="/asset/host/js/lib/lightbox/js/lightbox.min.js" />"></script>--%>

<%--<!-- Contact Javascript File -->--%>
<%--<script src="<c:url value="/asset/host/mail/jqBootstrapValidation.min.js" />"></script>--%>
<%--<script src="<c:url value="/asset/host/mail/contact.js" />"></script>--%>

<%--<!-- Template Javascript -->--%>
<%--<script src="<c:url value="/asset/host/js/main.js" />"></script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <h4><a href="<c:url value="/become-a-host/index" />"><i class="fas fa-angle-left"></i></a><b>Lịch sử giao
            dịch</b></h4>
        <br>
        <div class="row searchdate" style="margin-left: 20px">
            <div class="col-2 bothang">
                <b>Từ: </b>
                <select class="thang" id="month1" name="month1" onchange="genderChanged(this)">
                    <option value="1">tháng 1</option>
                    <option value="2">tháng 2</option>
                    <option value="3">tháng 3</option>
                    <option value="4">tháng 4</option>
                    <option value="5">tháng 5</option>
                    <option value="6">tháng 6</option>
                    <option value="7">tháng 7</option>
                    <option value="8">tháng 8</option>
                    <option value="9">tháng 9</option>
                    <option value="10">tháng 10</option>
                    <option value="11">tháng 11</option>
                    <option value="12">tháng 12</option>
                </select>
            </div>
            <div class="col-1 bonam">
                <select class="nam1" name="year1" id="year1" onchange="genderChanged(this)">
                    <option value="2022">2022</option>
                    <option value="2021">2021</option>
                    <option value="2020">2020</option>
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016">2016</option>
                    <option value="2015">2015</option>
                    <option value="2014">2014</option>
                    <option value="2013">2013</option>
                    <option value="2012">2012</option>
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                </select>
            </div>
            <div class="col-2 bothang">
                <b>Đến: </b>
                <select class="thang2" name="month2" id="month2" onchange="genderChanged(this)">
                    <option value="1">tháng 1</option>
                    <option value="2">tháng 2</option>
                    <option value="3">tháng 3</option>
                    <option value="4">tháng 4</option>
                    <option value="5">tháng 5</option>
                    <option value="6">tháng 6</option>
                    <option value="7">tháng 7</option>
                    <option value="8">tháng 8</option>
                    <option value="9">tháng 9</option>
                    <option value="10">tháng 10</option>
                    <option value="11">tháng 11</option>
                    <option value="12">tháng 12</option>
                </select>
            </div>
            <div class="col-1 bonam">
                <select class="nam1" id="year2" name="year2" onchange="genderChanged(this)">
                    <option value="2022">2022</option>
                    <option value="2021">2021</option>
                    <option value="2020">2020</option>
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016">2016</option>
                    <option value="2015">2015</option>
                    <option value="2014">2014</option>
                    <option value="2013">2013</option>
                    <option value="2012">2012</option>
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                </select>
            </div>
        </div>
        <br>
        <div class="card-body">
            <div class="table-responsive">
                <c:choose>
                    <c:when test="${payments.size() > 0 }">
                        <table class="table" style="border-left: 1px solid #dee2e6;border-right: 1px solid #dee2e6;border-bottom: 1px solid #dee2e6;">
                            <thead class="">
                            <th width="50px"> STT</th>
                            <th width="20%">Mã giao dịch</th>
                            <th width="20%"> Thông tin đặt phòng</th>
                            <th>Tổng thanh toán</th>
                            <th>Thuế giao dịch</th>
                            <th>Thời gian</th>
                            <th>Trạng thái</th>
                            <th> Chức năng</th>

                            </thead>
                            <tbody id="noidung">
                            <c:forEach var="item" items="${payments }" varStatus="loop">
                                <tr> <td> ${loop.index +1 } </td>
                                    <td>${item.paymentId}</td>
                                    <td> <b><a href="<c:url value="/become-a-host/detailplace/${item.bookRoom.place.placeId }" />">
                                            ${item.bookRoom.place.name }</a></b><br>
                                        <i class="iaddress">
                                            <c:if test="${item.bookRoom.place.startDay != null && item.bookRoom.place.endDay != null}">
                                                Từ ${item.bookRoom.startDay.split("-")[2]} -
                                                ${item.bookRoom.startDay.split("-")[1]} -
                                                ${item.bookRoom.startDay.split("-")[0]} đến ${item.bookRoom.endDay.split("-")[2]} -
                                                ${item.bookRoom.endDay.split("-")[1]} -
                                                ${item.bookRoom.endDay.split("-")[0]}
                                                <br> </c:if> </i>
                                        <i class="iaddress">Khách hàng: <a
                                                href="/detail-account/${item.bookRoom.account.accountId }">${item.bookRoom.account.name }</a>
                                        </i><br> </td>
                                    <td class="chitiet"> $ ${item.totalPrice } </td>
                                    <td>  $ ${item.transactionFee} </td>
                                    <td> ${item.createTime.split(" ")[1]}
                                            ${item.createTime.split(" ")[0].split("-")[2]} -
                                            ${item.createTime.split(" ")[0].split("-")[1]} -
                                            ${item.createTime.split(" ")[0].split("-")[0]} </td>
                                    <td>${item.status}</td>
                                    <td class="ikajasa" style="text-align: center">
                                        <a href="/become-a-host/history/findById/${item.paymentId}" class="detail-payment">
                                            <i class="far fa-calendar-alt" style="font-size: 25px; color: green;"></i>
                                        </a>
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


<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

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
                    <input class="form-control" name="paymentId" id="paymentId" readonly>
                </div>
                <div class="form-group">
                    <label>Mã đặt phòng</label>
                    <input class="form-control" name="bookId" id="bookId" readonly>
                </div>
                <div class="form-group">
                    <label>Tên khách hàng</label>
                    <input class="form-control" name="name" id="name" readonly>
                </div>
                <div class="form-group">
                    <label>Tài khoản thanh toán</label>
                    <input class="form-control" name="email" id="email" readonly>
                </div>
                <div class="form-group">
                    <label>Tổng tiền thanh toán</label>
                    <input class="form-control" name="totalPrice" id="totalPrice" readonly>
                </div>
                <div class="form-group">
                    <label>Phí giao dịch</label>
                    <input class="form-control" name="transactionFee" id="transactionFee" readonly>
                </div>
                <div class="form-group">
                    <label>Thời gian thanh toán</label>
                    <input class="form-control" name="createTime" id="createTime" readonly>
                </div>
                <div class="form-group">
                    <label>Nội dung thanh toán</label>
                    <input class="form-control" name="description" id="description" readonly>
                </div>
                <div class="form-group">
                    <label>Tình trạng</label>
                    <input class="form-control" name="status" id="status" readonly>
                </div>
                <div class="form-group">
                    <label>Country Code</label>
                    <input class="form-control" name="countryCode" id="countryCode" readonly>
                </div>
                <div class="form-group">
                    <label>Postal Code</label>
                    <input class="form-control" name="postalCode" id="postalCode" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
</body>
</html>

