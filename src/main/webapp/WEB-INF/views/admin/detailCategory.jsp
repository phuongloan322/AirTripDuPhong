<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Loại Mục Thuê
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
            <a class="navbar-brand" href="javascript:void(0)">QUẢN LÝ LOẠI MỤC THUÊ</a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/manager-category" />" method="post" class="navbar-form">
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
      
      <c:if test="${msg != \"\" }">
       		<div class="alert alert-info" role="alert">${msg }</div>     
      </c:if>

      
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalThem">
            	<i class="material-icons large">add_box</i> Add new
            </button>
			
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Category Place</h4>
                  <p class="card-category"> Danh sách Mục thuê</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                  	<c:choose>
                  		<c:when test="${categoryList.size() > 0 }">
                  			<table class="table">
		                      <thead class=" text-primary">
		                        <th>
		                          STT
		                        </th>
		                        <th>
		                          Mã mục thuê
		                        </th>
		                        <th>
		                          Tên mục thuê
		                        </th>
		                        <th>
		                          Chức năng
		                        </th>
		                      </thead>
		                      <tbody>
		                        <c:forEach var="item" items="${categoryList }" varStatus="loop">
		                        	<tr>
		                          <td>
		                            ${loop.index + 1 }
		                          </td>
		                          <td>
		                            ${item.categoryId }
		                          </td>
		                          <td>
		                            ${item.name }
		                          </td>
		                          <td class="chucnang">
		                            <a href="<c:url value="/category/${item.categoryId }" />"><i class="material-icons detail">event_note</i></a>
		                            <a href="<c:url value="/manager-category/findById/${item.categoryId }" />" id="editButton"><i class="material-icons edit">mode_edit</i></a>
		                            <a href="<c:url value="/manager-category/delete/${item.categoryId }" />" id="deleteButton"><i class="material-icons delete">delete</i></a>
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
	        <form action ="<c:url value="/manager-category/add" />" method="post">
				<label for="exampleFormControlFile1" class="">Mã mục thuê</label><br>
				<input type="text" class="form-control-file " id="exampleFormControlFile1" name="categoryId"><br>
				  
				<label for="exampleFormControlFile1" class="">Tên mục thuê</label>
				<input type="text" class="form-control-file " id="exampleFormControlFile1" name="name">
				  
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
	        <h5 class="modal-title" id="exampleModalLabel">Thông tin mục thuê</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<c:url value="/manager-category/edit" />" method="post">
	        
	        	<div class="">
				    <label for="exampleFormControlFile1" class="">Mã mục thuê</label>
				    <input type="text" class="form-control-file " id="categoryId" name="categoryId"  readonly>
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Tên mục thuê</label>
				    <input type="text" class="form-control-file " id="name" name="name" >
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

	 <script type="text/javascript">
	  $(document).ready(function(){
		
		  $('table #editButton').on('click', function(event){
				event.preventDefault();
				
				var href= $(this).attr('href')
				 $.get(href, function(category, status){
					$('#categoryId').val(category.categoryId);
					$('#name').val(category.name);
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