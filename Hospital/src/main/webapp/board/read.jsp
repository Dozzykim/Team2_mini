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
<title>게시글 상세조회</title>
</head>
<body>
	<%
		BoardService boardService = new BoardServiceImpl();
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = boardService.select(no);
	%>
	
	<h1>게시글 조회</h1>
	<%
		if(board != null && board.getNo()> 0) { 
	%>
	
	<table border="1">
		<tr>
			<th>제목</th>
			<td><%= board.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= board.getUser_id()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=board.getContent() %></td>
		</tr>
	</table>
	<% } else { %>
		<h3>조회된 게시글이 없습니다.</h3>
	<% } %>
	<div>
		<a href="<%= request.getContextPath() %>/board/list.jsp">목록</a>
		<a href="<%= request.getContextPath() %>/board/update.jsp?no=<%= board.getNo()%>">수정</a>
		<a href="<%= request.getContextPath() %>/board/delete.jsp?no=<%= board.getNo()%>">삭제</a>
	</div>
	
	
	<!-- 목록(게시글 목록으로 가기),삭제, 수정 버튼이 있어야함 -->
</body>
</html>