<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 선택</title>
    <jsp:include page="/layout/link.jsp" />
    <link href="<%= request.getContextPath() %>/static/css/login_sub.css" rel="stylesheet"/>
</head>
<body>
	<!-- 컨테이너 영역 -->
	
	<jsp:include page="/layout/header.jsp" />
	<div class="container">
	    <div class="inner">
	        <ul>
	            <li><a href="<%= request.getContextPath() %>/user/login.jsp"><span class="user">회원용<br>로그인</span></a></li>
	            <li><a href="<%= request.getContextPath() %>/admin/login.jsp"><span class="admin">관리자용<br>로그인</span></a></li>
	            
	        </ul>
	    </div>
	</div>
	
	
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<jsp:include page="/layout/script.jsp"></jsp:include>
</body>

</html>
