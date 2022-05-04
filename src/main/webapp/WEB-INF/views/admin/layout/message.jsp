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
		
	if (!"".equals(request.getParameter("msg"))) {
			String msg = request.getParameter("msg");
			if ("deleteOK".equals(msg)) { %>
			
		<div class="alert alert-success" role="alert"><%=deleteOK %></div>
		<%}%>
		
		<% if ("deleteERROR".equals(msg)) { %>
		<div class="alert alert-info" role="alert"><%=deleteERROR %></div>
		<%}%>
		
		<% if ("editOK".equals(msg)) { %>
		<div class="alert alert-success" role="alert"><%=editOK %></div>
		<%}%>
		
		<% if ("editERROR".equals(msg)) { %>
		<div class="alert alert-info" role="alert"><%=editERROR %></div>
		<%}%>
		
		<% if ("addOK".equals(msg)) { %>
		<div class="alert alert-success" role="alert"><%=addOK %></div>
		<%}%>
		
		<% if ("addERROR".equals(msg)) { %>
		<div class="alert alert-info" role="alert"><%=addERROR %></div>
		<%}%>
		
		<% if ("addexists".equals(msg)) { %>
		<div class="alert alert-info" role="alert"><%=addexists %></div>
		<%}%>
		
	<%}%>