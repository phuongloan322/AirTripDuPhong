<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>${detailPlace.name }</title>
<%@ include file="/WEB-INF/views/layout/head.jsp"%>
</head>

<body class="light-edition">
	<div class="wrapper ">
		<%@ include file="/WEB-INF/views/layout/sidebar.jsp"%>
		<div class="main-panel" style="background: white !important;">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top "
				id="navigation-example">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="javascript:void(0)"></a>
					</div>

					<div class="collapse navbar-collapse justify-content-end">

						<form 
							class="navbar-form">
							<div class="input-group no-border">
								<input type="text" value="" class="form-control" name="search"
									placeholder="Search...">
								<button type="submit"
									class="btn btn-default btn-round btn-just-icon">
									<i class="material-icons">search</i>
									<div class="ripple-container"></div>
								</button>
							</div>
						</form>

						<%@ include file="/WEB-INF/views/layout/nav-link.jsp"%>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div class="content setw">

				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<h2 class="ptieude">
								<a href="<c:url value="/manager-place" />"><i class="material-icons detail">chevron_left</i></a>
								<b>${detailPlace.name }</b>
							</h2>
							<b>Ảnh</b> <br> <br>
							<div class="imgcha">
								<c:forEach var="item" items="${detailPlace.image }">
									<div class="imgcon">
										<img alt="" width="200px" height="135px"
											src="<c:url value="/assets/images/${item }" />"> <a
											href="<c:url value="/become-a-host/detailplace/delete-image/${detailPlace.placeId }?image=${item }" />">
											<i class="fas fa-times" class="deleteimg"></i>
										</a>
									</div>
								</c:forEach>
								<br>
								<br>
							</div>
							<br> <br> <br>
							
							<br>
							<h3>Thông tin cơ bản về nhà phòng cho thuê</h3>
							<br> <label>Tiêu đề nhà / phòng cho thuê</label><br> <input
								value="${detailPlace.name }" name="tieude" class="tieude"><br>
							<br>
							<br>
							
							<br> <label>Mô tả nhà phòng cho thuê</label><br>
							<textarea value="" name="detail" class="mota">${detailPlace.detail }</textarea>
							<br> <br>
							<br>
							
							<br> <label>Vị trí</label><br> <input
								value="${detailPlace.address }" name="address" class="tieude"><br>
							<br>
							<br>
							
							<br> <label>Giá cho thuê nhà / phòng</label> <input
								value="${detailPlace.price }" name="price" type="number"
								class="price">$ <br>
							<br>
							
							<p class="asa">Ngày cho thuê nhà / phòng</p>
							<br> <label>Ngày bắt đầu </label> <input
								value="${detailPlace.startDay }" name="startDay" type="date"
								class="date"><br>
							<br> <label>Ngày kết thúc </label> <input
								value="${detailPlace.endDay }" name="endDay" type="date"
								class="date"><br> <br>
							<br>
							
							<br>

							<!--  -->
							<label class="asa">Trạng thái nhà / phòng cho thuê </label><br>
							<br>
							<c:choose>
								<c:when test="${detailPlace.isEmpty == 'true' }">
									<input value="true" name="radio" type="radio" class="date"
										checked> Đã đăng<br>
									<p class="note">Khách có thể tìm thấy nhà/phòng cho thuê
										của bạn trong kết quả tìm kiếm và yêu cầu thông tin về tình
										trạng còn phòng hoặc đặt phòng vào những ngày còn trống.</p>
								</c:when>
								<c:otherwise>
									<input value="false" name="radio" type="radio" class="date"
										checked> Đã hủy đăng<br>
									<p class="note">Khách không thể đặt phòng hoặc tìm thấy
										nhà/phòng cho thuê của bạn trong kết quả tìm kiếm.</p>
								</c:otherwise>
							</c:choose>

							<!--  -->
							<br>
							<br>
							<p>Chỗ ở và phòng</p>

							<br> <label>Số lượng khách</label> <input type="number"
								value="${detailPlace.detailId.phongkhach }" name="khach"
								class="khach" /> <br>
							
							<!--  -->
							<br>
							<label>Phòng ngủ: </label> <input type="number"
								value="${detailPlace.detailId.phongngu }" name="phongngu"
								class="khach" /> <label>Giường: </label> <input type="number"
								value="${detailPlace.detailId.giuong }" name="giuong"
								class="khach" /> <label>Phòng vệ sinh: </label> <input
								type="number" value="${detailPlace.detailId.phongvs }"
								name="phongvs" class="khach" /> <br> <br>
							<hr>
							<h3>Thông tin cơ bản về chủ nhà</h3><br>
							<p>Họ và tên: ${detailPlace.account.name }</p>
							<p>Số điện thoại: ${detailPlace.account.phone }</p>
							<p>Địa chỉ: ${detailPlace.account.address }</p>
							<p>Email: ${detailPlace.account.email }</p>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$('table #editButton').on('click', function(event) {
				event.preventDefault();

				var href = $(this).attr('href')
				$.get(href, function(category, status) {
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
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</html>