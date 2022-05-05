<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="grid_12">
    <div class="menu_block">
        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
            <ul class="sf-menu">
                <li><a href="<c:url value="/index" />">TRANG CHỦ</a></li>
                <li class="current"><a href="<c:url value="/places" />">KHÁM PHÁ</a></li>
                <li><a href="<c:url value="/bookroom" />">CHUYẾN ĐI</a></li>
                <li><a href="<c:url value="/blog" />">BLOG</a></li>
                <li><a href="<c:url value="/index" />">LIÊN HỆ</a></li>
            </ul>
        </nav>
        <div class="clear"></div>
    </div>
</div>