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
            <a class="navbar-brand" href="<c:url value="/manager-review" />"><b>QUẢN LÝ BÀI ĐÁNH GIÁ</b></a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/manager-review" />" method="post" class="navbar-form">
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
                  <h4 class="card-title ">Manager Customer</h4>
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
		                        <th>
		                          Họ và tên
		                        </th>
		                        <th>
		                          Mã nhà
		                        </th>
		                        <th>
		                          Mức
		                        </th>
		                        <th>
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
		                            ${item.account.name }
		                          </td>
		                          <td>
		                            ${item.placeId }
		                          </td>
		                          <td>
		                            <b class="star">${item.rate } / 5</b>
		                          </td>
		                          <td>
		                            ${item.content }
		                          </td>
		                           <td>
		                            ${item.dateSubmit }
		                          </td>
		                          <td class="chucnang">
		                            <a href="<c:url value="/manager-review/delete/${item.reviewId }" />" id="deleteButton"><i class="material-icons delete">delete</i></a>
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
		jQuery('.pagination a').click(function(evt) {
			  evt.preventDefault();

			  var pagination = jQuery(this).attr("data-a");
			  
			  console.log(pagination);
			  $.ajax({
					type : "GET",
					contentType : "application/json",
					url : "getReviewByPaging",
					data : {
						pagination : pagination,
					},
					timeout : 2000,
					success : function(data) {
						console.log("SUCCESS: ", data);
						let html = '';
						$.each(data, function(i, item) {
							var stt = 5*(pagination-1) + i +1;
						    html += ' <tbody id="noidung" >'
						    + '	 <tr><td>'
	                        +     stt
	                        + '  </td>'
	                        + '  <td>'
	                        +     item.account.name 
	                        + '  </td>'
	                        + '  <td>'
	                        +    item.placeId 
	                        + '  </td>'
	                        + '  <td>'
	                        + ' <b class="star">'+item.rate +' / 5</b>'
	                        + '  </td>'
	                        + '  <td>'
	                        +     item.content 
	                        + '  </td>'
	                        + '   <td>'
	                        +     item.dateSubmit 
	                        + '  </td>'
	                        + '  <td class="chucnang">'
	                     
	                        + '    <a href="<c:url value="/manager-review/delete/'+item.reviewId +'" />" id="deleteButton"><i class="material-icons delete">delete</i></a>'
	                        + '  </td>'
	                        + '</tr></tbody>' ;
					  });
						document.getElementById("noidung").innerHTML = html;
						document.getElementById("msg").style.display = "none";  
						$(document).ready(function(){
							  $('table #deleteButton').on('click', function() {
									event.preventDefault();
									var href = $(this).attr('href');
									$('#confirmDeleteButton').attr('href', href);
									$('#deleteModal').modal();
								});
						  });
						
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				});
			});
		
		</script>
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
    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>

</html>