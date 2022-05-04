<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
		if (!"".equals(request.getParameter("msg"))) {
			String msg = request.getParameter("msg");
			if ("OK".equals(msg)) {
	%>
	<div class="alert alert-success" role="alert">Xử lý thành công..!
	</div>
	<%
		}
		}
	%>
	<%
		if (!"".equals(request.getParameter("msg"))) {
			String msg = request.getParameter("msg");
			if ("ERROR".equals(msg)) {
	%>
	<div class="alert alert-info" role="alert">Xử lý thất bại..!</div>
	<%
		}
		}
	%>