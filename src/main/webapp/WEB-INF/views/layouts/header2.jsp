<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<header id="header"><!--header-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container" style="width: 1300px !important;">
				<div class="row">
					<div class="col-sm-3">
						<div class="logo pull-left">
							<div style="margin-top: 30px">
								<a href="<c:url value="/index" />"><b class="head3" style="color: #ef4365; ">
									<i class="fas fa-cannabis" style="margin-right: 10px;margin-top: -5px"></i>AirTrip</b>
								</a>
							</div>
						</div>
						
					</div >
					<div class="col-sm-6 pull-left">
						<form action="/places/page/1" method="post" width="100%">
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
					<%@ include file="/WEB-INF/views/layouts/menu.jsp" %>
				</div>
			</div>
		</div><!--/header-middle-->

		<div class="container_12">
			<div class="grid_12">
				<h1>
					<a href="/places">
						<img src="/asset/images/logo.png" alt="Your Happy Family">
					</a>
				</h1>
			</div>
		</div>
	</header><!--/header-->
	
	