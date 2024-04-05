<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인화면</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/layout/header.jsp" />
	
	<h1>병원안내, 이용안내, 게시판, 진료예약</h1>
	<c:if test="${sessionScope.loginId != null }">
			<h5>${sessionScope.loginId }님 환영합니다.</h5>
			<a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
			<ul>
				<li>
					<a href="<%= request.getContextPath() %>/admin/boardList.jsp">게시판으로 이동</a>
					<a href="<%= request.getContextPath() %>/admin/reservation.jsp">예약현황 이동</a>
				</li>
			</ul>
		</c:if>
		
		<!-- 비로그인 시 -->
		<c:if test="${sessionScope.loginId == null }">
			
			
			<a href="<%= request.getContextPath() %>/admin/login.jsp">로그인</a>
		</c:if>
		
	<jsp:include page="/layout/script.jsp" />
	
</body>
</html>