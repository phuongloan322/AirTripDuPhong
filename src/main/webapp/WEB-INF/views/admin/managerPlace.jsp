<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>
        Quản Lý Nhà / phòng
    </title>
    <%@ include file="/WEB-INF/views/admin/layout/head.jsp" %>
    <link href="/asset/asset/css/font-awesome.min.css" rel="stylesheet">
</head>

<body class="light-edition">
<div class="wrapper ">
    <%@ include file="/WEB-INF/views/admin/layout/sidebar.jsp" %>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example"  style="background-color: darkslategrey !important;color:#fff">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="<c:url value="/manager-place" />">QUẢN LÝ NHÀ / PHÒNG</a>
                </div>

                <div class="collapse navbar-collapse justify-content-end">

                    <form action="<c:url value="/admin/manager-place/page/1" />" method="post" class="navbar-form">
                        <div class="input-group no-border">
                            <select onchange="test()" class="form-control" name="filter" id="filter" style="height: 36px; margin-right: 20px; color: #fff">
                                <option style="color: #222" value=""> Tìm kiếm tất cả </option>
                                <option style="color: #222" value="danhmuc"> Theo danh mục</option>
                                <option style="color: #222" value="date"> Theo ngày </option>
                                <option style="color: #222" value="price"> Theo giá </option>
                                <option style="color: #222" value="price asc"> Giá tăng dần </option>
                                <option style="color: #222" value="price desc"> Giá giảm dần </option>
                            </select>
                            <select class="form-control" name="category" id="category" style="height: 36px; margin-right: 20px; color: #fff; display: none">
                                <option style="color: #222" value="">Tất cả</option>
                                <c:forEach items="${categories}" var="item">
                                    <option style="color: #222" value="${item.categoryId}">${item.name}</option>
                                </c:forEach>
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
            <!--  -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">


                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title ">Place</h4>
                                <p class="card-category"> Danh sách Nhà/phòng</p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <c:choose>
                                    <c:when test="${placeList.size() > 0 }">
                                    <table class="table">
                                        <thead class=" text-primary">
                                        <th>
                                            STT
                                        </th>
                                        <th>
                                            Ảnh
                                        </th>
                                        <th width="35%">
                                            Chi tiết nhà/phòng
                                        </th>
                                        <th>
                                            Mô tả
                                        </th>
                                        <th>
                                            Tình trạng
                                        </th>
                                        <th>
                                            Chức năng
                                        </th>
                                        </thead>
                                        <tbody id="noidung2"></tbody>
                                        <tbody id="noidung">

                                        <c:forEach var="item" items="${placeList }" varStatus="loop">
											<c:forEach var="rate" items="${ratings }" varStatus="i">
												<c:if test="${loop.index == i.index}">
												<tr>
													<td>
															${loop.index + 1}
													</td>
													<td>
														<img alt="" width="120" height="100"
															 src="/asset/images/${item.images[0].name }"
															 style="border-radius: 10px">
													</td>
													<td>
														<a href="<c:url value="/admin/manager-place/detail/${item.placeId }" />"><h5>
															<b>${item.name }</b></h5></a>
														<i>${item.address } </i><br>
                                                        <div class="row">
                                                            <div class="col-1">
                                                                <i class="material-icons" style="color: #ef4365;">star</i>
                                                            </div>
                                                            <div class="col-3">
                                                                    ${rate}
                                                            </div>
                                                        </div>


													</td>
													<td>
														<c:if test="${item.startDay != null && item.endDay != null}">
															Ngày bắt đầu: ${item.startDay.split("-")[2]} -
															${item.startDay.split("-")[1]} -
															${item.startDay.split("-")[0]}
															<br>
															Ngày kết thúc: ${item.endDay.split("-")[2]} -
															${item.endDay.split("-")[1]} -
															${item.endDay.split("-")[0]}
															<br>
														</c:if>
														Giá: <b>$${item.price }/đêm</b><br>
													</td>
													<td class="status">
														<c:choose>
															<c:when test="${item.isAccept == true }">
																<p><a id="status-on-${item.placeId }" class="st-on" style="color: #fff !important;background-color: lightslategray"
																	  data-on="${item.placeId }">Đã xác nhận</a></p>
															</c:when>
															<c:otherwise>
																<p><a id="status-on-${item.placeId }" class="st-on" style="color: #fff !important;background-color: darkcyan;"
																	  data-on="${item.placeId }">Xác nhận</a></p>
															</c:otherwise>
														</c:choose>
													</td>
													<td class="chucnang">
<%--														<a href="<c:url value="/admin/manager-place/detail/${item.placeId }" />"--%>
<%--														   id="editButton"><i class="material-icons detail">event_note</i></a>--%>
														<a href="<c:url value="/admin/manager-place/delete/${item.placeId }" />"
														   id="deleteButton"><i class="material-icons delete">delete</i></a>
													</td>
												</tr>
												</c:if>
											</c:forEach>
                                        </c:forEach>
                                </div>
                                </tbody>
                                </table>
                                </c:when>
                                <c:otherwise>
                                    Không tìm thấy kết quả nào
                                </c:otherwise>
                                </c:choose>
                                <ul class="pagination modal-6">
                                    <c:if test="${currentPage > 1}">
                                        <li > <a href="/admin/manager-place/page/${currentPage-1}?search=${search}&filter=${filter}" class="page-border-left">&laquo</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPages }" varStatus="loop">
                                        <c:if test="${currentPage == loop.index}">
                                            <li > <a href="/admin/manager-place/page/${loop.index}?search=${search}&filter=${filter}" class="active">${loop.index }</a></li>
                                        </c:if>
                                        <c:if test="${currentPage != loop.index}">
                                            <li ><a href="/admin/manager-place/page/${loop.index}?search=${search}&filter=${filter}" >${loop.index }</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages}">
                                        <li > <a href="/admin/manager-place/page/${currentPage+1}?search=${search}&filter=${filter}" class="page-border-right">&raquo;</a></li>
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


<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thông tin mục thuê</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="myFormId">

                    <div class="">
                        <label class="">Tên nhà/phòng</label>
                        <input type="text" class="form-control-file " id="placeName" name="placeName">
                    </div>
                    <div class="">
                        <label class="">Chủ nhà</label>
                        <input type="text" class="form-control-file " id="accountName" name="accountName">
                    </div>

                    <div class="">
                        <label class="">Địa chỉ</label>
                        <input type="text" class="form-control-file " id="address" name="address">
                    </div>
                    <div class="">
                        <label class="">Ngày cho thuê</label>
                        <input type="text" class="form-control-file " id="startDay" name="startDay">
                    </div>
                    <div class="">
                        <label class="">Ngày trả</label>
                        <input type="text" class="form-control-file " id="endDay" name="endDay">
                    </div>

                    <div class="">
                        <label class="">Giá / 1 đêm</label>
                        <input type="text" class="form-control-file " id="price" name="price">
                    </div>

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
                <p>Bạn có chắc chắn muốn xóa Nhà / phòng này?</p>
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

    function test() {
        const e = document.getElementById("filter");
        const index = e.selectedIndex;
        console.log(index)

        if(index == 1) {
            $("#category").css("display", "block");
            $("#search").css("display", "none");
        }
        else {
            $("#category").css("display", "none");
            $("#search").css("display", "block");
            if(index == 2) {
                $("#search").attr('type', 'date');
            }
            else if(index == 3) {
                $("#search").attr('type', 'number');
            }
            if(index == 4) {
                window.location.href = "/admin/manager-place/page/1?filter=price asc";
            }
            else if(index == 5) {
                window.location.href = "/admin/manager-place/page/1?filter=price desc";
            }
            else if(index == 0) {
                $("#search").attr('type', 'text');
            }
        }

    }
    var filter = '<c:out value="${filter}"/>';
    document.getElementById("filter").value = filter;
    var category = '<c:out value="${category}"/>';
    document.getElementById("category").value = category;

    if(filter == "date") {
        console.log("ok")
        $("#search").attr('type', 'date');
    }
    if(filter == "danhmuc") {
        $("#category").css("display", "block");
        $("#search").css("display", "none");
    }






    //

    $(document).ready(function () {

        $('table #editButton').on('click', function (event) {
            event.preventDefault();

            var href = $(this).attr('href')
            $.get(href, function (place, status) {
                $('#placeName').val(place.name);
                $('#accountName').val(place.account.name);
                $('#startDay').val(place.startDay);
                $('#endDay').val(place.endDay);
                $('#address').val(place.address);
                $('#price').val(place.price);
            });

            $('#editModal').modal();
        });

        $('table #deleteButton').on('click', function () {
            event.preventDefault();
            var href = $(this).attr('href');
            $('#confirmDeleteButton').attr('href', href);
            $('#deleteModal').modal();
        });
    });

    $('.status a').on('click', function (event) {
        var placeId = jQuery(this).attr("data-on");
        var id = 'status-on-' + placeId;
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/admin/manager-place/status",
            data: {
                placeId: placeId,
            },
            timeout: 2000,
            success: function (data) {
                if (data == false) {
                    document.getElementById(id).innerHTML = "Xác nhận";
                    document.getElementById(id).style.backgroundColor = "darkcyan";
                }
                else {
                    document.getElementById(id).innerHTML = "Đã xác nhận";
                    document.getElementById(id).style.backgroundColor = "lightslategray";
                }

                console.log("SUCCESS: ", data);
            },
            error: function (e) {
                console.log("ERROR: ", e);
            }
        });
    });
</script>


<%@ include file="/WEB-INF/views/admin/layout/footer.jsp" %>
</body>
</html>