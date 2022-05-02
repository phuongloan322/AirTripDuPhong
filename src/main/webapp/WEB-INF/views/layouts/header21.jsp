<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="slidego">
			<div class="i-head">
				<div class="row">
					<div class="col-sm-3">
						<div class="logo pull-left">
							<a href="<c:url value="/index" />"><b class="head3">AirPay</b></a>
						</div>
						
					</div >
					<div class="col-sm-5 pull-left">
						<form action="<c:url value="/places" />" method="post" width="100%">
							<div id="custom-search-input">
                            <div class="input-group">
                                <input type="text" name="search" class="search-query form-control" placeholder="Tìm kiếm sản phẩm mong muốn..." />
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
								<li><a href="<c:url value="/become-a-host" />" class="i-chu">Trở thành chủ nhà</a></li>
									<c:if test="${accLogin != null }">
										<li class="dropdown"><a href="#" class="i-chu"><i class="fa fa-user"></i>${accLogin.name }<i class="fa fa-angle-down"></i></a>
	                                    	<ul role="menu" class="sub-menu">
	                                    		<li><a>Thông tin cá nhân</a></li>
	                                    		<li><a href="<c:url value="/loveplace" />">Danh sách Yêu thích</a></li>
	                                    		<li><a href="<c:url value="/bookroom" />">Nhà / phòng đã đặt</a></li>
		                                        <li><a href="<c:url value="/logout" />">Đăng xuất</a></li>
		                                    </ul>
		                                </li>
	                                </c:if> 
									<c:if test="${accLogin == null }">
										<li><a href="<c:url value="/login" />" class="i-chu"><i class="fa fa-lock"></i> Đăng nhập</a></li>
									</c:if> 	
							</ul>
						</div>
					</div>
				</div>
			</div>
</header>