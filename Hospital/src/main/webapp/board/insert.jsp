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
<title>게시글 등록</title>
</head>
<body>
	<!-- 헤더 -->
	
	
	<!-- 컨텐츠 -->
	<!-- 세션 따라오는지 체크  -->
	<h3>${sessionScope.loginId} 님 환영합니다!</h3>
	
	<form action="<%= request.getContextPath() %>/board/insert_pro.jsp" method="post">
		<select name ="category">
	        <option value="none">선택</option>
	        <option value="1">외과</option>
	        <option value="2">피부과</option>
	        <option value="3">소아과</option>
    	</select>
		<table border="1">
			<tr>
				<th>제목</th>
				<td> <input type="text" name="title" value=""/> </td>
			</tr>
			<tr>
				<th>작성자</th>
				<td> <input type="text" name="userId" value="${sessionScope.loginId}"/> </td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="40" name="content"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="등록"/>
	</form>
	
	
	<!-- 푸터 -->
	
	
	<!-- 스크립트 -->
</body>
</html>