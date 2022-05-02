<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
		integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
		crossorigin="anonymous"></script>
		<%@ include file="/WEB-INF/views/host/head3.jsp" %> 
	</head>
    
    <body>
        <%@ include file="/WEB-INF/views/host/header3.jsp" %>
        <!-- Page Header Start -->
        <div class="page-header" style="padding: 50px 0 30px 0 !important; margin-bottom: 55px;">
           
        </div>
        <!-- body -->
        <div class="container" style="max-width: 1300px !important">
        	<h3><a href="<c:url value="/become-a-host/listings" />"><i class="fas fa-angle-left"></i></a><b>${detailPlace.name }</b></h3>
        	<div class="ileft" >
        		<div class="tomtat">
        			<h5>Chi tiết nhà / phòng cho thuê</h5>
        			<p>Ảnh</p>
        			<p>Thông tin cơ bản về nhà / phòng cho thuê</p>
        			<p>Tiện nghi</p>
        			<p>Vị trí</p>
        			<p>Chỗ ở và phòng</p>
        			<p>An toàn cho khách</p>
        		</div>
        	</div>
		<div class="iright">
			<b>Ảnh</b> <br>
			<br>
			<form action="<c:url value="/become-a-host/detailplace/add-image/${detailPlace.placeId }" />" method="post" enctype="multipart/form-data">	
				<div class="imgcha">
					<c:forEach var="item" items="${detailPlace.images }">
						<div class="imgcon">
							<img alt="" width="200px" height="135px" src="<c:url value="/asset/images/${item.name }" />">
							<a href="/become-a-host/detailplace/delete-image/${item.imageId }">
								<i class="fas fa-times" class="deleteimg"></i>
							</a>
						</div>
					</c:forEach>
					<br><br>
					<input type="file" name="imageFile" multiple />
				</div>
				<br> 
				<button class="edit">Chỉnh sửa</button> <br>
			</form>
			<br>
			<hr>
			<br>
			<h5>Thông tin cơ bản về nhà phòng cho thuê</h5>
			<br>
				<%-- <form action="<c:url value="/become-a-host/detailplace/editplace/${detailPlace.placeId }" />" method="post"> --%>
					<label>Tiêu đề nhà / phòng cho thuê</label><br> 
					<input value="${detailPlace.name }" name="tieude" id="tieude" class="tieude"><br> 
					<div id="ajax-response1"></div><br>
					<button class="edit" onclick="editTitle()">Chỉnh sửa</button><br><br><hr><br> 
					
					<label>Mô tả nhà phòng cho thuê</label><br>
					<textarea value="" name="detail" id="detail" class="mota">${detailPlace.detail }</textarea><br> 
					<div id="ajax-response2"></div><br>
					<button class="edit" onclick="editDetail()">Chỉnh sửa</button><br><br><hr><br>
					
					<label>Vị trí</label><br> 
					<input value="${detailPlace.address }" id="address" name="address" class="tieude"><br> 
					<div id="ajax-response3"></div><br>
					<button class="edit" onclick="editAddress()">Chỉnh sửa</button><br><br><hr><br>
					
					<label>Giá cho thuê nhà / phòng</label>
					<input value="${detailPlace.price }" name="price" id="price" type="number" class="price">$<br>
					<div id="ajax-response4"></div><br>
					<button class="edit" onclick="editPrice()">Chỉnh sửa</button><br><br><hr>
					
					<p class="asa">Ngày cho thuê nhà / phòng</p><br>
					<label>Ngày bắt đầu </label>
					<input value="${detailPlace.startDay }" name="startDay" id="startDay" type="date" class="date"><br><br> 
					
					<label>Ngày kết thúc </label> 
					<input value="${detailPlace.endDay }" name="endDay" type="date" id="endDay" class="date"><br>
					<div id="ajax-response5"></div><br>
					<button class="edit" onclick="editDate()">Chỉnh sửa</button><br><br><hr><br>
					
					<!--  -->
					<label class="asa">Trạng thái nhà / phòng cho thuê </label><br><br>
					<c:choose>
						<c:when test="${detailPlace.isEmpty == 'true' }">
							<input value="true" name="radio" type="radio" class="date isEmpty" value="1" checked> Đã đăng<br>
							<p class="note">Khách có thể tìm thấy nhà/phòng cho thuê của bạn trong kết quả tìm kiếm và yêu cầu thông tin về tình trạng còn phòng hoặc đặt phòng vào những ngày còn trống.</p>
							<input value="false" name="radio" type="radio" class="date isEmpty" value="0"> Đã hủy đăng<br>
							<p class="note">Khách không thể đặt phòng hoặc tìm thấy nhà/phòng cho thuê của bạn trong kết quả tìm kiếm.</p>
						</c:when>
						<c:otherwise>
							<input value="true" name="radio" type="radio" class="date isEmpty" value="1"> Đã đăng<br>
							<p class="note">Khách có thể tìm thấy nhà/phòng cho thuê của bạn trong kết quả tìm kiếm và yêu cầu thông tin về tình trạng còn phòng hoặc đặt phòng vào những ngày còn trống.</p>
							<input value="false" name="radio" type="radio" class="date isEmpty" value="0" checked> Đã hủy đăng<br>
							<p class="note">Khách không thể đặt phòng hoặc tìm thấy nhà/phòng cho thuê của bạn trong kết quả tìm kiếm.</p>
						</c:otherwise>
					</c:choose>
					
					<!--  -->
					<div id="ajax-response6"></div><br>
					<button class="edit" onclick="editEmpty()">Chỉnh sửa</button><br><br><hr>
				<!-- </form> -->
				<!--  -->
					 
				<%-- <form action="<c:url value="/become-a-host/detailplace/editdetail/${detailPlace.detailId.detailId }" />" method="post"> --%>
					<br>
					<label>Số lượng khách</label> 
					<input type="number" value="${detailPlace.detailPlace.phongkhach }" name="khach" id="khach" class="khach" /> <br>
					<button class="edit" onclick="editDetail()">Chỉnh sửa</button> <br>
					<br><hr>
					<!--  -->
					<br>
					<p>Chỗ ở và phòng</p>
	
					<label>Phòng ngủ: </label> 
					<input type="number" value="${detailPlace.detailPlace.phongngu }" name="phongngu" id="phongngu" class="khach" />
					<label>Giường: </label> 
					<input type="number" value="${detailPlace.detailPlace.giuong }" name="giuong" id="giuong" class="khach" />
					<label>Phòng vệ sinh: </label> 
					<input type="number" value="${detailPlace.detailPlace.phongvs }" name="phongvs" id="phongvs" class="khach" />  <br>
					<input value="${detailPlace.detailPlace.detailId }" name="detailId" id="detailId"  hidden />  <br>
					<input value="${detailPlace.placeId }" name="placeId" id="placeId"  hidden />  <br> 
					<div id="ajax-response"></div>
					
					<button  class="edit" onclick="editDetailPlace()">Chỉnh sửa</button> <br>
					<br><hr>
				
					<div class="rating">
							<div class="dtieude">
								<i class="fa fa-star"></i> ${rating } . ${reviewList.size() } đánh giá
							</div>
							<div>
								<c:forEach var="item" items="${reviewList }">
									<div class="item-review">
										<div class="d-avt">
											<div class="avt">
												<img alt="" width="50px" height="50px" src="<c:url value="/asset/images/${item.account.image }" />">
											</div>
											<div >
												<b>${item.account.name }</b>
												<p>${item.dateSubmit }</p>
												<c:forEach begin="1" end="${item.rate }" varStatus="loop">
													<i class="fas fa-star item-star"></i>
												</c:forEach>
											</div>
										</div>
											<p class="review">${item.content }</p>
											<a class="rep">Trả lời</a><br>
											<div id="reaction-${item.reviewId }" class="reaction">
												<c:forEach var="itemReaction" items="${reactionList }">
													<c:if test="${itemReaction.review.reviewId == item.reviewId }">
														<div class="reac-avt-${item.reviewId }" id="reac-avt-${itemReaction.reactionId }">
															<div class="avt">
																<img alt="" width="50px" height="50px" src="<c:url value="/asset/images/${itemReaction.account.image }" />">
															</div>
															<div >
																<b>${itemReaction.account.name }</b>
																<p>${itemReaction.dateSubmit }</p>
																<a data-delete="${itemReaction.reactionId }" class="deletereaction" >Xóa</a>
															</div>
															<p class="review">${itemReaction.details }</p>
														</div>
														
													</c:if>
												</c:forEach>
											</div>
											<div>
											
											<input class="input-rep" type="text" id="rep-${item.reviewId }" /><button data-rep="${item.reviewId }" class="okrep">Trả lời</button>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
				<!-- </form> -->
			
			
		</div>
	</div>
	
		<!-- end body -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
      
       <script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
			integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
			crossorigin="anonymous"></script>
			
		<script>
		
		jQuery('.deletereaction').click(function(evt) {
			  evt.preventDefault();

			  var reactionId = jQuery(this).attr("data-delete");
			  var item = "reac-avt-" + reactionId;
			  console.log(reactionId);
			  console.log(item);
			 
				  $.ajax({
						type : "GET",
						contentType : "application/json",
						url : "/DeleteReaction",
						data : {
							reactionId : reactionId,
						},
						timeout : 2000,
						success : function(data) {		
							console.log("SUCCESS: ");
							document.getElementById(item).style.display = "none";
						},
						error : function(e) {
							console.log("ERROR: ", e);
						}
					});
			});
		
		</script>
		
		<script type="text/javascript">
			function editDetailPlace(){
				var detailId = $("#detailId").val();
				var khach = $("#khach").val();
				var phongngu = $("#phongngu").val();
				var giuong = $("#giuong").val();
				var phongvs = $("#phongvs").val();
				
				$.ajax({
					type : "GET",
					contentType : "application/json",
					url : "/become-a-host/detailplace/editdetail",
					data : {
						detailId : detailId,
						khach: khach,
						phongngu: phongngu,
						giuong : giuong,
						phongvs : phongvs
					},
					timeout : 2000,
					success : function(data) {
						console.log("SUCCESS: ");
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response").html(result);
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				});
			}
		</script>
        
        <script type="text/javascript">
	  $(document).ready(function(){
		
		  $('.okrep').on('click', function(event){
				event.preventDefault();
				var userName = '<c:out value="${accLogin.name}"/>';
			  	var imageAccount = '<c:out value="${accLogin.image}"/>';
				var reviewId = jQuery(this).attr("data-rep");
				var inputrep = 'rep-'+reviewId;
				var reactionHTML = 'reaction-'+reviewId;
				var detail = document.getElementById(inputrep).value;
				
				var htmlObj = document.getElementById(reactionHTML);
				var htmlChild = "reac-avt-"+reviewId;
				
				console.log(userName);
				console.log(htmlChild);
				console.log(htmlObj);
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/review-reaction",
					dataType: "json",
					data : jQuery.param({
						reviewId : reviewId,
						detail: detail
					}),
					success : function(data) {
						console.log("SUCCESS: ", data);
						
						
						var result = '<div id="reac-avt-'+data.reactionId +'" class="reac-avt-'+data.reviewId+'">'
								+ ' 	<div class="avt">'
								+ ' 		<img alt="" width="50px" height="50px" src="/asset/images/'+imageAccount+'">'
								+ ' 	</div>'
								+ ' 	<div >'
								+ ' 		<b>'+userName+'</b>'
								+ ' 		<p>'+data.dateSubmit +'</p>'
								+ '			<a data-delete="'+data.reactionId +'" class="deletereaction" >Xóa</a>'
								+ ' 	</div>'
								+ '     <p class="review">'+detail +'</p>'
								+ ' </div>';
						document.getElementById(reactionHTML).innerHTML = htmlObj.innerHTML + result;
						document.getElementById(inputrep).value = "";
						jQuery('.deletereaction').click(function(evt) {
						  var reactionId = jQuery(this).attr("data-delete")
						  var item = "reac-avt-" + reactionId;
						  console.log(reactionId);
						  console.log(item);
						 
							  $.ajax({
									type : "GET",
									contentType : "application/json",
									url : "/DeleteReaction",
									data : {
										reactionId : reactionId,
									},
									timeout : 2000,
									success : function(data) {		
										console.log("SUCCESS: ");
										document.getElementById(item).style.display = "none";
									},
									error : function(e) {
										console.log("ERROR: ", e);
									}
								});
						});
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				});
			});
		  
		/*   $('table #deleteButton').on('click', function() {
				event.preventDefault();
				var href = $(this).attr('href');
				$('#confirmDeleteButton').attr('href', href);
				$('#deleteModal').modal();
			}); */
	  });
	  
	</script>
	
    <script type="text/javascript">
			
			function editTitle(){
				var placeId = $("#placeId").val();
				var tieude = $("#tieude").val();
				var detail = $("#detail").val();
				var address = $("#address").val();
				var price = $("#price").val();
				var startDay = $("#startDay").val();
				var endDay = $("#endDay").val();
				var isEmpty = $('input[name=radio]:checked').val();
				
				
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/become-a-host/detailplace/editplace",
					dataType: "json",
					data : jQuery.param({
						placeId : placeId,
						tieude: tieude,
						detail: detail,
						address : address,
						price : price,
						startDay : startDay,
						endDay : endDay,
						isEmpty : isEmpty
					}),
					success : function(data) {
						console.log("SUCCESS: ");
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response1").html(result);
					},
					error : function(e) {
						console.log("ERROR: ", e);
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response1").html(result);
					}
				});
			}
			function editDetail(){
				var placeId = $("#placeId").val();
				var tieude = $("#tieude").val();
				var detail = $("#detail").val();
				var address = $("#address").val();
				var price = $("#price").val();
				var startDay = $("#startDay").val();
				var endDay = $("#endDay").val();
				var isEmpty = $('input[name=radio]:checked').val();
				
				
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/become-a-host/detailplace/editplace",
					dataType: "json",
					data : jQuery.param({
						placeId : placeId,
						tieude: tieude,
						detail: detail,
						address : address,
						price : price,
						startDay : startDay,
						endDay : endDay,
						isEmpty : isEmpty
					}),
					success : function(data) {
						console.log("SUCCESS: ");
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response2").html(result);
					},
					error : function(e) {
						console.log("ERROR: ", e);
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response2").html(result);
					}
				});
			}
			function editAddress(){
				var placeId = $("#placeId").val();
				var tieude = $("#tieude").val();
				var detail = $("#detail").val();
				var address = $("#address").val();
				var price = $("#price").val();
				var startDay = $("#startDay").val();
				var endDay = $("#endDay").val();
				var isEmpty = $('input[name=radio]:checked').val();
				
				
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/become-a-host/detailplace/editplace",
					dataType: "json",
					data : jQuery.param({
						placeId : placeId,
						tieude: tieude,
						detail: detail,
						address : address,
						price : price,
						startDay : startDay,
						endDay : endDay,
						isEmpty : isEmpty
					}),
					success : function(data) {
						console.log("SUCCESS: ");
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response3").html(result);
					},
					error : function(e) {
						console.log("ERROR: ", e);
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response3").html(result);
					}
				});
			}
			function editPrice(){
				var placeId = $("#placeId").val();
				var tieude = $("#tieude").val();
				var detail = $("#detail").val();
				var address = $("#address").val();
				var price = $("#price").val();
				var startDay = $("#startDay").val();
				var endDay = $("#endDay").val();
				var isEmpty = $('input[name=radio]:checked').val();
				
				
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/become-a-host/detailplace/editplace",
					dataType: "json",
					data : jQuery.param({
						placeId : placeId,
						tieude: tieude,
						detail: detail,
						address : address,
						price : price,
						startDay : startDay,
						endDay : endDay,
						isEmpty : isEmpty
					}),
					success : function(data) {
						console.log("SUCCESS: ");
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response4").html(result);
					},
					error : function(e) {
						console.log("ERROR: ", e);
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response4").html(result);
					}
				});
			}
			function editDate(){
				var placeId = $("#placeId").val();
				var tieude = $("#tieude").val();
				var detail = $("#detail").val();
				var address = $("#address").val();
				var price = $("#price").val();
				var startDay = $("#startDay").val();
				var endDay = $("#endDay").val();
				var isEmpty = $('input[name=radio]:checked').val();
				
				
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/become-a-host/detailplace/editplace",
					dataType: "json",
					data : jQuery.param({
						placeId : placeId,
						tieude: tieude,
						detail: detail,
						address : address,
						price : price,
						startDay : startDay,
						endDay : endDay,
						isEmpty : isEmpty
					}),
					success : function(data) {
						console.log("SUCCESS: ");
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response5").html(result);
					},
					error : function(e) {
						console.log("ERROR: ", e);
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response5").html(result);
					}
				});
			}
			function editEmpty(){
				var placeId = $("#placeId").val();
				var tieude = $("#tieude").val();
				var detail = $("#detail").val();
				var address = $("#address").val();
				var price = $("#price").val();
				var startDay = $("#startDay").val();
				var endDay = $("#endDay").val();
				var isEmpty = $('input[name=radio]:checked').val();
				
				
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/become-a-host/detailplace/editplace",
					dataType: "json",
					data : jQuery.param({
						placeId : placeId,
						tieude: tieude,
						detail: detail,
						address : address,
						price : price,
						startDay : startDay,
						endDay : endDay,
						isEmpty : isEmpty
					}),
					success : function(data) {
						console.log("SUCCESS: ");
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response6").html(result);
					},
					error : function(e) {
						console.log("ERROR: ", e);
						var result = "<p class=\"success\"> Đã lưu </h3>";
						$("#ajax-response6").html(result);
					}
				});
			}
			
		</script>
		
    </body>
</html>
