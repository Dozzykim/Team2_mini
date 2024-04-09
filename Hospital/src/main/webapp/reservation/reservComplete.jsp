<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>예약 확인</title>
	
	<!-- css -->
	<jsp:include page="../layout/link.jsp" />
	<link rel="stylesheet" href="../static/css/complete_res.css">
	
	<!-- js -->
	<jsp:include page="../layout/script.jsp" />
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />

	<div class="container">
		<div class="inner">
			<div class="board_area">
				<h1>
					<img src="../static/img/reservation.png" alt="">예약
				</h1>
				<p>원하는 진료 과와 날짜 및 시간을 선택하여 빠르게 예약해 보세요!</p>
				<div class="main_area">
					<span>예약이 완료 되었습니다!<br>예약 된 시간에 맞춰 내원해 주세요.
					</span> <a href="<%=request.getContextPath()%>/index.jsp"><button>확인</button></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />
</body>

</html>