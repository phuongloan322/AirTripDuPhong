<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <%@ include file="/WEB-INF/views/host/head3.jsp" %>

    <body>
        <%@ include file="/WEB-INF/views/host/header3.jsp" %>
        <!-- Page Header Start -->
        <div class="page-header" style="padding: 140px 0 30px 0 !important; margin-bottom: 5px;">
            <div class="container">
                <div class="">
                    <div class="col-12">
                        <h3>Quản lý nhà / phòng cho thuê</h3>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- About Start -->
        <div class="about wow fadeInUp" data-wow-delay="0.1s">
           <div class="container">
           		<h4><b>${PlaceByAccId.size()} nhà / phòng cho thuê</b></h4>
           		<br>
           		 <div class="table-responsive cart_info">
						<c:choose>
							<c:when test="${PlaceByAccId.size() > 0 }">
								<form action="<c:url value="/become-a-host/deletePlace" />" method="post">
									<table class="table table-condensed">
										<thead>
											<tr class="">
												<td class="" style="text-align: center">#</td>
												<td class="image"></td>
												<td class="">Nhà / phòng cho thuê</td>
												<td class="">Trạng thái</td>
												<td class="">Giá</td>
												<td class="">Vị trí</td>
												<td class="">Chức năng</td>
											</tr>
										</thead>
										<tbody> 
											<c:forEach var="item" items="${PlaceByAccId }" varStatus="loop">
												<tr>
													<td style="text-align: center">
														<input type="checkbox" class="checkbox" id="checkbox" name="checkbox" value="${item.placeId }" onclick="myFunction()">
													</td>
													<td class="" width="75" height="90">
														<a href=""><img src="<c:url value="/asset/images/${item.images[0].name }"/>" alt="" width="90" height="75"></a>
													</td>
													<td class="">
														<p><a href="<c:url value="/become-a-host/detailplace/${item.placeId }" />">${item.name }</a></p>
													</td>
													<td class="">
														<c:choose>
															<c:when test="${item.isEmpty == true }">
																<p>Đã đăng</p>
															</c:when>
															<c:otherwise>
																<p>Đã tắt</p>
															</c:otherwise>
														</c:choose>
													</td>
													<td class="">
														<p class="">$ ${item.price }</p>
													</td>
													<td class="">
														<p class="">${item.address }</p>
													</td>
													<td class="cart_total">
														<a class="<c:url value="/become-a-host/detailplace/${item.placeId }" />" href="">Xem chi tiết</a>
													</td>
												</tr>
											</c:forEach>	
														
										</tbody>
									</table>
									<button id="delete" class="btn-link delete">Xóa</button>
								</form>
							</c:when>
							<c:otherwise>
								<p>Bạn chưa có mục cho thuê nào</p>
								<br>
								<a href="<c:url value="/become-a-host" />">Tạo mục cho thuê mới</a>
							</c:otherwise>
						</c:choose>
						
				</div>
           </div>
        </div>
        <!-- About End -->


        <!-- Team Start -->
        
        <!-- Team End -->


        <!-- Footer Start -->
       
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

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
