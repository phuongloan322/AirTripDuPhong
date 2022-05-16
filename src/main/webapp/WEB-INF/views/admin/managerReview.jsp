<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Bài đánh giá
  </title>
  <%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
</head>

<body class="light-edition">
  <div class="wrapper ">
    <%@ include file="/WEB-INF/views/admin/layout/sidebar.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example" style="background-color: darkslategrey !important;color:#fff">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="<c:url value="/manager-review" />"><b>QUẢN LÝ BÀI ĐÁNH GIÁ</b></a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/admin/manager-review/page/1" />" method="post" class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="${search}" class="form-control" name="search" placeholder="Search..." style="color: #fff">
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
                  <h4 class="card-title ">Manager Review</h4>
                  <p class="card-account"> Danh sách Bài đánh giá</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                  	<c:choose>
                  		<c:when test="${reviewList.size() > 0 }">
                  			<table class="table">
		                      <thead class=" text-primary">
		                        <th>
		                          STT
		                        </th>
		                        <th width="15%">
		                          Khách hàng
		                        </th>
		                        <th width="20%">
		                          Thông tin nhà/phòng
		                        </th>
		                        <th>
		                          Mức
		                        </th>
		                        <th width="25%">
		                          Nội dung
		                        </th>
		                        <th>
		                          Ngày đánh giá
		                        </th>
		                        <th>
		                          Chức năng
		                        </th>
		                      </thead>
		                      <tbody id="noidung" >
		                        <c:forEach var="item" items="${reviewList }" varStatus="loop">
		                        	<tr>
		                          <td>
		                            ${loop.index + 1 }
		                          </td>
		                          <td>
									  <a href="/admin/detail-account/${item.account.accountId}">
										  Mã KH: ${item.account.accountId }<br>
										  Tên KH: ${item.account.name }
									  </a>
		                          </td>
		                          <td>
		                            <a href="/admin/manager-place/detail/${item.place.placeId}" class="textoverflow1"><b>${item.place.name }</b>
										<br>
										<i>$${item.place.price}/đêm</i>
									</a>
		                          </td>
		                          <td>
		                            <b class="star">${item.rate } / 5</b>
		                          </td>
		                          <td>
		                            <div class="textoverflow3">
											${item.content }
									</div>
		                          </td>
		                           <td>
		                            ${item.dateSubmit.split(" ")[1].substring(0,5) } &nbsp;${item.dateSubmit.split(" ")[0].split("-")[2] }-${item.dateSubmit.split(" ")[0].split("-")[1] }-${item.dateSubmit.split(" ")[0].split("-")[0] }
		                          </td>
		                          <td class="chucnang">
									  <a href="<c:url value="/admin/manager-review/findById/${item.reviewId }" />" class="detailButton"><i class="material-icons detail">event_note</i></a>
		                            <a href="<c:url value="/admin/manager-review/delete/${item.reviewId }" />" class="deleteButton"><i class="material-icons delete">delete</i></a>
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
							  <li > <a href="/admin/manager-review/page/${currentPage-1}?search=${search}&filter=${filter}">&laquo</a></li>
						  </c:if>
						  <c:forEach begin="1" end="${totalPages }" varStatus="loop">
							  <c:if test="${currentPage == loop.index}">
								  <li > <a href="/admin/manager-review/page/${loop.index}?search=${search}&filter=${filter}" class="active">${loop.index }</a></li>
							  </c:if>
							  <c:if test="${currentPage != loop.index}">
								  <li ><a href="/admin/manager-review/page/${loop.index}?search=${search}&filter=${filter}" >${loop.index }</a></li>
							  </c:if>
						  </c:forEach>
						  <c:if test="${currentPage < totalPages}">
							  <li > <a href="/admin/manager-review/page/${currentPage+1}?search=${search}&filter=${filter}" >&raquo;</a></li>
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


  <!-- MODAL EDIT -->
  <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		  <div class="modal-content">
			  <div class="modal-header">
				  <h5 class="modal-title">Thông tin mục thuê</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
				  </button>
			  </div>
			  <div class="modal-body">
				  <form action ="" method="post">

					  <label class="">Mã đánh giá</label>
					  <input type="text" class="form-control-file" id="reviewId" readonly>

					  <label class="">Tên khách hàng</label>
					  <input type="text" class="form-control-file " id="account" readonly>

					  <label class="">Loại đánh giá (*/5)</label>
					  <input type="text" class="form-control-file " id="rate" readonly>

					  <label class="">Nội dung đánh giá</label>
					  <textarea type="text" class="form-control-file " id="content" style="height: 100px !important;"></textarea>

					  <div class="modal-footer">
						  <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
					  </div>
				  </form>
			  </div>
		  </div>
	  </div>
  </div>
 
	 <!-- DELETE MODAL -->
	 
	<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Xác nhận xóa</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Bạn có chắc chắn muốn xóa bài đánh giá này?</p>
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

  <script>

	  $('table .detailButton').on('click', function(event){
		  event.preventDefault();
		  var href= $(this).attr('href')
		  console.log(href)
		  $.get(href, function(data, status){
			  $('#reviewId').val(data.reviewId);
			  $('#rate').val(data.rate);
			  $('#content').val(data.content);
			  $('#account').val(data.account.name);
		  });

		  $('#detailModal').modal();
	  });

	  $('table .deleteButton').on('click', function() {
		  event.preventDefault();
		  var href = $(this).attr('href');
		  $('#confirmDeleteButton').attr('href', href);
		  $('#deleteModal').modal();
	  });

  </script>

    <%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
</body>
</html>