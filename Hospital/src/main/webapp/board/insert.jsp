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
<title>게시판 등록</title>
	<jsp:include page="../layout/link.jsp" />
	<link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/insert.css">
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />

	<div class="container">
		<h1>
			<img src="../static/img/board.png" alt="">커뮤니티 게시판
		</h1>
		<p>자신만의 건강 고민과 팁을 사람들과 공유해 보세요!</p>
		
		<!-- 게시글 등록 실패 시 안내멘트 -->
		<c:if test="${param.msg == 0}">
			<br>
			<p style="color: red;">게시글 등록에 실패하였습니다!</p>
		</c:if>
		
		<div class="table-wrapper">
			<form action="<%=request.getContextPath()%>/board/insert_pro.jsp" method="post">
				<table border="1">
					<thead>
						<tr>
							<th>
								<!-- 드롭다운 메뉴 --> <select name="category">
									<option value="none">선택</option>
									<option value="외과">외과</option>
									<option value="내과">내과</option>
									<option value="산부인과">산부인과</option>
									<option value="피부과">피부과</option>
							</select>
							</th>
							<th><input type="text" name="title" placeholder="제목 입력"></th>
							<th><input type="text" name="userId" value="${sessionScope.loginId}" readonly/></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3"><textarea name="content" placeholder="내용 입력"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div id="insert">
					<button>버튼</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />

</body>

</html>