<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<header class="header" id="header">
		<div class="inner">
			<div class="header_top">
				<ul class="util">
				
					<!-- 비로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId == null }">
						<li><a href="<%= request.getContextPath() %>/admin/login.jsp">로그인</a></li>
						
					</c:if>
					
					<!-- 로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId != null }">
						<li><a href="<%=request.getContextPath()%>/admin/logout.jsp">로그아웃</a></li>
						
					</c:if>
				</ul>
				<h1 class="main_name">
					<a href="<%= request.getContextPath()%>/admin/index_admin.jsp">더조은 종합병원</a>
				</h1>
			</div>
			<div class="header_bottom">
				<ul>
					<!-- 비로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId == null }">
						<li><a>소통 해요</a></li>
						<li><a>예약 현황</a></li>
					</c:if>
					
					<!-- 로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId != null }">
						<li><a href="<%=request.getContextPath()%>/admin/boardList.jsp">소통 해요</a></li>
						<li><a href="<%=request.getContextPath()%>/admin/reservation.jsp">예약 현황</a></li>
					</c:if>
					
				</ul>
			</div>
		</div>
	</header>
