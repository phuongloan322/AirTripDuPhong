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
           <div class="container">
           		<h4><a href="<c:url value="/become-a-host/index" />"><i class="fas fa-angle-left"></i></a><b>Lịch sử giao dịch</b></h4>
           		<br>
           		 <div class="card-body">
                  <div class="table-responsive">
                  	<c:choose>
                  		<c:when test="${bookroomList.size() > 0 }">
                  			<table class="table">
		                      <thead class="">
		                        <th>
		                          ID
		                        </th>
		                        <th>
		                          Thông tin nhà/phòng
		                        </th>
		                        
		                        <th>
		                          Người thuê
		                        </th>
		                        <th>
		                          Chi tiết thuê
		                        </th>
		                        <th>
		                         Tình trạng
		                        </th>
		                       
		                      </thead>
		                      <tbody id="noidung" >
		                        <c:forEach var="item" items="${bookroomList }" varStatus="loop">
		                        <tr>
		                          <td>
		                            ${loop.index +1 }
		                          </td>
		                          <td>
		                            <b><a href="<c:url value="/become-a-host/detailplace/${item.place.placeId }" />">${item.place.name }</a></b><br>
									<i class="iaddress">${item.place.address }</i><br>
									<i class="iaddress">$ ${item.place.price } / đêm</i>
		                          </td>
		                          <td>
		                            ${item.place.account.name }<br>
									Sđt: ${item.place.account.phone }
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
								  <td>
								  	<c:choose>
										<c:when test="${item.isReview == false }">
											<a href="" class="">Chưa đánh giá</a>
										</c:when>
										<c:otherwise>
											<a class="b-accept">Đã đánh giá</a>
										</c:otherwise>
									</c:choose>
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
