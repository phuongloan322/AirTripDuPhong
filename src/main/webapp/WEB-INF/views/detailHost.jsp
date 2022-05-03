<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manager Account</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">

    <%--Hien thi Modal--%>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <%----%>
</head>
<body style="background: #fff !important">
<%@ include file="/WEB-INF/views/layouts/header2.jsp" %>

<div class="w-detail" style="width: 100%">
    <div class="container" style="width: 1400px !important">
        <h3><b>${detailPlace.name }</b></h3>
        <div class="ileft">
            <div class="tomtat">
                <div class="anhdaidien">
                    <c:choose>
                        <c:when test="${accLogin.image != null }">
                            <img width="200px" height="200px" class="anhdaidien" alt=""
                                 src="<c:url value="/asset/images/${accLogin.image }" />">
                        </c:when>
                        <c:otherwise>
                            <img width="200px" height="200px" class="anhdaidien" alt=""
                                 src="<c:url value="/asset/images/a1.jpg" />">
                        </c:otherwise>
                    </c:choose>
                    <br><br>
                    <a class="capnhatanh" href="" data-toggle="modal" data-target="#modalThem">Cập nhât ảnh</a>
                    <hr>
                    <c:if test="${account.isIdentity == false}">
                         <h4><i class="fas fa-exclamation"></i>${account.name } chưa xác nhận danh tính</h4>
                    </c:if>
                    <c:if test="${account.isIdentity == true}">
                        <span><i class="fas fa-check"></i></span> <h4>${account.name } đã xác nhận danh tính</h4>
                    </c:if>

                </div>
            </div>
        </div>
        <div class="iright">
            <h2>Xin chào, tôi là ${account.name }</h2>
            <p>Bắt đầu tham gia vào tháng ${account.createDate.split("-")[1]} năm ${account.createDate.split("-")[0]}</p>

            <hr>

            <h3>Giới thiệu</h3>
            <br>
            <div class="introduce">
                <p><i class="fas fa-user"></i>Tôi tên là ${account.name}</p>
                <p><i class="fas fa-home"></i> Sống tại ${account.address}</p>
                <p><i class="fas fa-phone"></i> Số điện thoại liên hệ ${account.phone}</p>
                <p><i class="fas fa-envelope"></i> Email liên hệ ${account.email}</p>
                <p><i class="fas fa-clipboard"></i> ${account.introduce}</p>
            </div>

            <hr>
            <h3>Nhà/phòng cho thuê</h3>
            <table class="table itable" style="max-width: 100%">
                <tr>
                <c:choose>
                    <c:when test="${placeById.size() > 0 }">
                        <c:forEach var="item" items="${placeById }" varStatus="loop">
                            <c:forEach var="rate" items="${ratings }" varStatus="i">
                                <c:if test="${(loop.index == 0 || loop.index == 1 || loop.index == 2) && loop.index == i.index}">
                                    <input id="ed" value="${ item.placeId }" hidden/>
                                    <td style="min-width: 270px; max-width: 270px">
                                        <div class="iPlace" style="margin: 0">
                                            <div class="aa">
											<span class="con1">
												 <c:choose>
                                                     <c:when test="${!Cart.containsKey(item.placeId) }">
														<a data-id="${item.placeId }">
															<i class="fas fa-heart" id="item-${ item.placeId }"
                                                               style="color:white"></i>
														</a>
                                                     </c:when>
                                                     <c:otherwise>
														<a data-id="${item.placeId }">
															<i class="fas fa-heart" id="item-${ item.placeId }"
                                                               style="color:red"></i>
														</a>
                                                     </c:otherwise>
                                                 </c:choose>
											</span>
                                                <img src="/asset/images/${item.images[0].name }" alt="" width="260px">
                                            </div>
                                            <div class="label1">
                                                <i class="fas fa-star"></i>${rate}
                                                <a href="/detailplace/${item.placeId }">
                                                    <b class="textoverflow1" style="color:#1a2035">${item.name }</b>
                                                </a>
                                                <span class="textoverflow1">${item.address}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <c:if test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1) == placeList.size() }">
                                        </tr>
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
            </table>
            <table class="table itable" style="max-width: 100%;display: none;"  id="more">
                <tr>
                <div>
                    <c:forEach var="item" items="${placeById }" varStatus="loop">
                        <c:forEach var="rate" items="${ratings }" varStatus="i">
                            <c:if test="${(loop.index > 2) && loop.index == i.index}">
                                <input id="ed" value="${ item.placeId }" hidden/>
                                <td style="min-width: 270px; max-width: 270px">
                                    <div class="iPlace" style="margin: 0">
                                        <div class="aa">
											<span class="con1">
												 <c:choose>
                                                     <c:when test="${!Cart.containsKey(item.placeId) }">
														<a data-id="${item.placeId }">
															<i class="fas fa-heart" id="item-${ item.placeId }"
                                                               style="color:white"></i>
														</a>
                                                     </c:when>
                                                     <c:otherwise>
														<a data-id="${item.placeId }">
															<i class="fas fa-heart" id="item-${ item.placeId }"
                                                               style="color:red"></i>
														</a>
                                                     </c:otherwise>
                                                 </c:choose>
											</span>
                                            <img src="/asset/images/${item.images[0].name }" alt="" width="260px">
                                        </div>
                                        <div class="label1">
                                            <i class="fas fa-star"></i>${rate}
                                            <a href="/detailplace/${item.placeId }">
                                                <b class="textoverflow1" style="color:#1a2035">${item.name }</b>
                                            </a>
                                            <span class="textoverflow1">${item.address}</span>
                                        </div>
                                    </div>
                                </td>
                                <c:if test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1) == placeList.size() }">
                                    </tr>
                                </c:if>
                            </c:if>

                        </c:forEach>
                    </c:forEach>
                </div>
            </table>

            <u id="xemthem">Xem tất cả nhà/phòng</u>
    <hr>
    <div>
        <h3><i class="fas fa-star"></i> ${reviewById.size()} đánh giá</h3><br>
        <c:choose>
            <c:when test="${reviewById.size() > 0}">
                <c:forEach var="item" items="${reviewById}">
                    <div class="item-review">
                        <div class="d-avt">
                            <div class="avt">
                                <img alt="" width="50px" height="50px" src="<c:url value="/asset/images/${item.account.image }" />">
                            </div>
                            <div class="right">
                                <b style="margin-right: 10px">${item.account.name }</b>
                                <c:forEach begin="1" end="${item.rate }" varStatus="loop">
                                    <i class="fas fa-star item-star"></i>
                                </c:forEach>
                                <p>${item.dateSubmit }</p>
                            </div>
                        </div>
                        <div class="d-avt">
                            <div style="min-width: 700px">
                                <h4>${item.place.name }</h4>
                                <p>${item.content }</p>
                            </div>
                            <div class="right">
                                <img alt="" style="border-radius: 10px" width="90px" height="60px" src="<c:url value="/asset/images/${item.place.images[0].name }" />">
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>Không có đánh giá nào...</p>
            </c:otherwise>
        </c:choose>

    </div>

    </div>
</div>


<script type="text/javascript">

</script>
<script>
    document.getElementById("xemthem").onclick = function () {
        var x = document.getElementById('more');
        if (x.style.display === 'none') {
            x.style.display = 'block';
            document.getElementById("xemthem").innerText = "Ẩn xem thêm";
        } else {
            x.style.display = 'none';
            document.getElementById("xemthem").innerText = "Xem tất cả nhà/phòng";
        }
    }
</script>
<br><br>

</body>
</html>