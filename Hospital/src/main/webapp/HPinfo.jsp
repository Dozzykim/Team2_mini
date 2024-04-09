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
	<!-- 헤더 -->
	<jsp:include page="/layout/header.jsp"></jsp:include>

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


	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>

</html>