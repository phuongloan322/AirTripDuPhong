<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Mục Thuê
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
          <a class="navbar-brand" href="/admin/manager-category"> <i class="fas fa-angle-left"></i>QUẢN LÝ LOẠI NHÀ</a>
        </div>

        <div class="collapse navbar-collapse justify-content-end">

          <form action="/admin/manager-category/${category.categoryId}" method="post" class="navbar-form">
            <div class="input-group no-border">
              <input type="text" value="${search}" class="form-control" style="color: #fff" name="search" placeholder="Search...">
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalThem">
              <i class="material-icons large">add_box</i> Add new
            </button>

            <div class="card">
              <div class="card-header card-header-primary">
                <h4 class="card-title ">Manager Litle Category</h4>
                <p class="card-category"> Danh sách Loại nhà</p>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <c:choose>
                    <c:when test="${litleCategoryList.size() > 0 }">
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
                        <th width="30%">
                          Mô tả
                        </th>
                        <th>
                          Chức năng
                        </th>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${litleCategoryList }" varStatus="loop">
                          <tr>
                            <td>
                                ${loop.index + 1 }
                            </td>
                            <td>
                                ${item.litleCategoryId }
                            </td>
                            <td>
                                ${item.litleName }
                            </td>
                            <td class="textoverflow3" style="padding-bottom: 0; ">
                                ${item.detail }
                            </td>
                            <td class="chucnang">
                              <a href="<c:url value="/admin/manager-litlecategory/findById/${item.litleCategoryId }" />" class="detailButton"><i class="material-icons detail">event_note</i></a>
                              <a href="<c:url value="/admin/manager-litlecategory/findById/${item.litleCategoryId }" />" class="editButton"><i class="material-icons edit">mode_edit</i></a>
                              <a href="<c:url value="/admin/manager-litlecategory/delete/${item.litleCategoryId }" />" class="deleteButton"><i class="material-icons delete">delete</i></a>
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
        <h5 class="modal-title" >Thêm Mục Thuê</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action ="<c:url value="/admin/manager-litlecategory/add" />" method="post">
          <label class="">Loại danh mục</label><br>
          <input type="text" class="form-control-file " value="${category.categoryId}" name="categoryId" readonly><br>

          <label class="">Mã loại nhà</label><br>
          <input type="text" class="form-control-file "  name="litleCategoryId"><br>

          <label class="">Tên loại nhà</label>
          <input type="text" class="form-control-file "  name="litleName">

          <label class="">Mô tả</label>
          <textarea type="text" class="form-control-file " style="height: 100px !important;" name="detail"></textarea>

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

          <label class="">Loại danh mục</label>
          <input type="text" class="form-control-file " value="${category.categoryId}" name="categoryId" readonly>

          <label class="">Mã loại nhà</label>
          <input type="text" class="form-control-file " id="litleCategoryIddetail" name="litleCategoryId" readonly>

          <label class="">Tên loại nhà</label>
          <input type="text" class="form-control-file " id="litleNamedetail" name="litleName">

          <label class="">Mô tả</label>
          <textarea type="text" class="form-control-file " id="detaildetail" name="detail" style="height: 100px !important;"></textarea>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
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
        <form action ="<c:url value="/admin/manager-litlecategory/edit" />" method="post">

          <label class="">Loại danh mục</label>
          <input type="text" class="form-control-file " value="${category.categoryId}" name="categoryId" readonly>

          <label class="">Mã loại nhà</label>
          <input type="text" class="form-control-file " id="litleCategoryId" name="litleCategoryId" readonly>

          <label class="">Tên loại nhà</label>
          <input type="text" class="form-control-file " id="litleName" name="litleName">

          <label class="">Mô tả</label>
          <textarea type="text" class="form-control-file " id="detail" name="detail" style="height: 100px !important;"></textarea>

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
        <h5 class="modal-title">Xác nhận xóa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Bạn có chắc chắn muốn xóa mục này?</p>
      </div>
      <div class="modal-footer">
        <a class="btn btn-primary" id="confirmDeleteButton" href="">Xóa</a>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){

    $('table .editButton').on('click', function(event){
      event.preventDefault();
      var href= $(this).attr('href')
      console.log(href)
      $.get(href, function(litleCategory, status){
        $('#litleCategoryId').val(litleCategory.litleCategoryId);
        $('#litleName').val(litleCategory.litleName);
        $('#detail').val(litleCategory.detail);
      });

      $('#editModal').modal();
    });

    $('table .detailButton').on('click', function(event){
      event.preventDefault();
      var href= $(this).attr('href')
      console.log(href)
      $.get(href, function(litleCategory, status){
        $('#litleCategoryIddetail').val(litleCategory.litleCategoryId);
        $('#litleNamedetail').val(litleCategory.litleName);
        $('#detaildetail').val(litleCategory.detail);
      });

      $('#detailModal').modal();
    });

    $('table .deleteButton').on('click', function() {
      event.preventDefault();
      var href = $(this).attr('href');
      $('#confirmDeleteButton').attr('href', href);
      $('#deleteModal').modal();
    });
  });

</script>
<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>

</html>