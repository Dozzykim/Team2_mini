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
						<li><a href="<%= request.getContextPath() %>/login_sub.jsp">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/user/join.jsp">회원가입</a></li>
					</c:if>
					
					<!-- 로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId != null }">
						<li><a href="<%=request.getContextPath()%>/user/logout.jsp">로그아웃</a></li>
						<li><a href="<%=request.getContextPath()%>/user/mypage.jsp">마이페이지</a></li>
					</c:if>
				</ul>
				<h1 class="main_logo">
					<a href="<%= request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/static/img/logo_HP.png" alt=""></a>
				</h1>
				<h1 class="main_name">더조은 종합병원</h1>
			</div>
			<div class="header_bottom">
				<ul>
					<li><a href="<%=request.getContextPath()%>/board/list.jsp">소통 해요</a></li>
					<li><a href="<%=request.getContextPath()%>/reservation/reserv.jsp">진료 예약</a></li>
					<li><a href="<%=request.getContextPath()%>/HPinfo.jsp">병원 소개</a></li>
				</ul>
			</div>
		</div>
	</header>
