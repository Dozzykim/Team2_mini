<%@page import="hospital.Service.UserServiceImpl"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.DTO.Users"%>
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
<title>비밀번호 찾기</title>
    <jsp:include page="/layout/link.jsp" />
    <link href="<%= request.getContextPath() %>/static/css/find_pw.css" rel="stylesheet"/>

    <!-- jQuery CDN 방식으로 포함하기 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- slick js FILE -->
    <script src="js/slick.min.js"></script>
    <!-- script -->
    <script src="js/script.js"></script>
</head>
<body>
    <!-- 헤더 -->
    <jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="container">
        <div class="inner">
            <div class="find_pw">
                <h1>비밀번호 찾기</h1>
                <p>아이디와 이름과 연락처를 입력하세요!</p>
                <c:if test="${param.msg == 0}">
                    <p style="color: red;">비밀번호 찾기에 실패하였습니다.</p>
                </c:if>
                <form action="find_pw_pro.jsp" method="post" onsubmit="return validateForm()">
                <ul>
                    <li>
                        <input type="text" name="user_id" id="user_id" placeholder="아이디">
                    </li>
                    <li>
                        <input type="text" name="user_name" id="user_name" placeholder="이름">
                    </li>
                    <li><input type="text"  name="user_pno" id="user_pno" placeholder="연락처"></li>
                     <li><a href="<%=request.getContextPath() %>/user/find_pw_pro.jsp" class="find_pw_btn"><button type="submit" >확인</button></a></li>
                </ul>
                    </form>
            </div>
        </div>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>