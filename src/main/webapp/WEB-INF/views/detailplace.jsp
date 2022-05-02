<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Detail Place</title>
		<script src="https://kit.fontawesome.com/a076d05399.js"></script>		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
		<%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

		<style>
			#map {
				height: 500px;
				width: 1000px;
			}

			input[type=text] {
				background-color: #fff;
				border: 0;
				border-radius: 2px;
				box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
				margin: 10px;
				padding: 0 0.5em;
				font: 400 18px Roboto, Arial, sans-serif;
				overflow: hidden;
				line-height: 40px;
				margin-right: 0;
				min-width: 25%;
			}

			input[type=button] {
				background-color: #fff;
				border: 0;
				border-radius: 2px;
				box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
				margin: 10px;
				padding: 0 0.5em;
				font: 400 18px Roboto, Arial, sans-serif;
				overflow: hidden;
				height: 40px;
				cursor: pointer;
				margin-left: 5px;
			}
			input[type=button]:hover {
				background: rgb(235, 235, 235);
			}
			input[type=button].button-primary {
				background-color: #1a73e8;
				color: white;
			}
			input[type=button].button-primary:hover {
				background-color: #1765cc;
			}
			input[type=button].button-secondary {
				background-color: white;
				color: #1a73e8;
			}
			input[type=button].button-secondary:hover {
				background-color: #d2e3fc;
			}

		</style>
	</head>
	<body style="background: #fff !important">
	<%@ include file="/WEB-INF/views/layouts/header2.jsp" %>	
	<div class="w-detail">
		<div>
			<div>
				<p class="d1">${detailPlace.name }</p>
				<p class="d2" ><a href="" class="setw"><i id="inputaddress">${detailPlace.address }</i></a></p>
			</div>
			<div>
				<table class="dtable" style="width:100%">
				  <tr>
				    <th rowspan="2" width="50%" height="100%"><img src="<c:url value="/asset/images/${detailPlace.images[0].name }" />" height="100%" ></th>
				    <td width="25%" height="50%"><img src="<c:url value="/asset/images/${detailPlace.images[1].name }" />" height="100%"  ></td>
				    <td width="25%" height="50%"><img src="<c:url value="/asset/images/${detailPlace.images[2].name }" />" height="100%" ></td>
				  </tr>
				  <tr>
				    <td width="25%" height="50%"><img src="<c:url value="/asset/images/${detailPlace.images[3].name }" />" height="100%" ></td>
				    <td width="25%" height="50%"><img src="<c:url value="/asset/images/${detailPlace.images[4].name }" />" height="100%" ></td>
				  </tr>
				</table>
				<br>
				<div style="width: 100%">
					<div class="dleft">
						<p class="dtieude">${Category.name}. ${lilteCategory.litleName }</p>
						<div>${detailPlace.detailPlace.phongkhach } khách,
							${detailPlace.detailPlace.phongngu } phòng ngủ ,
							${detailPlace.detailPlace.giuong } giường,
							${detailPlace.detailPlace.phongvs } phòng vệ sinh</div>
						<hr>
						<p class="d-detail">${lilteCategory.detail }</p>
						<hr>
						<p class="dtiennghi">Nơi này có những gì cho bạn</p>

<%--						<ul class="d-ul">--%>
<%--							<c:forEach var="item" items="${detailPlace.detailPlace.tienich }"--%>
<%--								varStatus="loop">--%>
<%--								<li class="d-detail">${detailPlace.detailPlace.tienich[loop.index] }</li>--%>
<%--							</c:forEach>--%>
<%--						</ul>--%>
						
						<div class="info">
							<h4>Thông tin về chủ nhà</h4>
							<p>Họ và tên: ${detailPlace.account.name }</p>
							<p>Số điện thoại: ${detailPlace.account.phone }</p>
							<p>Địa chỉ: ${detailPlace.account.address }</p>
							<p>Email: ${detailPlace.account.email }</p>
						</div>
						<hr>
						<div class="rating">
							<div class="dtieude">
								<i class="fa fa-star"></i> ${rating } . ${reviewList.size() } đánh giá
							</div>
							<div>
								<c:forEach var="item" items="${reviewList }">
									<div class="item-review">
										<div class="d-avt">
											<div class="avt">
												<img alt="" width="50px" height="50px" src="<c:url value="/asset/images/${item.account.image }" />">
											</div>
											<div class="right">
												<b>${item.account.name }</b>
												<p>${item.dateSubmit }</p>
												<c:forEach begin="1" end="${item.rate }" varStatus="loop">
													<i class="fas fa-star item-star"></i>
												</c:forEach>
											</div>
										</div>
										<div>
											<p>${item.content }</p>
										</div>
										<div id="reaction-${item.reviewId }" class="reaction">
												<c:forEach var="itemReaction" items="${reactionList }">
													<c:if test="${itemReaction.reviewId == item.reviewId }">
														<div class="reac">
															<div class="avt left">
																<img alt="" width="50px" height="50px" src="<c:url value="/asset/images/${itemReaction.account.image }" />">
															</div>
															<div >
																<b>${itemReaction.account.name }</b>
																<p>${itemReaction.dateSubmit }</p>
															</div>
															<br>
															<p class="">${itemReaction.details }</p>
														</div>
													</c:if>
												</c:forEach>
											</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div id="map"></div>
					</div>
					<div class="dright d-table">
						<div class="login-form">
							<form action="" method="post" class="has-error">
								<h4>$ ${detailPlace.price } / đêm</h4>
								<br>
								<p>Nhận phòng</p>
								<input type="date" placeholder="dd-mm-yyyy" id="startDay" name="startDay" value="${detailPlace.startDay }"  min="${detailPlace.startDay }" max="${detailPlace.endDay }" />
								<p>Trả phòng</p>
								<input type="date" placeholder="dd-mm-yyyy" id="endDay" name="endDay" value="${detailPlace.endDay }" min="${detailPlace.startDay }" max="${detailPlace.endDay }" />
								<p>Số người</p>
								<input type="number" placeholder="0" id="people" name="people" value="1" max="${detailPlace.detailPlace.phongkhach }" />
								<input id="placeId" value="${detailPlace.placeId }" style="display:none" />
								<br>
								<c:choose>
									<c:when test="${accLogin.accountId == detailPlace.account.accountId }">
										<button disabled="disabled" type="submit" class="btn btn-default btnlogin d-dat" >Đặt phòng</button>
									</c:when>
								
									<c:otherwise>
										<button data-toggle="modal" data-target="#modalThem" data-id="${detailPlace.placeId }" type="submit" class="btn btn-default btnlogin d-dat" >Đặt phòng</button>
									</c:otherwise>
								</c:choose>
							</form>	
							<br>
							<!-- <h4>Tổng tiền:</h4> -->
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
	
	
	 <!-- DELETE MODAL -->
	 
	<div class="modal" id="modalThem" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <p class="modal-title">Xác nhận yêu cầu đặt phòng</p>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Bạn có chắc chắn yêu cầu đặt nhà / phòng này?</p>
	      </div>
	      <div class="modal-footer" style="border-top: none !important">
	        <a class="btn" id="confirm" href="">Đặt phòng</a>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"
			defer
	></script>
	<script src="/asset/map/detailPlace.js" ></script>
	
	<script>

		jQuery('#confirm').click(function(evt) {
			  evt.preventDefault();

			  var placeId = $("#placeId").val();
			  var startDay = $("#startDay").val();
			  var endDay = $("#endDay").val();
			  var people = $("#people").val();
			  
			  
			  $.ajax({
					type : "GET",
					contentType : "application/json",
					url : "/AddBookRoom",
					data : {
						placeId : placeId,
						startDay : startDay,
						endDay : endDay,
						people : people,
						
					},
					timeout : 2000,
					success : function(data) {		
						console.log("SUCCESS: ");
						window.location.href = "/bookroom";
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				});
			  
			});
		
		</script>
		
	<script>
	function getDefaultDate(){

		var startDay = document.getElementById("endDay").value;
	    var day = ("0" + startDay.getDate()).slice(-2);
	    var month = ("0" + (startDay.getMonth() + 1)).slice(-2);
	    var today = startDay.getFullYear()+"-"+(month)+"-"+(day) ;

	    return today;
	}

	$(document).ready(function(){ 
	    $("#endDay").val( getDefaultDate()); 
	});
	</script>
	</body>
</html>