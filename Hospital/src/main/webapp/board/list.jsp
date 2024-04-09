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
	
	<!-- css -->
	<jsp:include page="../layout/link.jsp" />
	<link rel="stylesheet" href="../static/css/board_list.css">
	
	<!-- js -->
	<jsp:include page="../layout/script.jsp" />
</head>

<body>

	<% 
		// 파라미터
		String category = request.getParameter("category");
		String searchNo = request.getParameter("searchNo");
		String loginId = (String)session.getAttribute("loginId");
		
		BoardService boardService = new BoardServiceImpl();
		List<Board> boardList = boardService.list();
		
		// 작성일자 Date포맷 설정
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
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
									<%
									if (category == null) {
									%>
										<option value="전체" selected>전체</option>
										<option value="외과">외과</option>
										<option value="내과">내과</option>
										<option value="산부인과">산부인과</option>
										<option value="피부과">피부과</option>
									<%
									} else {
									%>
										<option value="전체">전체</option>
										<option value="외과" <%= category.equals("외과") ? "selected" : "" %>>외과</option>
										<option value="내과" <%= category.equals("내과") ? "selected" : "" %>>내과</option>
										<option value="산부인과" <%= category.equals("산부인과") ? "selected" : "" %>>산부인과</option>
										<option value="피부과" <%= category.equals("피부과") ? "selected" : "" %>>피부과</option>
									<%} %>
								</select>
							</li>
							<li>
								<input type="text" name="searchNo" placeholder="검색할 글번호를 입력하세요.">
								<button type="submit" class="search">검색</button>
							</li>
						</ul>
						
					</form>
				</div>
				<div class="cont_tb">
					<table>
						<tr>
							<th class="no">NO.</th>
							<th class="tit">제목</th>
							<th class="wri">글쓴이</th>
							<th class="date">작성일</th>
						</tr>
						<%
							if (boardList == null || boardList.size() == 0) {
						%>
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
						<%
							} else { 
								for (Board board : boardList) {
									if (category == null && searchNo == null) {
										// list.jsp에 진입한 경우 (전달받은 파라미터가 없을 경우 ex. url: /list.jsp) %>
										<tr>
											<td><%=board.getNo()%>.</td>
											<td><a href="<%= request.getContextPath()%>/board/read.jsp?no=<%=board.getNo()%>">[<%=board.getCategory() %>]
													<%= board.getTitle() %></a></td>
											<td><%= board.getUser_id() %></td>
											<td><%= simpleDate.format(board.getReg_date()) %></td>
										</tr>
						<%			} else {
										// 카테고리만 검색 or 번호만 검색 or 카테고리+번호검색 (form 전송되면 무조건 카테고리,번호 파라미터가 url로 전달됨)
										if ( ( board.getCategory().equals(category) || category.equals("전체") ) && ( String.valueOf(board.getNo()).equals(searchNo) || searchNo == "")) {
						%>
										<tr>
											<td><%=board.getNo()%>.</td>
											<td><a
												href="<%= request.getContextPath()%>/board/read.jsp?no=<%=board.getNo()%>">[<%=board.getCategory() %>]
													<%= board.getTitle() %></a></td>
											<td><%= board.getUser_id() %></td>
											<td><%= simpleDate.format(board.getReg_date()) %></td>
										</tr>
						<% 				}
									}
								} 
							}
						%>
					</table>
					<a id="write"><button>작성하기</button></a> 
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />
	
	<jsp:include page="/layout/script.jsp" />
	<script>
		var loginId = "<%=loginId%>";
		// 카테고리 셀렉트박스 선택시 발동되는 함수
		$(function() {
			
			// 이벤트
			$('#list').on('change', function() {
				$('#form').submit()
			})
		})
		
		// 로그인된 상태인지 체크
		$('#write').on('click', function() {
	        var contextPath = "<%= request.getContextPath() %>";
	        
			if (loginId === "null") {
				alert('로그인이 필요한 페이지 입니다.')
		        window.location.href = contextPath + "/login_sub.jsp";
			} else {
				window.location.href = contextPath + "/board/insert.jsp";
			}
		})
	</script>
</body>

</html>