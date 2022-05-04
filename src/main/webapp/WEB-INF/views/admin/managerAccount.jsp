<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Khách Hàng
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
            <a class="navbar-brand" href="<c:url value="/manager-account" />">QUẢN LÝ KHÁCH HÀNG</a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/manager-account" />" method="post" class="navbar-form">
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalThem">
            	<i class="material-icons large">add_box</i> Add new
            </button>
			
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Manager Customer</h4>
                  <p class="card-account"> Danh sách Khách Hàng</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                  	<c:choose>
                  		<c:when test="${accountList.size() > 0 }">
                  			<table class="table">
		                      <thead class=" text-primary">
		                        <th>
		                          STT
		                        </th>
		                        <th>
		                          Họ và tên
		                        </th>
		                        <th>
		                          Số điện thoại
		                        </th>
		                        <th>
		                          Email
		                        </th>
		                        <th>
		                          Địa chỉ
		                        </th>
		                        <th>
		                          Tên đăng nhập
		                        </th>
		                        <th>
		                          Chức năng
		                        </th>
		                      </thead>
		                      <tbody id="noidung" >
		                        <c:forEach var="item" items="${accountList }" varStatus="loop">
		                        	<tr>
		                          <td>
		                            ${loop.index + 1 }
		                          </td>
		                          <td>
		                            ${item.name }
		                          </td>
		                          <td>
		                            ${item.phone }
		                          </td>
		                          <td>
		                            ${item.email }
		                          </td>
		                          <td>
		                            ${item.address }
		                          </td>
		                           <td>
		                            ${item.username }
		                          </td>
		                          <td class="chucnang">
		                            
		                            <a data-f="${item.accountId }" id="editButton"><i class="material-icons edit">mode_edit</i></a>
		                            <a href="<c:url value="/manager-account/delete/${item.accountId }" />" id="deleteButton"><i class="material-icons delete">delete</i></a>
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
  
  <!-- Modal ADD-->
	<div class="modal fade" id="modalThem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Thêm Mục Thuê</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<c:url value="/manager-account/add" />" method="post">
	        
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Tên khách hàng</label>
				    <input type="text" class="form-control-file " id="" name="name" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Số điện thoại</label>
				    <input type="text" class="form-control-file " id="" name="phone" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Địa chỉ</label>
				    <input type="text" class="form-control-file " id="" name="address" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Email</label>
				    <input type="text" class="form-control-file " id="" name="email" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Tên đăng nhập</label>
				    <input type="text" class="form-control-file " id="" name="username">
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Mật khẩu</label>
				    <input type="text" class="form-control-file " id="" name="password">
				  </div>
				  
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
			        <button type="submit" class="btn btn-primary">Thêm</button>
			    </div>        
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- MODAL EDIT -->	

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Thông tin Khách hàng</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<c:url value="/manager-account/edit" />" method="post">
	        
	        	<div class="">
				    <label for="exampleFormControlFile1" class="">Mã khách hàng</label>
				    <input type="text" class="form-control-file " id="accountId" name="accountId"  readonly>
				  </div>
	        	<div class="">
				    <label for="exampleFormControlFile1" class="">Tên khách hàng</label>
				    <input type="text" class="form-control-file " id="name" name="name" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Số điện thoại</label>
				    <input type="text" class="form-control-file " id="phone" name="phone" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Địa chỉ</label>
				    <input type="text" class="form-control-file " id="address" name="address" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Email</label>
				    <input type="text" class="form-control-file " id="email" name="email" >
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Tên đăng nhập</label>
				    <input type="text" class="form-control-file " id="username" name="username" readonly>
				  </div>
				  
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
			        <button type="submit" class="btn btn-primary">Cập nhật</button>
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
	        <h5 class="modal-title">Confirm Delete</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Are you sure you want to delete this record?</p>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-primary" id="confirmDeleteButton" href="">Yes, delete</a>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
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
					url : "/AirTripAdmin/getAccountByPaging",
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
	                        +     item.name 
	                        + '  </td>'
	                        + '  <td>'
	                        +    item.phone 
	                        + '  </td>'
	                        + '  <td>'
	                        + 	 item.email  
	                        + '  </td>'
	                        + '  <td>'
	                        +     item.address 
	                        + '  </td>'
	                        + '   <td>'
	                        +     item.username 
	                        + '  </td>'
	                        + '  <td class="chucnang">'
	                     
	                        + '    <a data-f="'+item.accountId +'" id="editButton"><i class="material-icons edit">mode_edit</i></a>'
	                        + '    <a href="<c:url value="/manager-account/delete/'+item.accountId +'" />" id="deleteButton"><i class="material-icons delete">delete</i></a>'
	                        + '  </td>'
	                        + '</tr></tbody>' ;
					  });
						document.getElementById("noidung").innerHTML = html;
						document.getElementById("msg").style.display = "none";  
						$(document).ready(function(){
							
							  $('table #editButton').on('click', function(event){
									event.preventDefault();
									//href="<c:url value="/manager-account/findById/${item.accountId }" />"
									var accountId = jQuery(this).attr("data-f");
									$.ajax({
										type : "GET",
										contentType : "application/json",
										url : "manager-account/findById",
										data : {
											accountId : accountId,
										},
										timeout : 2000,
										success : function(data) {
											$('#accountId').val(data.accountId);
											$('#name').val(data.name);
											$('#address').val(data.address);
											$('#phone').val(data.phone);
											$('#email').val(data.email);
											$('#username').val(data.username);
										},
										error : function(e) {
											console.log("ERROR: ", e);
										}
									});
									$('#editModal').modal();
									
								});
							  
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
		
		  $('table #editButton').on('click', function(event){
				event.preventDefault();
				//href="<c:url value="/manager-account/findById/${item.accountId }" />"
				var accountId = jQuery(this).attr("data-f");
				$.ajax({
					type : "GET",
					contentType : "application/json",
					url : "manager-account/findById",
					data : {
						accountId : accountId,
					},
					timeout : 2000,
					success : function(data) {
						$('#accountId').val(data.accountId);
						$('#name').val(data.name);
						$('#address').val(data.address);
						$('#phone').val(data.phone);
						$('#email').val(data.email);
						$('#username').val(data.username);
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				
				/*  $.get(href, function(account, status){
					$('#accountId').val(account.accountId);
					$('#name').val(account.name);
					$('#address').val(account.address);
					$('#phone').val(account.phone);
					$('#email').val(account.email);
					$('#username').val(account.username);
					
				});   */ 
				});
				$('#editModal').modal();
				
			});
		  
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