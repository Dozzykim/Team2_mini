<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hospital.DTO.Board"%>
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
<title>게시판 조회</title>

<!-- css -->
<jsp:include page="../layout/link.jsp" />
<link rel="stylesheet" href="../static/css/read.css">

<jsp:include page="../layout/script.jsp" />
</head>

<body>

	<%
	BoardService boardService = new BoardServiceImpl();
	int no = Integer.parseInt(request.getParameter("no"));
	Board board = boardService.select(no);
	String writer = board.getUser_id();
	String loginId = (String) session.getAttribute("loginId");

	// 등록일자/수정일자를 yyyy-mm-dd형식으로 출력도와주는 클래스 생성
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />

	<div class="container">
		<h1>
			<img src="../static/img/board.png" alt="">커뮤니티 게시판
		</h1>
		<p>자신만의 건강 고민과 팁을 사람들과 공유해 보세요!</p>
		<div class="table-wrapper">

			<table border="1">
				<thead>
					<tr>
						<th><%=board.getNo()%>.</th>
						<th>[<%=board.getCategory()%>] <%=board.getTitle()%></th>
						<th><%=board.getUser_id()%></th>
						<th><%=simpleDate.format(board.getReg_date())%></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4"><textarea id="content" readonly><%=board.getContent()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="insert">
				<div class="left_area">
					<c:if test="<%=writer.equals(loginId)%>">
						<button onclick="moveToUpdate()">수정</button>
						<button onclick="doubleCheck()">삭제</button>
					</c:if>
					<button onclick="moveToList()">목록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 댓글 -->
	<div class="cont_tb2">
		<ul>
			<li class="head">
				<p>댓글</p> <input type="text" id="commentInput"
				placeholder="부적절한 댓글은 관리자에 의해 무통보 삭제 될 수 있습니다.">
				<button id="search" onclick="submitComment()">작성</button>
			</li>
		</ul>
		<table border="1" id="commt_area">
			<div class="comment">
				<tr>
					<th class="cmmtId">아이디</th>
					<th class="cmmtContent">작성 댓글</th>
				</tr>
				<tr>
					<td>joeun</td>
					<td>아니 여기 의사들 다 이상하지 않아요?</td>
					<td><a href="#none"><button>삭제</button></a></td>
				</tr>
			</div>
		</table>

	</div>

	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />

	<!-- 스크립트 -->
	<script>
		<%String root = request.getContextPath();%>
		
		// 선택받기
	    function doubleCheck() {
	        var choice = confirm("정말로 삭제하시겠습니까?");
	        
	        if (choice == true) {
	            window.location.href= "<%=root%>/board/delete.jsp?no=<%=board.getNo()%>";
	        }
	    }
		
		// 수정페이지로 이동
		function moveToUpdate() {
			window.location.href= "<%=root%>/board/update.jsp?no=<%=board.getNo()%>";
		}
		// 리스트로 이동
		function moveToList() {
			window.location.href= "<%=root%>/board/list.jsp";
		}

		function submitComment() {

		}
	</script>

</body>

</html>