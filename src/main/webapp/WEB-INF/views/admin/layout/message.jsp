<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	String deleteOK="Thực hiện xóa thành công !";
	String deleteERROR = "Không thể xóa mục này. Vui lòng kiểm tra lại !";
	String editOK = "Chỉnh sửa thành công !";
	String editERROR = "Chỉnh sửa thất bại. Vui lòng thực hiện lại !";
	String addOK = "Thêm thành công !";
	String addERROR = "Thêm thất bại. Vui lòng thực hiện lại !";
	String addexists = "Tên đăng nhập đã tồn tại !";
	%>

			<c:if test="${msg.equals(\"deleteOK\")}">
				<div class="alert alert-success" role="alert">Thực hiện xóa thành công !</div>
			</c:if>
<c:if test="${msg.equals(\"deleteERROR\")}">
	<div class="alert alert-warning" role="alert">Không thể xóa mục này. Vui lòng kiểm tra lại !</div>
</c:if>
<c:if test="${msg.equals(\"editOK\")}">
	<div class="alert alert-success" role="alert">Thực hiện chỉnh sửa thành công !</div>
</c:if>
<c:if test="${msg.equals(\"editERROR\")}">
	<div class="alert alert-warning" role="alert">Chỉnh sửa thất bại. Vui lòng thực hiện lại !</div>
</c:if>
<c:if test="${msg.equals(\"addOK\")}">
	<div class="alert alert-success" role="alert">Thực hiện thêm thành công !</div>
</c:if>
<c:if test="${msg.equals(\"addERROR\")}">
	<div class="alert alert-warning" role="alert">Thêm thất bại. Vui lòng thực hiện lại !</div>
</c:if>
<c:if test="${msg.equals(\"addexists\")}">
	<div class="alert alert-danger" role="alert">Tên đăng nhập đã tồn tại !</div>
</c:if>
<c:if test="${msg.equals(\"addemailexists\")}">
	<div class="alert alert-warning" role="alert">Email đã được đăng ký cho tài khoản khác !</div>
</c:if>
<c:if test="${msg.equals(\"editemailexists\")}">
	<div class="alert alert-warning" role="alert">Email đã được đăng ký cho tài khoản khác !</div>
</c:if>
<c:if test="${msg.equals(\"addcategoryexists\")}">
	<div class="alert alert-warning" role="alert">Mã mục thuê đã tồn tại !</div>
</c:if>
<c:if test="${msg.equals(\"addlitleexists\")}">
	<div class="alert alert-warning" role="alert">Mã loại nhà đã tồn tại !</div>
</c:if>
<c:if test="${msg.equals(\"editidexists\")}">
	<div class="alert alert-warning" role="alert">Mã loại nhà đã tồn tại !</div>
</c:if>




