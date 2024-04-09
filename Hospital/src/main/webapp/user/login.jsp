<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<jsp:include page="/layout/link.jsp" />
<link href="<%=request.getContextPath()%>/static/css/login_main.css"
	rel="stylesheet" />
</head>
<body>

	<%
	// 아이디 저장
	String rememberId = "";
	String userId = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			String cookieName = cookie.getName();
			String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
			switch (cookieName) {
			case "userId":
		userId = cookieValue;
		break;
			case "rememberId":
		rememberId = cookieValue;
		break;
			}
		}
	}
	%>

	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<form action="login_pro.jsp" method="post">
		<div class="container">
			<div class="inner">
				<div class="main">
					<h1>로그인</h1>
					<ul>
						<li><input type="text" name="id" value="<%=userId%>"
							placeholder="아이디 입력"></li>
						<li><input type="password" name="pw" value=""
							placeholder="비밀번호 입력"></li>
						<c:if test="${ param.msg==0 }">
							<p style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</p>
						</c:if>
						<li>
							<div class="checkbox-container">
								<%
								// 첫 번째 로그인 폼의 아이디 저장 체크박스
								if (rememberId != null && rememberId.equals("on")) {
								%>
								<input type="checkbox" name="rememberId" id="remember-id"
									checked />
								<%
								} else {
								%>
								<input type="checkbox" name="rememberId" id="remember-id" />
								<%
								}
								%>
								<label for="remember-id">아이디 저장&emsp;&emsp;</label> <input
									type="checkbox" name="rememberMe" id="auto-login"> <label
									for="auto-login">자동 로그인</label>
							</div>
						</li>
						<li><button type="submit">로그인</button></li>
						<li><p>계정이 없으십니까?</p> <a
							href="<%=request.getContextPath()%>/user/join.jsp">회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</form>


	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>