
<%@page import="java.util.List"%>
<%@page import="hospital.DTO.Board"%>
<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
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
<title>게시글 목록</title>
</head>
<body>
	<%
		BoardService boardService = new BoardServiceImpl();
		List<Board> boardList = boardService.list();
		session.setAttribute("loginId", "joeun");
	%>
	
	<!-- 헤더 -->
	
	
	<!-- 컨텐츠 -->
	
	<!-- 세션 따라오는지 체크  -->
	<h3>${sessionScope.loginId} 님 환영합니다!</h3>
	<h1>게시글 목록</h1>
	<a href="<%= request.getContextPath() %>/board/list_pro.jsp">글쓰기</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일자</th>
			<th>수정일자</th>
		</tr>
		<% if (boardList == null || boardList.size() == 0) { %>
		<tr>
			<td colspan="5">조회된 게시글이 없습니다.</td>
		</tr>
		<% } else {
				for(Board board : boardList) {
		%>
					<tr>
						<td><%= board.getNo() %></td>
						<td>
							<a href="<%= request.getContextPath()%>/board/read.jsp?no=<%=board.getNo()%>"><%= board.getTitle() %></a>
						</td>
						<td><%= board.getUser_id() %></td>
						<td><%= board.getReg_date() %></td>
						<td><%= board.getUpd_date() %></td>
					</tr>
		<%
				}
			} %>
	</table>
	
	
	
	<!-- 푸터 -->
	
	
	<!-- 스크립트 -->
	
</body>
</html>