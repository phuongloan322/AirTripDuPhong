<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Đặt Phòng
  </title>
  <%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
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
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example" style="background-color: darkslategrey !important;color:#fff">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="<c:url value="/admin/manager-bookroom" />">QUẢN LÝ ĐẶT PHÒNG</a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/admin/manager-bookroom/page/1" />" method="post" class="navbar-form">
              <div class="input-group no-border">
				  <select onchange="test()" class="form-control" name="filter" id="filter" style="height: 36px; margin-right: 20px; color: #fff">
					  <option style="color: #222" value=""> Tìm kiếm tất cả </option>
					  <option style="color: #222" value="danhmuc"> Theo tình trạng</option>
					  <option style="color: #222" value="date"> Theo ngày </option>
					  <option style="color: #222" value="price"> Theo tổng tiền thuê </option>
					  <option style="color: #222" value="price asc"> Tổng tiền tăng dần </option>
					  <option style="color: #222" value="price desc"> Tổng tiền giảm dần </option>
				  </select>
				  <select class="form-control" name="status" id="statusz" style="height: 36px; margin-right: 20px; color: #fff; display: none">
					  <option style="color: #222" value="">Tất cả</option>
					  <option style="color: #222" value="0/false">Chờ xác nhận</option>
					  <option style="color: #222" value="1/false">Đã xác nhận</option>
					  <option style="color: #222" value="1/true">Đã thanh toán</option>
					  <option style="color: #222" value="-1/false">Đã huỷ</option>
				  </select>
				  <input type="text" id="search" value="${search}" class="form-control" name="search" placeholder="Search..." style="color:#fff">
				  <button type="submit" class="btn btn-default btn-round btn-just-icon">
					  <i class="material-icons">search</i>
					  <div class="ripple-container"></div>
				  </button>
              </div>
            </form>
            
            <%@ include file="/WEB-INF/views/admin/layout/nav-link.jsp" %>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      
      <div class="content">
      
      <%@ include file="/WEB-INF/views/admin/layout/message.jsp" %>

      
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
			
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Manager Booking</h4>
                  <p class="card-category"> Danh sách Đặt phòng</p>
                </div>
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
		                          Thông tin nhà/phòng
		                        </th>
		                        <th>
		                          Chủ nhà
		                        </th>
		                        <th>
		                          Khách hàng
		                        </th>
		                        <th>
		                          Chi tiết thuê
		                        </th>
		                        <th>
		                         Tình trạng
		                        </th>
		                        <th>
		                        	Chức năng
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
									<i class="iaddress"><b>$ <fmt:formatNumber type="number" groupingUsed="true" value="${item.place.price }" /> / đêm</b></i>
		                          </td>
		                          <td>
									  <a href="/admin/detail-account/${item.place.account.accountId}">
											  ${item.place.account.name }<br>
										  Sđt: ${item.place.account.phone }
									  </a>
		                          </td>
		                          <td>
									  <a href="/admin/detail-account/${item.account.accountId}">
		                            ${item.account.name }<br>
									Sđt: ${item.account.phone }
									  </a>
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
										Tổng tiền thuê: $<fmt:formatNumber type="number" groupingUsed="true" value="${item.totalPrice }" /><br>
										Số người: ${item.people }
								  </td>
								  <td >
									  <c:choose>
										  <c:when test="${item.isAccept == 0 }">
											  <div class="upcomingstatus" >
													  <i class="fas fa-hourglass"></i> Chờ xác nhận
											  </div>
										  </c:when>
										  <c:otherwise>
											  <div class="daxacnhan">
												  <c:choose>
													  <c:when test="${item.isAccept == 1 && item.isPayment == false}">
														  <div class="row">
															  <div class="col" style="margin-top: 10px">
																  <a class="b-accept"><i class="fas fa-check" style="color: #222"></i>Đã
																	  xác nhận</a>
															  </div>
														  </div>
													  </c:when>
													  <c:when test="${item.isAccept == 1 && item.isPayment == true}">
														  <div class="row">
															  <div class="col" style="margin-top: 10px">
																  <a class="b-accept"><i class="fas fa-check"></i>Đã
																	  thanh toán</a>
															  </div>
															  <div>
																  <a href="#" class="nav-link test"
																	 data-toggle="dropdown"></a>
																  <div class="dropdown-menu">
																	  <a data-id="${item.bookId }"
																		 href="/admin/show-payment/${item.bookId }"
																		 class="dropdown-item show-payment">Xem giao
																		  dịch</a>

																  </div>
															  </div>
														  </div>
													  </c:when>
													  <c:when test="${item.isAccept == -1}">
														  <div class="row">
															  <div class="col" style="margin-top: 10px">
																  <a class="b-accept"><i class="fas fa-remove"></i>Đã huỷ</a>
															  </div>
															  <div>
																  <a href="#" class="nav-link test"
																	 data-toggle="dropdown"></a>
																  <div class="dropdown-menu">
																	  <a data-id="${item.bookId }"
																		 href="/show-reason/${item.bookId }"
																		 class="dropdown-item showcancel">Xem nguyên
																		  nhân</a>
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
		                          <td class="chucnang">
		                            <a href="<c:url value="/admin/manager-bookroom/delete/${item.bookId }" />" id="deleteButton"><i class="material-icons delete">delete</i></a>
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
					  <ul class="pagination modal-6">
						  <c:if test="${currentPage > 1}">
							  <li > <a href="/admin/manager-bookroom/page/${currentPage-1}?search=${search}&filter=${filter}">&laquo</a></li>
						  </c:if>
						  <c:forEach begin="1" end="${totalPages }" varStatus="loop">
							  <c:if test="${currentPage == loop.index}">
								  <li > <a href="/admin/manager-bookroom/page/${loop.index}?search=${search}&filter=${filter}" class="active">${loop.index }</a></li>
							  </c:if>
							  <c:if test="${currentPage != loop.index}">
								  <li ><a href="/admin/manager-bookroom/page/${loop.index}?search=${search}&filter=${filter}" >${loop.index }</a></li>
							  </c:if>
						  </c:forEach>
						  <c:if test="${currentPage < totalPages}">
							  <li > <a href="/admin/manager-bookroom/page/${currentPage+1}?search=${search}&filter=${filter}" >&raquo;</a></li>
						  </c:if>
					  </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
	
	 <!-- DELETE MODAL -->
	 
	<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Xác nhận xóa </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Bạn có chắc chắn muốn xóa đơn đặt Nhà / phòng này?</p>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-primary" id="confirmDeleteButton" href="">Xóa</a>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
	      </div>
	    </div>
	  </div>
	</div>


  <div class="modal" id="paymentModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document" style="min-width: 600px">
		  <div class="modal-content">
			  <div class="modal-header">
				  <p class="modal-title"><b style="font-size: 17px">Lịch sử thanh toán</b></p>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
				  </button>
			  </div>
			  <div class="modal-body">

				  <label>Mã giao dịch</label>
				  <input class="form-control-file" name="paymentId" id="paymentId" readonly>


				  <label>Mã đặt phòng</label>
				  <input class="form-control-file" name="bookId" id="bookId" readonly>


				  <label>Tên khách hàng</label>
				  <input class="form-control-file" name="name" id="name" readonly>


				  <label>Tài khoản thanh toán</label>
				  <input class="form-control-file" name="email" id="email" readonly>


				  <label>Tổng tiền thanh toán (USD)</label>
				  <input class="form-control-file" name="totalPrice" id="totalPrice" readonly>


				  <label>Phí giao dịch (USD)</label>
				  <input class="form-control-file" name="transactionFee" id="transactionFee" readonly>


				  <label>Thời gian thanh toán</label>
				  <input class="form-control-file" name="createTime" id="createTime" readonly>


				  <label>Nội dung thanh toán</label>
				  <input class="form-control-file" name="description" id="description" readonly>


				  <label>Tình trạng</label>
				  <input class="form-control-file" name="status" id="status" readonly>


				  <label>Country Code</label>
				  <input class="form-control-file" name="countryCode" id="countryCode" readonly>


				  <label>Postal Code</label>
				  <input class="form-control-file" name="postalCode" id="postalCode" readonly>

			  </div>
			  <div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
			  </div>
		  </div>
	  </div>
  </div>
  <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

  <script type="text/javascript">


	  function test() {
		  const e = document.getElementById("filter");
		  const index = e.selectedIndex;
		  console.log(index)

		  if(index == 1) {
			  $("#statusz").css("display", "block");
			  $("#search").css("display", "none");
		  }
		  else {
			  $("#statusz").css("display", "none");
			  $("#search").css("display", "block");
			  if(index == 2) {
				  $("#search").attr('type', 'date');
			  }
			  else if(index == 3) {
				  $("#search").attr('type', 'number');
			  }
			  if(index == 4) {
				  window.location.href = "/admin/manager-bookroom/page/1?filter=price asc";
			  }
			  else if(index == 5) {
				  window.location.href = "/admin/manager-bookroom/page/1?filter=price desc";
			  }
			  else if(index == 0) {
				  $("#search").attr('type', 'text');
			  }
		  }

	  }
	  var filter = '<c:out value="${filter}"/>';
	  document.getElementById("filter").value = filter;
	  var statusz = '<c:out value="${statusz}"/>';
	  document.getElementById("statusz").value = statusz;
	  console.log(statusz)

	  if(filter == "date") {
		  $("#search").attr('type', 'date');
	  }
	  if(filter == "danhmuc") {
		  $("#statusz").css("display", "block");
		  $("#search").css("display", "none");
	  }

	  //
	  //
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


	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 <script type="text/javascript">
	  $(document).ready(function(){
		
		  
		  $('table #deleteButton').on('click', function() {
				event.preventDefault();
				var href = $(this).attr('href');
				$('#confirmDeleteButton').attr('href', href);
				$('#deleteModal').modal();
			});
	  });
	  
	</script>
	<script>
		jQuery('.pagination a').click(function(evt) {
			  evt.preventDefault();

			  var pagination = jQuery(this).attr("data-a");
			  
			  console.log(pagination);
			  $.ajax({
					type : "GET",
					contentType : "application/json",
					url : "/AirTripAdmin/getBookRoomByPaging",
					data : {
						pagination : pagination,
					},
					timeout : 2000,
					success : function(data) {
						console.log("SUCCESS: ", data);
						let html = '';
						$.each(data, function(i, item) {
							
							console.log(item.isAccept)
							
							var stt = 10*(pagination-1) + i +1;
							
							if(item.isAccept == false)
								var a = "Chờ xác nhận";
							else 
								var a = "Đã xác nhận";
							
						    html += ' <tbody id="noidung" >'
						    + '	 <tr><td>'
	                        +     stt
	                        + '  </td>'
	                        + '  <td>'
	                        + '    <b><a href="<c:url value="/admin/manager-place/'+item.place.placeId +'" />">'+item.place.name +'</a></b><br>'
							+ ' 	<i class="iaddress">'+item.place.address +'</i><br>'
							+ ' 	<i class="iaddress">$ '+item.place.price +' / đêm</i>'
	                        + '  </td>'
	                        + '  <td>'
	                        +   item.place.account.name +'<br>'
							+ '	Sđt: '+item.place.account.phone
	                        + '  </td>'
	                        + '  <td>'
	                        +   item.account.name +'<br>'
							+ '	Sđt: '+item.account.phone 
	                        + '  </td>'
	                        + '  <td class="chitiet">'
	                        + 'Ngày bắt đầu: '+ item.startDay
							+ '<br>'
							+ 'Ngày kết thúc: '+ item.endDay
							+ '<br>'
							+ 'Tổng tiền thuê: $ ' + item.totalPrice +'<br>'
							+ 'Số người: 		 ' + item.people 
	                        + '  </td>'
	                        + '   <td>'
	                        + '   <a class="b-accept">'+a+'</a>'
	                        
	                        + '  </td>'
	                        + '  <td class="chucnang">'
	                        + '   <a href="<c:url value="/admin/manager-bookroom/delete/'+item.bookId +'" />" id="deleteButton"><i class="material-icons delete">delete</i></a>'
	                        + '  </td>'
	                        + '</tr></tbody>' ;
					  });
						document.getElementById("noidung").innerHTML = html;
						document.getElementById("msg").style.display = "none"; 
						
						 $('table #deleteButton').on('click', function() {
								event.preventDefault();
								var href = $(this).attr('href');
								$('#confirmDeleteButton').attr('href', href);
								$('#deleteModal').modal();
							});
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				});
			});
		
		</script>
    <%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>

</body>
</html>