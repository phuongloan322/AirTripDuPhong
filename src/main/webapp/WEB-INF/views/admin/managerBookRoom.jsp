<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Đặt Phòng
  </title>
  <%@ include file="/WEB-INF/views/layout/head.jsp" %>
</head>

<body class="light-edition">
  <div class="wrapper ">
    <%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="<c:url value="/manager-bookroom" />">QUẢN LÝ ĐẶT PHÒNG</a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/manager-bookroom" />" method="post" class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" name="search" placeholder="Search...">
                <button type="submit" class="btn btn-default btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
            
            <%@ include file="/WEB-INF/views/layout/nav-link.jsp" %>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      
      <div class="content">
      
     <div id="msg">
	      <c:if test="${msg != null }">
	       		<div class="alert alert-info"  role="alert">${msg }</div>     
	      </c:if>
      </div>
      
      <%@ include file="/WEB-INF/views/layout/message.jsp" %>

		 <ul class="pagination modal-6">
			  <li><a href="#" class="prev">&laquo</a></li>
				  <c:forEach begin="1" end="${totalPageNumber }" varStatus="loop">
				  	<li class="action"> <a data-a="${loop.index }" >${loop.index }</a></li>
				  </c:forEach>
			  <li><a href="#" class="next">&raquo;</a></li>
			</ul>
      
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
			
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Category Place</h4>
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
		                        <th>
		                          Thông tin nhà/phòng
		                        </th>
		                        <th>
		                          Người cho thuê
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
		                            <b><a href="<c:url value="/manager-place/${item.place.placeId }" />">${item.place.name }</a></b><br>
									<i class="iaddress">${item.place.address }</i><br>
									<i class="iaddress">$ ${item.place.price } / đêm</i>
		                          </td>
		                          <td>
		                            ${item.place.account.name }<br>
									Sđt: ${item.place.account.phone }
		                          </td>
		                          <td>
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
								  <td>
								  	<c:choose>
										<c:when test="${item.isAccept == false }">
											<a class="">Chờ xác nhận</a>
										</c:when>
										<c:otherwise>
											<a class="">Đã xác nhận</a>
										</c:otherwise>
									</c:choose>
								  </td>
		                          <td class="chucnang">
		                            <a href="<c:url value="/manager-bookroom/delete/${item.bookId }" />" id="deleteButton"><i class="material-icons delete">delete</i></a>
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
	                        + '    <b><a href="<c:url value="/manager-place/'+item.place.placeId +'" />">'+item.place.name +'</a></b><br>'
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
	                        + '   <a href="<c:url value="/manager-bookroom/delete/'+item.bookId +'" />" id="deleteButton"><i class="material-icons delete">delete</i></a>'
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
    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>

</html>