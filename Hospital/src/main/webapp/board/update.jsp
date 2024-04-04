<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@page import="hospital.DTO.Board"%>
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
<title>게시글 수정 페이지</title>
</head>
<body>
	<%
		BoardService boardService = new BoardServiceImpl();
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = boardService.select(no);
	%>
	
	<!-- 헤더 -->
	<h1>가져온 카테고리 : <%= board.getCategory() %></h1>
	<a href="<%= request.getContextPath()%>/board/list.jsp">커뮤니티 게시판</a>
	<a href="<%= request.getContextPath()%>/reservation/reserv.jsp">병원예약</a>
	
	<!-- 컨텐츠 -->
		<form action="<%= request.getContextPath()%>/board/update_pro.jsp" id='form' method="post">
			<input type="hidden" id='no' name="no" value="<%= board.getNo() %>"/>
			<select name ="category" >
		        <option value="none" <%= board.getCategory() == null ? "selected='selected'" : "" %>>선택</option>
		        <option value="1" <%= board.getCategory().equals("외과") ? "selected" : "" %>>외과</option>
		        <option value="2"  <%= board.getCategory().equals("피부과") ? "selected" : "" %>>피부과</option>
		        <option value="3" <%= board.getCategory().equals("소아과") ? "selected" : "" %>>소아과</option>
	    	</select>
			<table border="1">
				<tr>
					<th>제목</th>
					<td> <input type="text" name="title" value="<%=board.getTitle()%>"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td> <input type="text" name="userId" value="<%=board.getUser_id()%>"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="5" cols="40" name="content"><%=board.getContent()%></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="수정" /> 
		<button type="button" onclick="backToBoard()">뒤로가기</button> 
		</form>
	
	
	<!-- 푸터 -->
	
	
	<!-- 스크립트 -->
	<script>
		<%
		String root = request.getContextPath();
		%>
		
		// 수정
	    function doubleCheck() {
            window.location.href= "<%= root%>/board/update_pro.jsp?no=<%= board.getNo()%>";
	    }
		
		// 해당글 페이지 조회페이지로 다시 이동
		function backToBoard() {
			window.location.href= "<%=root%>/board/read.jsp?no=<%= board.getNo()%>";
		}
	</script>
</body>
</html>