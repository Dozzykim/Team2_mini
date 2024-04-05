<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<header class="header" id="header">
		<div class="inner">
			<div class="header_top">
				<ul class="util">
				
					<!-- 비로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId == null }">
						<li><a href="<%= request.getContextPath() %>/user/login.jsp">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/user/join.jsp">회원가입</a></li>
					</c:if>
					
					<!-- 로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId != null }">
						<li><a href="<%=request.getContextPath()%>/user/logout.jsp">로그아웃</a></li>
						<li><a href="<%=request.getContextPath()%>/user/mypage.jsp">마이페이지</a></li>
					</c:if>
				</ul>
				<h1 class="main_name">
					<a href="<%= request.getContextPath()%>/index.jsp">더조은 종합병원</a>
				</h1>
			</div>
			<div class="header_bottom">
				<ul>
					<li><a href="<%=request.getContextPath()%>/board/list.jsp">소통해요</a></li>
					<li><a
						href="<%=request.getContextPath()%>/reservation/reserv.jsp">진료예약</a></li>
					<li><a href="#none">병원 소개</a></li>
				</ul>
			</div>
		</div>
	</header>
