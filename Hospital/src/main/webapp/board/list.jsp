<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hospital.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<jsp:include page="../layout/link.jsp" />
<link rel="stylesheet" href="../static/css/board_list.css">
</head>

<body>

	<%
		
		String reqSearchNo = request.getParameter("searchNo");
		String category = request.getParameter("category");
		int searchNo = reqSearchNo == null || reqSearchNo.equals("") ? 0 : Integer.parseInt(reqSearchNo);
		reqSearchNo = reqSearchNo == null ? "" : reqSearchNo;
		
		BoardService boardService = new BoardServiceImpl();
		List<Board> boardList = new ArrayList<Board>();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		
		// reqSearchNo 있으면 번호로 조회
		if( reqSearchNo != null && !reqSearchNo.equals("") ) {
			Board board = boardService.select(searchNo);
			boardList.add(board);
		}
		
		// reqSearchNo 없고 category 있으면 카테고리로 조회
		else if( category != null && !category.equals("") ) {
			boardList = boardService.listByCategory(category);
		}
		
		// 전체조회
		else {
			boardList = boardService.list();
		}
	
	%>
	
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />

	<div class="container">
		<div class="inner">
			<div class="cont_full">
				<div class="cont_top">
					<h1>
						<img src="../static/img/board.png" alt="">커뮤니티 게시판
					</h1>
					<p>자신만의 건강 고민과 팁을 사람들과 공유해 보세요!</p>
					<p>
						<strong>부적절한 게시글</strong>은 관리자에 의해 무통보 삭제처리 될 수 있습니다.
					</p>
				</div>
				<div class="util_area">
					<form action="<%=request.getContextPath()%>/board/list.jsp" method="get" id="form">
						<ul>
							<li>
								<select name="category" id="list">
									<option value="">전체</option>
									<option value="외과" <%= category.equals("외과") ? "selected" : "" %>>외과</option>
									<option value="내과" <%= category.equals("내과") ? "selected" : "" %>>내과</option>
									<option value="산부인과" <%= category.equals("산부인과") ? "selected" : "" %>>산부인과</option>
									<option value="피부과" <%= category.equals("피부과") ? "selected" : "" %>>피부과</option>
								</select>
							</li>
							<li>
								<input type="text" name="searchNo" placeholder="검색할 글번호를 입력하세요."
									  value="<%= reqSearchNo %>">
								<button type="submit">검색</button>
							</li>
						</ul>
					</form>
				</div>
				<div class="cont_tb">
					<table>
						<tr>
							<th class="no">NO.</th>
							<th class="tit">제목</th>
							<th calss="wri">글쓴이</th>
							<th class="date">작성일</th>
						</tr>
						<%-- 코드 보류 --%>
						<%
							if (boardList == null || boardList.size() == 0) {
						%>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
						<%
							} else { 
								for (Board board : boardList) {
						%>
								<tr>
									<td><%=board.getNo()%>.</td>
									<td><a
										href="<%= request.getContextPath()%>/board/read.jsp?no=<%=board.getNo()%>">[<%=board.getCategory() %>]
											<%= board.getTitle() %></a></td>
									<td><%= board.getUser_id() %></td>
									<td><%= simpleDate.format(board.getReg_date()) %></td>
								</tr>
						<%
								} 
							}
						%>
					</table>
					<a href="<%=request.getContextPath()%>/board/insert.jsp" id="write"><button>작성하기</button></a> 
				</div>
			</div>
		</div>
	</div>

	<footer class="footer">
		<div class="inner3">
			<div class="info">
				<ul>
					<li></li>
					<li>영업 시간: 9:00 ~ 18: 00</li>
					<li>찾아오시는 길 : 인천광역시 부평구 부평1동 534-48</li>
					<li>전화번호 : 032 - 123 - 5678</li>

				</ul>
			</div>
			<div class="joeun">
				<p>THE JOEUN HOSPITAL</p>
			</div>
			<div class="copy_r">
				<p>Copyright ⓒ The Joeun Hospital. All Rights Rerved</p>
			</div>
		</div>
	</footer>
	
	<jsp:include page="/layout/script.jsp" />
	<script>
		
		$(function() {
			
			// 이벤트
			$('#list').on('change', function() {
				$('#form').submit()
			})
			
		})
	
	</script>
</body>

</html>