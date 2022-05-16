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
                    <option value="5" selected>tháng 5</option>
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
                <a href="" class="btn" id="exportCSV" style="float: right; margin-right: 50px;background-color: #1a2035; color:#fff">Xuất ra CSV</a>
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
                                    <td class="chitiet t1"> $ ${item.totalPrice } </td>
                                    <td class="t2">  $ ${item.transactionFee} </td>
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
            <div>
                <div class="row border card-body" style="margin: 20px auto">
                    <div class="col-2">
                        <p><b>Tổng thanh toán:</b></p>
                        <p><b>Tổng thuế:</b><br></p>
                        <p><b>Doanh thu:</b><br></p>
                    </div>
                    <div>
                        <p id="tongthanhtoan"></p>
                        <p id="tongthue"></p>
                        <p id="doanhthu"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<div class="modal" id="paymentModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document"  style="min-width: 600px !important;">
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
<script>

    var t1 = document.getElementsByClassName("t1");
    var tongtt = 0;
    for (let i = 0; i < t1.length; i++) {
        tongtt += parseFloat(t1[i].innerHTML.split("$")[1]);
    }
    console.log(tongtt);
    document.getElementById("tongthanhtoan").innerHTML = "$ "+tongtt;

    var t2 = document.getElementsByClassName("t2");
    var tongthue = 0;
    for (let i = 0; i < t2.length; i++) {
        tongthue += parseFloat(t2[i].innerHTML.split("$")[1]);
    }
    console.log(tongthue)
    document.getElementById("tongthue").innerHTML = "$ "+tongthue;

    const tongdoanhthu = parseFloat(tongtt) - parseFloat(tongthue);
    document.getElementById("doanhthu").innerHTML = "$ "+tongdoanhthu;

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
            url: "/become-a-host/history/search",
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
                        + ' <td> <b><a href="/become-a-host/detailplace/'+item.bookRoom.place.placeId+'">'
                        + ' '+item.bookRoom.place.name +'</a></b><br>'
                        + '<i class="iaddress">'
                        + 'Từ '+item.bookRoom.startDay.split("-")[2]+'-'
                        + item.bookRoom.startDay.split("-")[1]+'-'
                        + item.bookRoom.startDay.split("-")[0]+'đến'+item.bookRoom.endDay.split("-")[2] +'-'
                    + item.bookRoom.endDay.split("-")[1]+'-'
                    + item.bookRoom.endDay.split("-")[0]
                    + '<i class="iaddress">Khách hàng: <a href="/detail-account/'+item.bookRoom.account.accountId +'">'+item.bookRoom.account.name +'</a>'
                    + '</i><br> </td>'
                    + '<td class="chitiet t1"> $ '+item.totalPrice +'</td>'
                    + '<td class="t2">  $ '+item.transactionFee +'</td>'
                    + '<td> '+item.createTime.split(" ")[1]+ ' '
                    + item.createTime.split(" ")[0].split("-")[2]+'-'
                    + item.createTime.split(" ")[0].split("-")[1]+'-'
                    + item.createTime.split(" ")[0].split("-")[0]+'</td>'
                    + '<td>'+item.status+'</td><td class="ikajasa" style="text-align: center">'
                    + '<a href="/become-a-host/history/findById/'+item.paymentId+'" class="detail-payment">'
                    + '<i class="far fa-calendar-alt" style="font-size: 25px; color: green;"></i>'
                    + '</a>'
                    + '</td>'
                    + '</tr>';

                });
                document.getElementById("noidung").innerHTML = html;
                var t1 = document.getElementsByClassName("t1");
                var tongtt = 0;
                for (let i = 0; i < t1.length; i++) {
                    tongtt += parseFloat(t1[i].innerHTML.split("$")[1]);
                }
                document.getElementById("tongthanhtoan").innerHTML = "$ "+tongtt;

                var t2 = document.getElementsByClassName("t2");
                var tongthue = 0;
                for (let i = 0; i < t2.length; i++) {
                    tongthue += parseFloat(t2[i].innerHTML.split("$")[1]);
                }
                document.getElementById("tongthue").innerHTML = "$ "+tongthue;

                const tongdoanhthu = parseFloat(tongtt) - parseFloat(tongthue);
                document.getElementById("doanhthu").innerHTML = "$ "+tongdoanhthu;

                jQuery('.detail-payment').click(function (evt) {
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
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });

        // window.location.href = "/become-a-host/history/search?month1="+month1+"&year1="+year1+"&month2="+month2+"&year2="+year2;

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

	jQuery('.detail-payment').click(function (evt) {
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

            window.location.href = "/become-a-host/history/export/excel?month1="+month1+"&year1="+year1+"&month2="+month2+"&year2="+year2;
            //

        });
    });
</script>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
</body>
</html>
