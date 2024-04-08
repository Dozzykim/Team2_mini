<%@page import="java.text.SimpleDateFormat"%>
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
	<jsp:include page="../layout/link.jsp" />
	<link rel="stylesheet" href="../static/css/select.css">
</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<%
		BoardService boardService = new BoardServiceImpl();
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = boardService.select(no);
		String writer = board.getUser_id();
		String loginId = (String)session.getAttribute("loginId");
		
		// 등록일자/수정일자를 yyyy-mm-dd형식으로 출력도와주는 클래스 생성
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	%>
	
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />
	
	
	<!-- 컨텐츠 -->
	<h1>게시글 조회</h1>
	<%
		if(board != null && board.getNo()> 0) { 
	%>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<td><%= board.getNo() %>.</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>[<%= board.getCategory()%>] <%= board.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= board.getUser_id()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= simpleDate.format(board.getReg_date()) %></td>
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
			<button onclick="moveToList()">목록</button>
		<c:if test="<%= writer.equals(loginId)%>">
			<button onclick="moveToUpdate()">수정</button>
			<button onclick="doubleCheck()">삭제</button>
		</c:if>
	</div>
	
	<form action="<%= request.getContextPath() %>/board/cmnt_pro.jsp" method="post">
		<input type="hidden" name="boardNo" value="${board.getNo()}"/>
		<input type="hidden" name="userId" value="${sessionScope.loginId}"/>
		<p>댓글 <textarea rows="1" cols="50" name="cmmt"></textarea> <input type="submit" value="등록"/></p>
	</form>	

	
	
	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- 스크립트 -->
	<script>
		<%
		String root = request.getContextPath();
		%>
		
		// 선택받기
	    function doubleCheck() {
	        var choice = confirm("정말로 삭제하시겠습니까?");
	        
	        if (choice == true) {
	            window.location.href= "<%=root%>/board/delete.jsp?no=<%= board.getNo()%>";
	        }
	    }
		
		// 수정페이지로 이동
		function moveToUpdate() {
			window.location.href= "<%=root%>/board/update.jsp?no=<%= board.getNo()%>";
		}
		// 리스트로 이동
		function moveToList() {
			window.location.href= "<%=root%>/board/list.jsp";
		}
	</script>
	
	
</body>
</html>