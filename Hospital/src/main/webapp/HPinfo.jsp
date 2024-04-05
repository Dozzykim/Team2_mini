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
<title>병원 소개</title>

<!-- link.jsp 상대경로가 달라서 구구절절 씀 -->
<!-- slick css FILE -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/slick-theme.css">

<!-- css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/info.css">


<!-- jQuery CDN 방식으로 포함하기 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- slick js FILE -->
<script src="static/js/slick.min.js"></script>
<!-- script -->
<script src="static/js/script.js"></script>
</head>

<body>
	<header class="header" id="header">
		<div class="inner">
			<div class="header_top">
				<ul class="util">
					<!-- 비로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId == null }">
						<li><a href="<%=request.getContextPath()%>/user/login.jsp">로그인</a></li>
						<li><a href="<%=request.getContextPath()%>/user/join.js">회원가입</a></li>
					</c:if>
					<!-- 로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId != null }">
						<li><a href="<%=request.getContextPath()%>/user/logout.jsp">로그아웃</a></li>
						<li><a href="<%=request.getContextPath()%>/user/mypage.jsp">마이페이지</a></li>
					</c:if>
				</ul>
				<h1 class="main_name">
					<a href="<%=request.getContextPath()%>/index.jsp">더조은 종합병원</a>
				</h1>
			</div>
			<div class="header_bottom">
				<ul>
					<li><a href="<%=request.getContextPath()%>/board/list.jsp">소통
							해요</a></li>
					<li><a
						href="<%=request.getContextPath()%>/reservation/reserv.jsp">진료
							예약</a></li>
					<li><a href="<%=request.getContextPath()%>/HPinfo.jsp">병원
							소개</a></li>
				</ul>
			</div>
		</div>
	</header>

	<section class="product-list">
		<h1>의료진 소개</h1>
		<div class="inner">
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>박은서 / 외과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>정다운 / 외과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>백승헌 / 외과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>전나연 / 내과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>신준수 / 내과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>윤준호 / 피부과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>김도희 / 피부과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>이태원 / 산부인과</h3>
					</a>
				</div>
			</div>
			<div class="product-card">
				<div class="img-box">

					<img src="static/img/doctor.png" alt="상품 이미지"></a>
				</div>
				<div class="content-box"></div>
				<div class="title">


					<h3>홍준범 / 산부인과</h3>
					</a>
				</div>
			</div>
		</div>
	</section>


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
</body>

</html>