<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Love place</title>
		<script src="https://kit.fontawesome.com/a076d05399.js"></script>
		
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<script>$(document).ready(function(){
			$().UItoTop({ easingType: 'easeOutQuart' });
		});
		</script>

		<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

		<style>
			#map {
				height: 630px;
				width: 96%;
			}
		</style>
	</head>
	<body class="body1">
<!--==============================header=================================-->
	<div class="head1">
		<div class="head2">
			<div class="float-left">
				<div style="">
					<a href="<c:url value="/index" />"><b class="head3" style="color: #ef4365; ">
						<i class="fas fa-cannabis" style="margin-right: 10px;margin-top: 20px"></i>AirTrip</b>
					</a>
				</div>
			</div>
			<div class="float-right">
				
			</div>
		</div>
	</div>
	<div class="ha">

		<div class="content1">
			<div class="float-left map1">
				<div>
					<a href="<c:url value="/places" />"><i class="fas fa-arrow-left"></i></a>
				</div><br>
				<h3><b>Danh sách yêu thích</b></h3>
				<br>
				<c:choose>
					<c:when test="${Cart.size() > 0 }">
						<table>
							<tbody>
								<c:forEach var="item" items="${Cart }">
										<tr class="gachduoi">
											<td class="item1"><a href="<c:url value="/detailplace/${item.value.placeId }" />">
												<img src="asset/images/${item.value.getImages().get(0).name}" alt=""></a>
											</td>
											<td class="chung1 loveplace">
												<a href="<c:url value="/detailplace/${item.value.placeId }" />"><b class="i1">${item.value.name }</b></a>
												<br>
												<p class="address">${item.value.address }</p>
												<c:if test="${item.value.startDay != null && item.value.endDay != null}">
													<c:if
														test="${item.value.startDay.split(\"-\")[1] == item.value.endDay.split(\"-\")[1]}">
														<div class="day-place">Ngày
															${item.value.startDay.split("-")[2]} - Ngày
															${item.value.endDay.split("-")[2]} tháng
															${item.value.startDay.split("-")[1]}</div>
													</c:if>
													<c:if
														test="${item.value.startDay.split(\"-\")[1] != item.value.endDay.split(\"-\")[1]}">
														<div class="day-place">Ngày
															${item.value.startDay.split("-")[2]} /
															${item.value.startDay.split("-")[1]} - Ngày
															${item.value.endDay.split("-")[2]} / ${item.value.endDay.split("-")[1]}</div>
													</c:if>
												</c:if>
												<br>
												<b class="i1">$ ${item.value.price }</b> / đêm
												<br>
												Tình trạng phòng:
												<c:choose>
													<c:when test="${item.value.isEmpty == false }">
														Đã hết
													</c:when>
													<c:otherwise>Còn trống</c:otherwise>
												</c:choose>
											</td>
											<td class="chung1">
												<a href="AddLovePlace/${item.value.placeId }"><i class="fas fa-heart" style="color:red" ></i></a>

											</td>
										</tr>

								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
					<p class="l-no">Chưa có nội dung nào được lưu</p><br>
					<p>Khi bạn tìm thấy nội dung mình thích, hãy nhấp vào biểu tượng trái tim để lưu nội dung đó. Nếu bạn đang lên kế hoạch cho một chuyến đi cùng nhiều người khác, hãy mời họ để họ có thể lưu và bình chọn những mục mà họ yêu thích.</p>
					<br><br>
					<a href="<c:url value="/places" />" class="l-start">Bắt đầu khám phá</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="float-right map2">
				<div class="detailmap">
					<div id="map"></div>
				</div>
			</div>
		</div>
	</div>
	</body>

<%--	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"--%>
<%--			defer--%>
<%--	></script>--%>
	<%@ include file="/WEB-INF/views/layouts/keyMapAPI.jsp" %>
	<script src="/asset/map/love.js" ></script>
</html>