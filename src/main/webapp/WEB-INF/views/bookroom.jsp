<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Book Room</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
    <%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="<c:url value="/asset/images/favicon.ico" />">
    <link rel="shortcut icon" href="<c:url value="/asset/images/favicon.ico" />"/>
    <link rel="stylesheet" href="<c:url value="/asset/booking/css/booking.css" />">
    <link rel="stylesheet" href="<c:url value="/asset/css/camera.css" />">
    <link rel="stylesheet" href="<c:url value="/asset/css/owl.carousel.css" />">
    <link rel="stylesheet" href="<c:url value="/asset/css/style.css" />">
    <link rel="stylesheet" href="<c:url value="/asset/css/airtrip.css" />">
    <script src="<c:url value="/asset/js/script.js" />"></script>
    <script src="<c:url value="/asset/js/owl.carousel.js" />"></script>
    <script src="<c:url value="/asset/js/camera.js" />"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script src="<c:url value="/asset/booking/js/booking.js" />"></script>

</head>
<body>
<!--==============================header=================================-->
<header class="slidego">
    <div class="i-head">
        <div class="row">
            <div class="col-sm-3">
                <div class="logo pull-left">
                    <div style="margin-top: 30px">
                        <a href="<c:url value="/places" />"><b class="head3" style="color: #ef4365; ">
                            <i class="fas fa-cannabis" style="margin-right: 10px;margin-top: -5px"></i>AirTrip</b>
                        </a>
                    </div>
                </div>

            </div>
            <div class="col-sm-6 pull-left">
                <form action="/places/page/1" method="post" width="100%">
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input type="text" name="search" value="${search}" class="search-query form-control" placeholder="T??m ki???m nh?? / ph??ng mong mu???n..." />
                            <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                        </div>
                    </div>
                </form>
            </div>
            <%@ include file="/WEB-INF/views/layouts/menu.jsp" %>
        </div>
    </div>
    <!--
    <div class="container_12">

        <div class="grid_12">
            <h1>
                <a href="index.html">
                    <img src="asset/images/logo.png" alt="Your Happy Family">
                </a>
            </h1>
        </div>
    </div> -->
</header>
<!--==============================Content=================================-->
<div class="content">
    <div class="container">
        <p class="go-head">Chuy???n ??i</p>
        <hr>
        <br>
        <ul class="ds">
            <c:if test="${chooseBooking.equals(\"all\")}">
                <li><a href="/bookroom" class="itemmenu active">T???t c???</a></li>
            </c:if>
            <c:if test="${!chooseBooking.equals(\"all\")}">
                <li><a href="/bookroom" class="itemmenu">T???t c???</a></li>
            </c:if>
            <c:if test="${chooseBooking.equals(\"noaccept\")}">
                <li><a href="/bookroom/noAccept" class="itemmenu active">Ch??a x??c nh???n</a></li>
            </c:if>
            <c:if test="${!chooseBooking.equals(\"noaccept\")}">
                <li><a href="/bookroom/noAccept" class="itemmenu">Ch??a x??c nh???n</a></li>
            </c:if>
            <c:if test="${chooseBooking.equals(\"accept\")}">
                <li><a href="/bookroom/isAccept" class="itemmenu active">???? x??c nh???n</a></li>
            </c:if>
            <c:if test="${!chooseBooking.equals(\"accept\")}">
                <li><a href="/bookroom/isAccept" class="itemmenu">???? x??c nh???n</a></li>
            </c:if>
            <c:if test="${chooseBooking.equals(\"review\")}">
                <li><a href="/bookroom/finish" class="itemmenu active">Ho??n th??nh</a></li>
            </c:if>
            <c:if test="${!chooseBooking.equals(\"review\")}">
                <li><a href="/bookroom/finish" class="itemmenu">Ho??n th??nh</a></li>
            </c:if>
            <c:if test="${chooseBooking.equals(\"cancel\")}">
                <li><a href="/bookroom/cancel" class="itemmenu active">???? hu???</a></li>
            </c:if>
            <c:if test="${!chooseBooking.equals(\"cancel\")}">
                <li><a href="/bookroom/cancel" class="itemmenu">???? hu???</a></li>
            </c:if>

        </ul>
        <table class="table itable">
            <c:choose>
                <c:when test="${bookroomList.size() > 0 }">
                    <c:forEach var="item" items="${bookroomList }">
                        <tr class="gachduoi" id="item-${item.bookId }">
                            <td class="item1"><a href="<c:url value="/detailplace/${item.place.placeId }" />">
                                <img src="<c:url value="/asset/images/${item.place.images[0].name }" />" width="426px0" height="284px"></a>
                            </td>
                            <td class="chung1 c2">
                                <a href="<c:url value="/detailplace/${item.place.placeId }" />"><b
                                        class="i1">${item.place.name }</b></a>
                                <br>
                                    ${item.place.address }
                                <c:if test="${item.startDay != null && item.endDay != null}">
                                    <c:if
                                            test="${item.startDay.split(\"-\")[1] == item.endDay.split(\"-\")[1]}">
                                        <div class="day-place">Ng??y
                                                ${item.startDay.split("-")[2]} - Ng??y
                                                ${item.endDay.split("-")[2]} th??ng
                                                ${item.startDay.split("-")[1]}</div>
                                    </c:if>
                                    <c:if
                                            test="${item.startDay.split(\"-\")[1] != item.endDay.split(\"-\")[1]}">
                                        <div class="day-place">Ng??y
                                                ${item.startDay.split("-")[2]} /
                                                ${item.startDay.split("-")[1]} - Ng??y
                                                ${item.endDay.split("-")[2]}
                                            / ${item.endDay.split("-")[1]}</div>
                                    </c:if>
                                </c:if>
                                <br>
                                <b class="i1">$ <fmt:formatNumber type="number" groupingUsed="true" value="${item.place.price }" /></b>  / ????m
                                <br>
                                <br>
                                <b class="i1">T???ng gi?? thu??:
                                    $ <fmt:formatNumber type="number" groupingUsed="true" value="${item.totalPrice }" />
                                </b>
                                <br>
                                <br>
                                <b class="i1">S??? ng?????i: ${item.people }</b>
                                <br><br>

                                <c:choose>
                                    <c:when test="${item.isPayment == true && item.isReview == false}">
                                <a href="<c:url value="/post-review/${item.bookId }/${item.place.placeId }" />"
                                   class="b-accept" id="addButton">
                                    ????nh gi??
                                </a>
                                    </c:when>
                                    <c:when test="${item.isPayment == true && item.isReview == true}">
                                            <button type="button" class="a-accept">???? ????nh gi??</button>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${item.isAccept == 1}">
                                                <a class="b-accept" href="/payment/${item.bookId}">Thanh to??n</a>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${item.isAccept == 0}">
                                                        <a data-id="${item.bookId }" class="a-accept huyphong">H???y ?????t ph??ng</a>
                                                    </c:when>
                                                    <c:when test="${item.isAccept == -1}">
                                                        <div>
                                                            <a data-id="${item.bookId }" class="a-accept">???? h???y</a>
                                                            <a data-id="${item.bookId }" href="/show-reason/${item.bookId }"
                                                               class="showcancel xem-reason" >Xem nguy??n nh??n</a>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>

<%--                                    <c:when test="${item.isAccept == 0 && item.isReview == false }">--%>
<%--                                        <a data-id="${item.bookId }" class="a-accept huyphong">H???y ?????t ph??ng</a>--%>
<%--                                    </c:when>--%>
<%--                                    <c:when test="${item.isAccept == -1 && item.isReview == false }">--%>
<%--                                        <a data-id="${item.bookId }" class="a-accept huyphong">???? h???y</a>--%>
<%--                                        <a data-id="${item.bookId }" href="/show-reason/${item.bookId }"--%>
<%--                                           class="showcancel a-accept" style="margin-left: 100px">Xem nguy??n nh??n</a>--%>
<%--                                    </c:when>--%>
<%--                                    <c:when test="${item.isAccept == 1 && item.isReview == false && review != null}">--%>
<%--                                        <a href="<c:url value="/post-review/${item.bookId }/${item.place.placeId }" />"--%>
<%--                                           class="b-accept" id="addButton">--%>
<%--                                            ????nh gi??--%>
<%--                                        </a>--%>
<%--                                    </c:when>--%>
<%--                                    <c:when test="${item.isAccept == 1 &&item.isReview == true}">--%>
<%--                                        <button type="button" class="a-accept">--%>
<%--                                            ???? ????nh gi??--%>
<%--                                        </button>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <a class="b-accept" href="/payment/${item.bookId}">Thanh to??n</a>--%>
<%--                                    </c:otherwise>--%>
                                </c:choose>
                            </td>

                        </tr>
                        <script>var x =
                        ${item.bookId }    </script>

                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>B???n ch??a c?? chuy???n ??i n??o ??? nh??ng khi b???n c??, c??c chuy???n ??i ???? s??? xu???t hi???n t???i ????y.</p>
                    <br><br>
                    <a href="<c:url value="/places" />" class="l-start">B???t ?????u kh??m ph??</a>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>

<!-- Modal ADD-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title" id="exampleModalLabel">????nh gi??</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="myFormId">
                    <div class="rate">
                        <input class="star star-5" id="star-5" type="radio" value="5" name="rate"/>
                        <label class="star star-5" for="star-5"></label>
                        <input class="star star-4" id="star-4" type="radio" value="4" name="rate"/>
                        <label class="star star-4" for="star-4"></label>
                        <input class="star star-3" id="star-3" type="radio" value="3" name="rate"/>
                        <label class="star star-3" for="star-3"></label>
                        <input class="star star-2" id="star-2" type="radio" value="2" name="rate"/>
                        <label class="star star-2" for="star-2"></label>
                        <input class="star star-1" id="star-1" type="radio" value="1" name="rate"/>
                        <label class="star star-1" for="star-1"></label>
                    </div>
                    <br>
                    <textarea rows="5" cols="3" name="content" maxlength="254"></textarea>
                    <br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tho??t</button>
                        <button type="submit" class="btn review">????nh gi??</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title">X??c nh???n h???y ph??ng</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>B???n c?? ch???c ch???n mu???n h???y ph??ng?</p>
            </div>
            <div class="modal-footer">
                <a class="btn" id="confirmDeleteButton">H???y ph??ng</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">????ng</button>
            </div>
        </div>
    </div>
</div>


<div class="modal" id="showReasonModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p class="modal-title"><b style="font-size: 17px">Nguy??n nh??n h???y ph??ng</b></p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input class="form-control reason1" id="reason">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">????ng</button>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#addButton').on('click', function () {
            event.preventDefault();
            var href = $(this).attr('href');
            jQuery.noConflict();
            $('#myFormId').attr('action', href);
            $('#addModal').modal();
        });
    });
</script>
<!--==============================footer=================================-->
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>

<script>


    jQuery('.showcancel').click(function (evt) {
        evt.preventDefault();
        var href = $(this).attr('href')
        $.get(href, function (data, status) {
            $('#reason').val(data.reason);
        });
        $('#showReasonModal').modal();
    });

    jQuery('.huyphong').click(function (evt) {
        evt.preventDefault();

        $('#deleteModal').modal();

        var bookId = jQuery(this).attr("data-id");
        var item = 'item-' + bookId;
        console.log(bookId);
        console.log(item);
        jQuery('#confirmDeleteButton').click(function (evt) {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/DeleteBookRoom",
                data: {
                    bookId: bookId,
                },
                timeout: 2000,
                success: function () {
                    console.log("SUCCESS: ");
                    location.reload();
                    document.getElementById(item).style.display = "none";
                },
                error: function (e) {
                    console.log("ERROR: ", e);
                    location.reload();
                }
            });
        });
    });

</script>

</body>
</html>