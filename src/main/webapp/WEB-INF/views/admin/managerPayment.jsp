<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>
        Quản Lý Mục Thuê
    </title>
    <%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
</head>

<body class="light-edition">
<div class="wrapper ">
    <%@ include file="/WEB-INF/views/admin/layout/sidebar.jsp" %>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example" style="background-color: darkslategrey !important;color:#fff">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="javascript:void(0)">QUẢN LÝ GIAO DỊCH</a>
                </div>

                <div class="collapse navbar-collapse justify-content-end">

                    <form action="/admin/manager-payment/page/1" method="post" class="navbar-form">
                        <div class="input-group no-border">
                            <input type="text" value="${search}" class="form-control" style="color: #fff" name="search" placeholder="Search...">
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


            <div class="row searchdate" style="margin-left: 20px">
                <div class="col-2 bothang">
                    <b>Từ: </b>
                    <select  id="month1" class="thang" name="month1" onchange="genderChanged(this)">
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
                <div class="col float-lg-right">
                    <a href="" class="btn btn-primary" id="exportCSV" style="float: right; margin-right: 50px">Xuất ra CSV</a>
                </div>

            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">

                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title ">Manager Payment</h4>
                                <p class="card-category"> Danh sách Giao Dịch</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <c:choose>
                                        <c:when test="${paymentList.size() > 0 }">
                                            <table class="table">
                                                <thead class=" text-primary">
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
                                                <c:forEach var="item" items="${paymentList }" varStatus="loop">
                                                    <tr> <td> ${loop.index +1 } </td>
                                                        <td>${item.paymentId}</td>
                                                        <td> <b><a href="<c:url value="/admin/manager-place/detail/${item.bookRoom.place.placeId }" />">
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
                                                                    href="/admin/detail-account/${item.bookRoom.account.accountId }">${item.bookRoom.account.name }</a>
                                                            </i><br> </td>
                                                        <td class="chitiet"> $ <fmt:formatNumber type="number" groupingUsed="true" value="${item.totalPrice }" /> </td>
                                                        <td>  $ <fmt:formatNumber type="number" groupingUsed="true" value="${item.transactionFee }" /> </td>
                                                        <td> ${item.createTime.split(" ")[1]}
                                                                ${item.createTime.split(" ")[0].split("-")[2]} -
                                                                ${item.createTime.split(" ")[0].split("-")[1]} -
                                                                ${item.createTime.split(" ")[0].split("-")[0]} </td>
                                                        <td>${item.status}</td>
                                                        <td class="ikajasa" style="text-align: center">
                                                            <a href="<c:url value="/admin/manager-payment/detail/${item.paymentId }" />"
                                                               class="editButton"><i class="material-icons detail">event_note</i></a>
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

<%--                                    <ul class="pagination modal-6">--%>
<%--                                        <c:if test="${currentPage > 1}">--%>
<%--                                            <li > <a href="/admin/manager-payment/page/${currentPage-1}?search=${search}&filter=${filter}" class="page-border-left">&laquo</a></li>--%>
<%--                                        </c:if>--%>
<%--                                        <c:forEach begin="1" end="${totalPages }" varStatus="loop">--%>
<%--                                            <c:if test="${currentPage == loop.index}">--%>
<%--                                                <li > <a href="/admin/manager-payment/page/${loop.index}?search=${search}&filter=${filter}" class="active">${loop.index }</a></li>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${currentPage != loop.index}">--%>
<%--                                                <li ><a href="/admin/manager-payment/page/${loop.index}?search=${search}&filter=${filter}" >${loop.index }</a></li>--%>
<%--                                            </c:if>--%>
<%--                                        </c:forEach>--%>
<%--                                        <c:if test="${currentPage < totalPages}">--%>
<%--                                            <li > <a href="/admin/manager-payment/page/${currentPage+1}?search=${search}&filter=${filter}" class="page-border-right">&raquo;</a></li>--%>
<%--                                        </c:if>--%>
<%--                                    </ul>--%>
                                </div>
                            </div>
                        </div>
                    </div>
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

        jQuery('table .editButton').click(function (evt) {
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

    function genderChanged(obj)
    {
        var month1 = document.getElementById('month1').value;
        var year1 = document.getElementById('year1').value;
        var month2 = document.getElementById('month2').value;
        var year2 = document.getElementById('year2').value;

        console.log(month1)
        console.log(year1)
        console.log(month2)
        console.log(year2)

        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/admin/manager-payment/search",
            data: {
                month1: month1,
                year1: year1,
                month2: month2,
                year2: year2,
            },
            timeout: 2000,
            success: function (data) {
                console.log("SUCCESS: ");
                let html = '';
                var i = 0;
                $.each(data, function(i, item) {
                    i++;
                    html += '<tr> <td>'+i+'</td>'
                        + '<td>'+item.paymentId+'</td>'
                        + ' <td> <b><a href="/admin/manager-place/detail/'+item.bookRoom.place.placeId+'">'
                        + ' '+item.bookRoom.place.name +'</a></b><br>'
                        + '<i class="iaddress">'
                        + 'Từ '+item.bookRoom.startDay.split("-")[2]+'-'
                        + item.bookRoom.startDay.split("-")[1]+'-'
                        + item.bookRoom.startDay.split("-")[0]+'đến'+item.bookRoom.endDay.split("-")[2] +'-'
                        + item.bookRoom.endDay.split("-")[1]+'-'
                        + item.bookRoom.endDay.split("-")[0]
                        + '<i class="iaddress">Khách hàng: <a href="/admin/detail-account/'+item.bookRoom.account.accountId +'">'+item.bookRoom.account.name +'</a>'
                        + '</i><br> </td>'
                        + '<td class="chitiet"> $ '+item.totalPrice +'</td>'
                        + '<td>  $ '+item.transactionFee +'</td>'
                        + '<td> '+item.createTime.split(" ")[1]+ ' '
                        + item.createTime.split(" ")[0].split("-")[2]+'-'
                        + item.createTime.split(" ")[0].split("-")[1]+'-'
                        + item.createTime.split(" ")[0].split("-")[0]+'</td>'
                        + '<td>'+item.status+'</td><td class="ikajasa" style="text-align: center">'
                        + '<a href="/admin/manager-payment/detail/'+item.paymentId+'" class="editButton">'
                        + '<i class="material-icons detail">event_note</i>'
                        + '</a>'
                        + '</td>'
                        + '</tr>';

                });
                document.getElementById("noidung").innerHTML = html;
                $('table .editButton').click(function (e) {
                    e.preventDefault();
                    console.log("OK")
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
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });

        // window.location.href = "/become-a-host/history/search?month1="+month1+"&year1="+year1+"&month2="+month2+"&year2="+year2;
    }

    $(document).ready(function() {

        jQuery('#exportCSV').click(function(evt) {
            evt.preventDefault();
            var month1 = document.getElementById('month1').value;
            var year1 = document.getElementById('year1').value;
            var month2 = document.getElementById('month2').value;
            var year2 = document.getElementById('year2').value;

            console.log(month1)
            console.log(year1)
            console.log(month2)
            console.log(year2)

            window.location.href = "/admin/manager-payment/export/excel?month1="+month1+"&year1="+year1+"&month2="+month2+"&year2="+year2;
            //

        });
    });

</script>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
</body>
</html>"