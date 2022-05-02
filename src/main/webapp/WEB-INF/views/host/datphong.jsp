<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
           <div class="container" style="max-width: 1400px !important">
           		<h4><b><a href="<c:url value="/become-a-host/index" />"><i class="fas fa-angle-left"></i></a> Đặt phòng</b></h4>
           		<br>
           		<ul class="ds">
           			<li><a href="<c:url value="/become-a-host/upcoming/no-accept" />" class="itemmenu">Chưa xác nhận</a></li>
           			<li><a href="<c:url value="/become-a-host/upcoming/is-accept" />" class="itemmenu">Đã xác nhận</a></li>
           			<li><a href="<c:url value="/become-a-host/upcoming/all-accept" />" class="itemmenu">Tất cả</a></li>
           		</ul>
           		 <div class="table-responsive cart_info">
					<c:choose>
							<c:when test="${acceptList.size() > 0 }">
							<p class="right">Có ${acceptList.size()} đơn đặt phòng</p><br>
								<form action="" method="post">
									<table class="table table-condensed">
										<thead>
											<tr class="">
												<td class="" style="text-align: center">#</td>
												<td class="image"></td>
												<td class="" width="30%">Nhà / phòng cho thuê</td>
												<td class="" width="20%">Người thuê</td>
												<td class="" width="25%">Chi tiết thuê nhà / phòng</td>
												<td class="" width="10%">Chức năng</td>
											</tr>
										</thead>
										<tbody> 
											<c:forEach var="item" items="${acceptList }" varStatus="loop">
												<tr>
													<td style="text-align: center">
														<input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="${item.place.placeId }" onclick="myFunction()">
													</td>
													<td class="" width="90" height="100">
														<a href=""><img src="<c:url value="/asset/images/${item.place.images[0].name }"/>" alt="" width="150" height="100"></a>
													</td>
													<td class="">
														<b><a href="<c:url value="/become-a-host/detailplace/${item.place.placeId }" />">${item.place.name }</a></b><br>
														<i class="iaddress">${item.place.address }</i><br>
														<i class="iaddress">$ ${item.place.price } / đêm</i>
													</td>
													<td class="chitiet">
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
													<td class="">
														<c:choose>
															<c:when test="${item.isAccept == 0 }">
																<a href="<c:url value="/become-a-host/upcoming/accept/${item.bookId }" />" class="a-accept">Xác nhận</a>
																<a data-toggle="modal" data-target="#addModal" data-id="${item.bookId}" class="a-accept cancel">Hủy</a>
															</c:when>
															<c:otherwise>
																<a class="b-accept">Đã xác nhận</a>
															</c:otherwise>
														</c:choose>
													</td>
													
												</tr>
											</c:forEach>	
														
										</tbody>
									</table>
									<button id="delete" class="btn-link delete">Xóa</button>
								</form>
							</c:when>
							<c:otherwise>
								<p>Bạn không có yêu cầu đặt phòng nào</p>
								<br>
							</c:otherwise>
						</c:choose>
				</div>
           </div>
        </div>

		<!-- Modal ADD-->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<p class="modal-title">Từ chối đặt phòng</p>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action ="" method="post" id="myFormId">
							<div class="form-group">
								<input type="radio" name="reason">
								<label>Đã hết phòng</label>
								<input type="radio" name="reason">
								<label>Đã hết phòng 1</label>
								<input type="radio" name="reason">
								<label>Đã hết phòng 2</label>
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
								<button type="submit" class="btn review">Đánh giá</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
       
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script>
			$(document).ready(function(){
				$('.cancel').on('click', function() {
					event.preventDefault();
					var bookId = $(this).attr('data-id');
					var href = "/become-a-host/upcoming/cancel/"+bookId;
					$('#myFormId').attr('action', href);
					console.log(bookId);
					console.log(href);
				});
			});

        function myFunction() {

			var checkBox = document.getElementById("checkbox");
        	  var text = document.getElementById("delete");
        	  if (checkBox.checked == true){
        	    text.style.display = "block";
        	  } else {
        	    text.style.display = "none";
        	  }
        	}
        
        var listItem = document.getElementsByClassName("itemmenu");
		
		/* for (var i = 0; i < listItem.length; i++) {
			listItem[i].onclick = function() {
				document.getElementById("active").style.background = "none";
				document.getElementById("active").style.color = "#333";
			}
			listItem[i].onmouseout = function() {
				document.getElementById("active").style.background = "#f89406";
				document.getElementById("active").style.color = "#fff";
			}
		} */
        </script>
        <script src="<c:url value="/asset/host/lib/easing/easing.min.js" />"></script>
        <script src="<c:url value="/asset/host/js/lib/wow/wow.min.js" />"></script>
        <script src="<c:url value="/asset/host/lib/owlcarousel/owl.carousel.min.js" />"></script>
        <script src="<c:url value="/asset/host/lib/isotope/isotope.pkgd.min.js" />"></script>
        <script src="<c:url value="/asset/host/js/lib/lightbox/js/lightbox.min.js" />"></script>
        
        <!-- Contact Javascript File -->
        <script src="<c:url value="/asset/host/mail/jqBootstrapValidation.min.js" />"></script>
        <script src="<c:url value="/asset/host/mail/contact.js" />"></script>

        <!-- Template Javascript -->
        <script src="<c:url value="/asset/host/js/main.js" />"></script>
    </body>
</html>
