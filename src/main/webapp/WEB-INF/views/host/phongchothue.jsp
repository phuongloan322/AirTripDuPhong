<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <%@ include file="/WEB-INF/views/host/head3.jsp" %>

    <body>
        <%@ include file="/WEB-INF/views/host/header3.jsp" %>
        <!-- Page Header Start -->
        <div class="page-header">
        </div>
        <!-- Page Header End -->


        <!-- About Start -->
        <div class="about wow fadeInUp" data-wow-delay="0.1s">
           <div style="margin: 50px">
			   <div class="row">
				   <div class="col-10">
					   <h4><b>${PlaceByAccId.size()} nhà / phòng cho thuê</b></h4>
				   </div>
				   <div class="col-2 float-lg-right">
					   <a href="/become-a-host" class="btn" style="background: #F7CAC9"><i class="fas fa-plus"></i> Tạo mục thuê mới</a>
				   </div>
			   </div>

           		<br>
			   	<br>
           		 <div class="table-responsive cart_info" style="border-left: 1px solid #dee2e6;border-right: 1px solid #dee2e6;border-bottom: 1px solid #dee2e6;">
						<c:choose>
							<c:when test="${PlaceByAccId.size() > 0 }">
								<form action="<c:url value="/become-a-host/deletePlace" />" method="post">
									<table class="table table-condensed">
										<thead>
											<tr class="">
												<td class="" style="text-align: center">STT</td>
												<td class="image"></td>
												<td class="" width="25%">Nhà / phòng cho thuê</td>
												<td class="">Xác nhận</td>
												<td class="">Trạng thái</td>
												<td class="">Giá</td>
												<td class="">Thời gian cho thuê</td>
												<td class="">Chức năng</td>
											</tr>
										</thead>
										<tbody> 
											<c:forEach var="item" items="${PlaceByAccId }" varStatus="loop">
											<c:forEach var="rate" items="${ratings }" varStatus="i">
												<c:if test="${loop.index == i.index}">
												<tr>
													<td style="text-align: center">
														${loop.index + 1}
													</td>
													<td class="" width="75" height="90">
														<a href="<c:url value="/become-a-host/detailplace/${item.placeId }" />"><img src="<c:url value="/asset/images/${item.images[0].name }"/>" alt="" width="90" height="75" style="border-radius: 5px"></a>
													</td>
													<td class="">
														<p style="margin-bottom: 0"><a href="<c:url value="/become-a-host/detailplace/${item.placeId }" />"><b class="textoverflow1">${item.name }</b></a></p>
														<p style="margin-bottom: 0">${item.address}</p>
														<p><i class="fas fa-star"></i>${rate}</p>
													</td>
													<td class="xacnhan-place">
														<c:choose>
															<c:when test="${item.isAccept == true }">
																<p><i class="fas fa-check"></i> Đã xác nhận</p>
															</c:when>
															<c:otherwise>
																<p><i class="fas fa-hourglass"></i> Chưa xác nhận</p>
															</c:otherwise>
														</c:choose>
													</td>
													<td class="tinhtrang">
														<c:choose>
															<c:when test="${item.isEmpty == true }">
																<p data-on="${item.placeId}" id="status-on-${item.placeId}">
																	<i class="fas fa-check" id="status-${item.placeId}"></i>Bật</p>
															</c:when>
															<c:otherwise>
																<p data-on="${item.placeId}" id="status-on-${item.placeId}">
																	<i class="fas fa-cancel"  id="status-${item.placeId}" ></i>Tắt</p>
															</c:otherwise>
														</c:choose>
													</td>
													<td class="">
														<p class=""><b>$${item.price }</b> / đêm</p>
													</td>
													<td class="">
														<p class="">
															Từ: ${item.startDay.split("-")[2]}-${item.startDay.split("-")[1]}-${item.startDay.split("-")[0]}
														</p>
														<p>
															Đến: ${item.endDay.split("-")[2]}-${item.endDay.split("-")[1]}-${item.endDay.split("-")[0]}
														</p>
													</td>
													<td class="cart_total chucnang" style="text-align: center">
														<a href="<c:url value="/become-a-host/detailplace/${item.placeId }" />">
															<i class="fas fa-calendar-week" style="color: #1A73E8"></i>
														</a>
														<c:if test="${item.isAccept == false}">
															<a href="<c:url value="/become-a-host/listings/delete/${item.placeId }" />" class="remove-place">
																<i class="fas fa-trash" style="color: darkred"></i>
															</a>
														</c:if>
													</td>
												</tr>
												</c:if>

											</c:forEach>
											</c:forEach>	
														
										</tbody>
									</table>

								</form>
							</c:when>
							<c:otherwise>
								<p class="thongbao">
									Bạn chưa có mục cho thuê nào
								</p>
							</c:otherwise>
						</c:choose>
						
				</div>
           </div>
        </div>

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

		<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<p class="modal-title">Xác nhận xoá</p>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Bạn có chắc chắn muốn xoá nhà/phòng này không?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light" data-dismiss="modal">Đóng</button>
						<a class="btn btn-secondary" id="confirmDeleteButton" href="">Xoá nhà</a>
					</div>
				</div>
			</div>
		</div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script>
        function myFunction() {
        	  var checkBox = document.getElementById("checkbox");
        	  var text = document.getElementById("delete");
        	  if (checkBox.checked == true){
        	    text.style.display = "block";
        	  } else {
        	    text.style.display = "none";
        	  }
        	}

		$('.tinhtrang p').on('click', function(event){
			var placeId = jQuery(this).attr("data-on");
			var id = 'status-on-'+placeId;
			// var i = 'status-'+placeId;

			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "/become-a-host/listings/status",
				data : {
					placeId : placeId,
				},
				timeout : 2000,
				success : function(data) {
					if(data == false) {
						const html1 = '<i class="fas fa-cancel"></i>Bật';
						document.getElementById(id).innerHTML = html1;
					}
					else {
						const html2 = '<i class="fas fa-check"></i>Bật';
						document.getElementById(id).innerHTML = html2;
					}
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		});

		$('.remove-place').on('click', function(e) {
			e.preventDefault();
			var href = $(this).attr('href');
			console.log(href);
			$('#confirmDeleteButton').attr('href', href);
			$('#deleteModal').modal();
		});

        </script>
		<%@ include file="/WEB-INF/views/host/libfooter.jsp" %>
		<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
    </body>
</html>
