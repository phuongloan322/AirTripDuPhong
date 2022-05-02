<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Hot Tours</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://kit.fontawesome.com/a076d05399.js"></script>		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
		<%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
		<%@ include file="/WEB-INF/views/layouts/header.jsp" %>
		<script>$(document).ready(function(){
			$().UItoTop({ easingType: 'easeOutQuart' });
		});
		</script>
	</head>
	<body>
<!--==============================header=================================-->
		<header>
			<div class="i-head">
				<div class="row">
					<div class="col-sm-3">
						<div class="logo pull-left">
							<a href="/index" />"><b class="head3">AirPay</b></a>
						</div>
						
					</div >
					<div class="col-sm-5 pull-left">
						<form action="/places/page/1?" method="post" width="100%">
							<div id="custom-search-input">
                            <div class="input-group">
                                <input type="text" name="search" value="${search}" class="search-query form-control" placeholder="Tìm kiếm nhà / phòng mong muốn..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
						</form>
					</div>
					<div class="col-sm-4">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href="/become-a-host" class="i-chu">Trở thành chủ nhà</a></li>
									<c:if test="${accLogin != null }">
										<li class="dropdown"><a class="i-chu"><i class="fa fa-user"></i>${accLogin.name }<i class="fa fa-angle-down"></i></a>
	                                    	<ul role="menu" class="sub-menu">
	                                    		<li><a href="/manager-account">Thông tin cá nhân</a></li>
	                                    		<li><a href="/loveplace">Danh sách Yêu thích</a></li>
	                                    		<li><a href="/bookroom">Nhà / phòng đã đặt</a></li>
	                                    		<hr>
	                                    		<li><a href="/become-a-host/index">Chế độ chủ nhà</a></li>
		                                        <li><a href="/logout">Đăng xuất</a></li>
		                                    </ul>
		                                </li>
	                                </c:if> 
									<c:if test="${accLogin == null }">
										<li><a href="/login" class="i-chu"><i class="fa fa-lock"></i> Đăng nhập</a></li>
									</c:if> 	
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container_12">
				<div class="grid_12">
					<div class="menu_block">
						<nav class="horizontal-nav full-width horizontalNav-notprocessed">
							<ul class="sf-menu">
								<li><a href="/index">TRANG CHỦ</a></li>
								<li class="current"><a href="/places">KHÁM PHÁ</a></li>
								<li><a href="/bookroom">CHUYẾN ĐI</a></li>
								<li><a href="/index">BLOG</a></li>
								<li><a href="/index">LIÊN HỆ</a></li>
							</ul>
						</nav>
						<div class="clear"></div>
					</div>
				</div>
				<div class="grid_12">
					<h1>
						<a href="/places">
							<img src="/asset/images/logo.png" alt="Your Happy Family">
						</a>
					</h1>
				</div>
			</div>
		</header>
<!--==============================Content=================================-->
		<div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
			<div class="">
				<br>
				<div style="margin: 50px auto; width: 100%">
					<div style="float: left;width: 75%">
						<c:if test="${categoryList.size() > 0 }">
							<ul class="category"class="category">
								<c:forEach var="item" items="${categoryList }">
									<c:if test="${category==item.categoryId}">
										<a href="/places/page/1?search=${search}&category=${item.categoryId}&filter=${filter}"><li class="active" >${item.name }</li></a>
									</c:if>
									<c:if test="${item.categoryId != category}">
										<a href="/places/page/1?search=${search}&category=${item.categoryId}&filter=${filter}"><li >${item.name }</li></a>
									</c:if>

								</c:forEach>
								<a href="/places/"><li >Tất cả</li></a>
							</ul>
						</c:if>
					</div>
					<div>
						<div style="float: left;width: 13%; margin-right: 20px">
							<select class="form-control" name="filter" id="filter" onchange="filter()">
								<option value="">Giá</option>
								<c:if test="${filter.equals(\"asc\")}">
									<option value="asc" selected>Tăng dần theo giá</option>
								</c:if>
								<c:if test="${!filter.equals(\"asc\")}">
									<option value="asc">Tăng dần theo giá</option>
								</c:if>
								<c:if test="${filter.equals(\"desc\")}">
									<option value="desc" selected>Giảm dần theo giá</option>
								</c:if>
								<c:if test="${!filter.equals(\"desc\")}">
									<option value="desc">Giảm dần theo giá</option>
								</c:if>
								<c:if test="${filter.equals(\"pricethap100\")}">
									<option value="pricethap100" selected>Giá dưới $100/đêm</option>
								</c:if>
								<c:if test="${!filter.equals(\"pricethap100\")}">
									<option value="pricethap100">Giá dưới $100/đêm</option>
								</c:if>
								<c:if test="${filter.equals(\"price100\")}">
									<option value="price100" selected>Giá từ $100-200/đêm</option>
								</c:if>
								<c:if test="${!filter.equals(\"price100\")}">
									<option value="price100">Giá từ $100-200/đêm</option>
								</c:if>
								<c:if test="${filter.equals(\"price200\")}">
									<option value="price200" selected>Giá từ $200-300/đêm</option>
								</c:if>
								<c:if test="${!filter.equals(\"price200\")}">
									<option value="price200">Giá từ $200-300/đêm</option>
								</c:if>
								<c:if test="${filter.equals(\"price300\")}">
									<option value="price300" selected>Giá $300-400/đêm</option>
								</c:if>
								<c:if test="${!filter.equals(\"price300\")}">
									<option value="price300">Giá từ $300-400/đêm</option>
								</c:if>
								<c:if test="${filter.equals(\"price400\")}">
									<option value="price400" selected>Giá từ $400-500/đêm</option>
								</c:if>
								<c:if test="${!filter.equals(\"price400\")}">
									<option value="price400">Giá từ $400-500/đêm</option>
								</c:if>
								<c:if test="${filter.equals(\"price500\")}">
									<option value="price500" selected>Giá trên $500/đêm</option>
								</c:if>
								<c:if test="${!filter.equals(\"price500\")}">
									<option value="price500">Giá trên $500/đêm</option>
								</c:if>
							</select>
						</div>
						<div style="float: left;width: 5%">
							<button class="btn btn-light" data-toggle="modal" data-target="#exampleModal">Bộ lọc</button>
						</div>
					</div>
				</div>
				
				<table class="table itable" style="max-width: 90%">
					<tr>
					<c:choose>
						<c:when test="${listPost.size() > 0 }">
							<c:forEach var="item" items="${listPost }" varStatus="loop">
							<input id="ed" value="${ item.placeId }" hidden/>
								<td style="width:33%">
									<div class="iPlace">
										<div class="cha">
											<span class="con1">
												 <c:choose>
													<c:when test="${!Cart.containsKey(item.placeId) }">
														<a data-id="${item.placeId }" >
															<i class="fas fa-heart" id="item-${ item.placeId }" style="color:white"></i>
														</a>
													</c:when>
													<c:otherwise>
														<a data-id="${item.placeId }">
															<i class="fas fa-heart" id="item-${ item.placeId }" style="color:red" ></i>
														</a>
													</c:otherwise>
												</c:choose> 
											</span>
											<img src="/asset/images/${item.images[0].name }" alt="" height="330px">
										</div>
										<div class="label1">
											<div class="float-left title-place1">
												<a href="/detailplace/${item.placeId }">
													<b>${item.name }</b>
												</a>
											</div>
											<div class="float-right">$ ${item.price } / đêm</div>
										</div>
										<div class="label1">
											<div class="float-left title-place2"><i>${item.address }</i></div>
											<c:if test="${item.startDay != null && item.endDay != null}">
												<c:if test="${item.startDay.split(\"-\")[1] == item.endDay.split(\"-\")[1]}">
													<div class="float-right day-place">
														Ngày ${item.startDay.split("-")[2]} - Ngày ${item.endDay.split("-")[2]} tháng ${item.startDay.split("-")[1]}
													</div>
												</c:if>
												<c:if test="${item.startDay.split(\"-\")[1] != item.endDay.split(\"-\")[1]}">
													<div class="float-right day-place">
														Ngày ${item.startDay.split("-")[2]} / ${item.startDay.split("-")[1]} - Ngày ${item.endDay.split("-")[2]} / ${item.endDay.split("-")[1]}
													</div>
												</c:if>
											</c:if>
										</div>
									</div>
								</td>
								<c:if test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1) == placeList.size() }">
									</tr>
								</c:if>
							</c:forEach> 
						</c:when>

						<c:otherwise>
							<h5 style="text-align: center;"><b>Không có kết quả nào được tìm thấy</b></h5>
						</c:otherwise>
					</c:choose>
				
				</table>
			</div>
			<c:if test="${msg == null }">
				<div class="pagination">
					<c:if test="${currentPage > 1}">
						<a href="/places/page/${currentPage-1 }?search=${search}&category=${category}&filter=${filter}">«</a>
					</c:if>
			    <c:forEach begin="1" end="${totalPages }" varStatus="loop">
					<c:if test="${currentPage == loop.index}">
						<a class="active" href="/places/page/${loop.index }?search=${search}&category=${category}&filter=${filter}">${loop.index }</a>
					</c:if>
					<c:if test="${currentPage != loop.index}">
						<a href="/places/page/${loop.index }?search=${search}&category=${category}&filter=${filter}">${loop.index }</a>
					</c:if>
			   </c:forEach>
					<c:if test="${currentPage < totalPages}">
						<a href="/places/page/${currentPage+1 }?search=${search}&category=${category}&filter=${filter}">»</a>
					</c:if>
			 </div>
			</c:if>
		</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<b class="modal-title" id="exampleModalLabel">Tìm kiếm linh hoạt</b>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="/search-advanced" method="post">
			<div class="modal-body">
				<div class="filter">
					<div class="search">
						<p style="padding-left: 10px">Loại nơi ở</p>
						<select name="category">
							<c:forEach var="item" items="${categoryList}">
								<option value="${item.categoryId}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="search">
						<p style="padding-left: 10px">Loại nhà phòng</p>
						<select name="litlecategory">
							<c:forEach var="item" items="${litlecategoryList}">
								<option value="${item.litleCategoryId}">${item.litleName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="filter">
					<div class="search">
						<p style="padding-left: 10px">Loại phòng thuê</p>
						<select style="phongthue">
							<option value="toanbonha">Toàn bộ nhà</option>
							<option value="phongchung">Phòng chung</option>
							<option value="phongrieng">Phòng riêng</option>
						</select>
					</div>
					<div class="search">
						<p style="padding-left: 10px">Địa chỉ</p>
						<input name="address" class="form-control" style="border: none;-webkit-box-shadow: none;" placeholder="Địa chỉ cho thuê..." >
					</div>
				</div>

				<div class="filter">
					<div class="search">
						<p style="padding-left: 10px">Số người cho phép</p>
						<select name="people">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8+</option>
						</select>
					</div>
					<div class="search">
						<p style="padding-left: 10px">Phòng ngủ</p>
						<select name="phongngu">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8+</option>
						</select>
					</div>
				</div>
				<div class="filter">
					<div class="search">
						<p style="padding-left: 10px">Giường</p>
						<select name="giuong">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8+</option>
						</select>
					</div>
					<div class="search">
						<p style="padding-left: 10px">Phòng tắm</p>
						<select name="phongtam">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8+</option>
						</select>
					</div>
				</div>
				<div class="filter">
					<div class="search">
						<p style="padding-left: 10px">Thời gian bắt đầu</p>
						<input name="startdate" id="startdate" class="form-control" style="border: none;-webkit-box-shadow: none;" type="date" >
					</div>
					<div class="search">
						<p style="padding-left: 10px">Thời gian kết thúc</p>
						<input name="enddate" id="enddate" class="form-control" style="border: none;-webkit-box-shadow: none;" type="date">
					</div>
				</div>
				<div class="filter">
					<div class="search">
						<p style="padding-left: 10px">Giá tối thiểu (USD/đêm)</p>
						<input name="price1" class="form-control" style="border: none;-webkit-box-shadow: none;" type="number" value="0" >
					</div>
					<div class="search">
						<p style="padding-left: 10px">Giá tối đa (USD/đêm)</p>
						<input name="price2" class="form-control" style="border: none;-webkit-box-shadow: none;" type="number" value="1000">
					</div>
				</div>
				<div class="filtertiennghi">
					<p>Tiện nghi</p><br>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Bể bơi">
							<label > Bể bơi</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Bồn tắm nước nóng">
							<label > Bồn tắm nước nóng</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Lò sưởng trong nhà">
							<label > Lò sưởng trong nhà</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Thiết bị tập thể dục">
							<label > Thiết bị tập thể dục</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Bếp đốt lửa trại">
							<label > Bếp đốt lửa trại</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Khu vực ăn uống ngoài trời">
							<label > Khu vực ăn uống ngoài trời</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Wi-fi">
							<label > Wi-fi</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="TV">
							<label > TV</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Bếp">
							<label > Bếp</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Máy giặt">
							<label > Máy giặt</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Điều hòa nhiệt độ">
							<label > Điều hòa nhiệt độ</label><br>
						</div>
						<div class="group-form f20">
							<input type="checkbox" name="tiennghi" value="Không gian riêng để làm việc">
							<label > Không gian riêng để làm việc</label><br>
						</div>
				</div>
			</div>
			<div class="modal-footer" style="border-top:none">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-light">Tìm kiếm</button>
			</div>
			</form>
		</div>
	</div>
</div>

<!--==============================footer=================================-->
		<footer>
			<div class="container_12">
				<div class="grid_12">
					<div class="socials">
						<a href="#" class="fa fa-facebook"></a>
						<a href="#" class="fa fa-twitter"></a>
						<a href="#" class="fa fa-google-plus"></a>
					</div>
					<div class="copy">
						Your Trip (c) 2014 | <a href="#">Privacy Policy</a> | Website Template Designed by <a href="http://www.templatemonster.com/" rel="nofollow">TemplateMonster.com</a>
					</div>
				</div>
			</div>
		</footer>
		

		<script>

			document.getElementById("startdate").valueAsDate = new Date();
			document.getElementById("enddate").valueAsDate = new Date();


			function filter() {
				const filter = document.getElementById("filter").value;
				console.log(filter);
				var search = "<c:out value='${search}'/>";
				var category = "<c:out value='${category}'/>";
				window.location="/places/page/1?search="+search+"&filter="+filter+"&category="+category;
			}
		jQuery('.con1 a').click(function(evt) {
			  evt.preventDefault();

			  var placeId = jQuery(this).attr("data-id");
			  var item = 'item-'+placeId;
			  
			  $.ajax({
					type : "GET",
					contentType : "application/json",
					url : "/AddLovePlace",
					data : {
						placeId : placeId,
					},
					timeout : 2000,
					success : function(data) {		
						console.log("SUCCESS: ");
						if(document.getElementById(item).style.color == "red")
							document.getElementById(item).style.color = "white";
						else document.getElementById(item).style.color = "red";
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}
				});
			  
			});
		
			
		</script>
	</body>
</html>