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
    <style>
        .fa-check {
            width: 20px;
            height: 20px;
            color: green;
            /*background: green;*/
            border-radius: 50%;
            line-height: 20px;
            text-align: center;
            font-size: 16px;
            margin-right: 10px;
        }
        .fa-remove {
            width: 20px;
            height: 20px;
            /* background: darkred; */
            border-radius: 50%;
            line-height: 20px;
            text-align: center;
            font-size: 16px;
            margin-right: 10px;
        }
        .fa-hourglass {
            width: 20px;
            height: 20px;
            color: darkgoldenrod;
            /* background: darkred; */
            border-radius: 50%;
            line-height: 20px;
            text-align: center;
            font-size: 15px;
            margin-right: 10px;
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
                    <a class="navbar-brand" href="<c:url value="/admin/manager-account" />">QU???N L?? KH??CH H??NG</a>
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
                <b>Th??ng tin c?? b???n</b>
            </h3>
            <div class="row">
                <div class="col-8">
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <p style="font-weight: 400; font-size: 18px">H??? v?? t??n:</p>
                            <p style="font-weight: 400; font-size: 18px">Tr???ng th??i:</p>
                            <p style="font-weight: 400; font-size: 18px">Email:</p>
                            <p style="font-weight: 400; font-size: 18px">T??n ????ng nh???p:</p>
                            <p style="font-weight: 400; font-size: 18px">S??? ??i???n tho???i:</p>
                            <p style="font-weight: 400; font-size: 18px">?????a ch???:</p>
                            <p style="font-weight: 400; font-size: 18px">Ng??y t???o:</p>
                            <p style="font-weight: 400; font-size: 18px">Gi???i thi???u:</p>
                        </div>
                        <div class="col-6 detailaccount">
                            <p style="font-weight: 300; font-size: 18px">

                                    ${account.name}
                            </p>
                            <c:if test="${account.isIdentity == true}">
                                <p style="font-weight: 300; font-size: 18px">???? x??c nh???n danh t??nh
                                    <i class="fas fa-check"></i></p>
                            </c:if>
                            <c:if test="${account.isIdentity == false}">
                                <p style="font-weight: 300; font-size: 18px">Ch??a x??c nh???n danh t??nh
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
                    <img src="/asset/images/${account.image}" width="200px" height="200px" style="border-radius: 50%; border: 1px solid #909090">
                </div>
            </div>
            <hr>
            <h3><b><i class="fas fa-home"></i> Danh s??ch nh??/ph??ng cho thu?? (${places.size()})</b></h3><br>
            <div class="row">
                <c:choose>
                    <c:when test="${places.size() > 0 }">
                        <c:forEach var="item" items="${places }" varStatus="loop">
                            <c:forEach var="rate" items="${ratings }" varStatus="i">
                                <c:if test="${(loop.index == 0 || loop.index == 1 || loop.index == 2 || loop.index == 3) && loop.index == i.index}">
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
                        <p style="margin-left: 30px"><b>Kh??ng t??m th???y k???t qu??? n??o</b></p>
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
            <c:if test="${places.size() > 4}" >
                <u id="xemthem">Xem t???t c??? nh??/ph??ng</u>
            </c:if>
            <br><br><br>
            <hr>
            <h3><b><i class="fas fa-check" style="margin-right: 10px"></i>Th??ng tin ?????t ph??ng (${bookroomList.size()})</b></h3><br>
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
                                    Th??ng tin nh??/ph??ng
                                </th>
                                <th>
                                    Ch??? nh??
                                </th>
                                <th>
                                    Chi ti???t thu??
                                </th>
                                <th>
                                    T??nh tr???ng
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
                                            <i class="iaddress"><b>$ ${item.place.price } / ????m</b></i>
                                        </td>
                                        <td>
                                            <a href="/admin/detail-account/${item.place.account.accountId}"> ${item.place.account.name }<br></a>
                                            S??t: ${item.place.account.phone }
                                        </td>
                                        <td class="chitiet">
                                            <c:if test="${item.place.startDay != null && item.place.endDay != null}">
                                                Ng??y b???t ?????u: ${item.startDay.split("-")[2]} -
                                                ${item.startDay.split("-")[1]} -
                                                ${item.startDay.split("-")[0]}
                                                <br>
                                                Ng??y k???t th??c: ${item.endDay.split("-")[2]} -
                                                ${item.endDay.split("-")[1]} -
                                                ${item.endDay.split("-")[0]}
                                                <br>
                                            </c:if>
                                            T???ng ti???n thu??: $${item.totalPrice }<br>
                                            S??? ng?????i: ${item.people }
                                        </td>
                                        <td >
                                            <c:choose>
                                                <c:when test="${item.isAccept == 0 }">
                                                    <div class="upcomingstatus" >
                                                        <i class="fas fa-hourglass"></i> Ch??? x??c nh???n
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="daxacnhan">
                                                        <c:choose>
                                                            <c:when test="${item.isAccept == 1 && item.isPayment == false}">
                                                                <div class="row">
                                                                    <div class="col" style="margin-top: 10px">
                                                                        <a class="b-accept"><i class="fas fa-check" style="color: #222"></i>????
                                                                            x??c nh???n</a>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${item.isAccept == 1 && item.isPayment == true}">
                                                                <div class="row">
                                                                    <div class="col" style="margin-top: 10px">
                                                                        <a class="b-accept"><i class="fas fa-check"></i>????
                                                                            thanh to??n</a>
                                                                    </div>
                                                                    <div>
                                                                        <a href="#" class="nav-link test"
                                                                           data-toggle="dropdown"></a>
                                                                        <div class="dropdown-menu">
                                                                            <a data-id="${item.bookId }"
                                                                               href="/admin/show-payment/${item.bookId }"
                                                                               class="dropdown-item show-payment">Xem giao
                                                                                d???ch</a>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${item.isAccept == -1}">
                                                                <div class="row">
                                                                    <div class="col" style="margin-top: 10px">
                                                                        <a class="b-accept"><i class="fas fa-remove"></i>????
                                                                            t??? ch???i</a>
                                                                    </div>
                                                                    <div>
                                                                        <a href="#" class="nav-link test"
                                                                           data-toggle="dropdown"></a>
                                                                        <div class="dropdown-menu">
                                                                            <a data-id="${item.bookId }"
                                                                               href="/show-reason/${item.bookId }"
                                                                               class="dropdown-item showcancel">Xem nguy??n
                                                                                nh??n</a>
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
                            <p><b>Kh??ng t??m th???y k???t qu??? n??o</b></p>
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
                <p class="modal-title"><b style="font-size: 17px">L???ch s??? thanh to??n</b></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <label>M?? giao d???ch</label>
                <input class="form-control-file" name="paymentId" id="paymentId" readonly>


                <label>M?? ?????t ph??ng</label>
                <input class="form-control-file" name="bookId" id="bookId" readonly>


                <label>T??n kh??ch h??ng</label>
                <input class="form-control-file" name="name" id="name" readonly>


                <label>T??i kho???n thanh to??n</label>
                <input class="form-control-file" name="email" id="email" readonly>


                <label>T???ng ti???n thanh to??n (USD)</label>
                <input class="form-control-file" name="totalPrice" id="totalPrice" readonly>


                <label>Ph?? giao d???ch (USD)</label>
                <input class="form-control-file" name="transactionFee" id="transactionFee" readonly>


                <label>Th???i gian thanh to??n</label>
                <input class="form-control-file" name="createTime" id="createTime" readonly>


                <label>N???i dung thanh to??n</label>
                <input class="form-control-file" name="description" id="description" readonly>


                <label>T??nh tr???ng</label>
                <input class="form-control-file" name="status" id="status" readonly>


                <label>Country Code</label>
                <input class="form-control-file" name="countryCode" id="countryCode" readonly>


                <label>Postal Code</label>
                <input class="form-control-file" name="postalCode" id="postalCode" readonly>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">????ng</button>
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
            document.getElementById("xemthem").innerText = "???n xem th??m";
        } else {
            x.style.display = 'none';
            document.getElementById("xemthem").innerText = "Xem t???t c??? nh??/ph??ng";
        }
    }
</script>
</body>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>

</html>