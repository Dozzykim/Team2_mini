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
	<title>게시글 수정</title>
	<jsp:include page="../layout/link.jsp" />
	<link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/insert.css">
</head>
<body>
	<%
		BoardService boardService = new BoardServiceImpl();
		int no = Integer.parseInt(request.getParameter("no"));
		Board board = boardService.select(no);
	%>

	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp"/>
	
	<div class="container">
		<h1>
			<img src="../static/img/board.png" alt="">커뮤니티 게시판
		</h1>
		<p>자신만의 건강 고민과 팁을 사람들과 공유해 보세요!</p>
		
		<!-- 게시글 등록 실패 시 안내멘트 -->
		<c:if test="${param.msg == 0}">
			<br>
			<p style="color: red;">게시글 수정에 실패하였습니다!</p>
		</c:if>
		
		<div class="table-wrapper">
			<form action="<%=request.getContextPath()%>/board/update_pro.jsp" method="post">
				<input type="hidden" id='no' name="no" value="<%= board.getNo() %>"/>
				<table border="1">
					<thead>
						<tr>
							<th>
								<!-- 드롭다운 메뉴 --> <select name="category">
									<option value="외과" <%= board.getCategory().equals("외과") ? "selected" : "" %>>외과</option>
									<option value="내과" <%= board.getCategory().equals("내과") ? "selected" : "" %>>내과</option>
									<option value="산부인과" <%= board.getCategory().equals("산부인과") ? "selected" : "" %>>산부인과</option>
									<option value="피부과" <%= board.getCategory().equals("피부과") ? "selected" : "" %>>피부과</option>
							</select>
							</th>
							<th><input type="text" name="title" value="<%=board.getTitle()%>"></th>
							<th><input type="text" name="userId" value="${sessionScope.loginId}" readonly/></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3"><textarea name="content"><%=board.getContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<div id="insert">
					<button>수정</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>