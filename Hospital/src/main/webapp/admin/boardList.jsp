
<%@page import="java.text.SimpleDateFormat"%>
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
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	%>
	
	<!-- 헤더 -->
	
	
	
	
	<!-- 컨텐츠 -->
	<!-- 세션 따라오는지 체크  -->
	<h3>${sessionScope.loginId} 님 환영합니다!</h3>
	<h1>게시글 목록</h1>
	
    <select>
        <option value="total">전체</option>
        <option value="1">외과</option>
        <option value="2">피부과</option>
        <option value="3">소아과</option>
    </select>
	
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일자</th>
		</tr>
		<% if (boardList == null || boardList.size() == 0) { %>
		<tr>
			<td colspan="5">조회된 게시글이 없습니다.</td>
		</tr>
		<% } else {
				for(Board board : boardList) {
		%>
					<tr>
						<td><%= board.getNo() %>.</td>
						<td>
							<a href="<%= request.getContextPath()%>/admin/read.jsp?no=<%=board.getNo()%>">[<%= board.getCategory()%>] <%= board.getTitle() %></a>
						</td>
						<td><%= board.getUser_id() %></td>
						<td><%= simpleDate.format(board.getReg_date()) %></td>
					</tr>
		<%
				}
			} %>
	</table>
	<button onclick="moveToInsert()">작성하기</button>
	<button onclick="moveToMain()">홈으로</button>
	
	
	<!-- 푸터 -->
	
	
	<!-- 스크립트 -->
	<script>
		<%
		String root = request.getContextPath();
		%>
		// 게시글 작성 화면으로 이동
	    function moveToInsert() {
	            window.location.href="<%=root%>/admin/insert.jsp";
		}
		
		// 메인화면(index.jsp)으로 이동
	    function moveToMain() {
	    	window.location.href="<%=root%>/admin/list.jsp";
		}
	</script>
</body>
</html>