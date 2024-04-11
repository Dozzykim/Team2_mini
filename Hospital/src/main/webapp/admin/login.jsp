<%@page import="java.net.URLDecoder"%>
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
	<title>로그인 화면</title>

	<jsp:include page="/layout/link_admin.jsp" />
	<link href="<%= request.getContextPath() %>/static/admin_css/admin_login_main.css" rel="stylesheet"/>
		
</head>
<body>
	<%
	String loginId = (String) session.getAttribute("loginId");
	%>
	<!-- 헤더 -->
	<jsp:include page="../layout/header_adm.jsp" />
	
	<form action="login_pro.jsp" method="post">
	<div class="container">
        <div class="inner">
            <div class="main">
                <h1>로그인</h1>
                <ul>
                    <li><input type="text" name="id" value="" placeholder="아이디 입력"></li>
                    <li><input type="password"  name="pw" value="" placeholder="비밀번호 입력"></li>
	                    <c:if test="${ param.msg==0 }">
							<p style="color:red">
								아이디 또는 비밀번호가 일치하지 않습니다.		
							</p>
						</c:if>
                    
                    <li><button type="submit">로그인</button></li>
                    
                </ul>
     		</div>
     	</div>
     </div>
            </form>
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<script>
		/* 관리자 비로그인 상태 시, 헤더 요소 접근 막음 */
		$('#moveToBoard').on('click', function() {
			if (condition) {
				
			}
		})
	</script>
</body>
</html>