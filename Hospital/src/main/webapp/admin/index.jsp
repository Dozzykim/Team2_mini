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
	<title>더조은 종합병원</title>
	
	<!-- link.jsp 상대경로가 달라서 구구절절 씀 -->
	<!-- slick css FILE -->
	<link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/slick.css">
	<link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/slick-theme.css">
	
	<!-- css -->
	<jsp:include page="/layout/link_admin.jsp" />
	<link rel="stylesheet" href="<%= request.getContextPath()%>/static/admin_css/admin_index.css">
		
	
	<!-- jQuery CDN 방식으로 포함하기 -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- slick js FILE -->
	<script src="static/js/slick.min.js"></script>
	<!-- script -->
	<script src="static/js/script.js"></script>
	
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="/layout/header_adm.jsp"></jsp:include>
	
	<div class="container">
		<div class="inner1">
			<div class="cont1">
				<div class="slide-container">
					<div class="slide">
						<img src="../static/img/h10.jpg" alt="">
					</div>
					<div class="slide">
						<img src="../static/img/h1.jpg" alt="">
					</div>
					<div class="slide">
						<img src="../static/img/h2.jpg" alt="">
					</div>
					<div class="slide">
						<img src="../static/img/h4.jpg" alt="">
					</div>
					<div class="slide">
						<img src="../static/img/h9.jpg" alt="">
					</div>
					<div class="slide">
						<img src="../static/img/h7.jpg" alt="">
					</div>
					<div class="slide">
						<img src="../static/img/h8.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
		<div class="inner2">

			<div class="cont2">
				<div class="cont2_left">
					<ul>
						<li><strong>THE JOEUN<br>HOSPITAL
						</strong></li>
						<li><span><b>더조은종합병원</b>은 풍부한 의료 경험과 최신 의료 기술을 바탕으로 환자
								중심의 진료를 제공하는 병원입니다.</span></li>
						<li>
							<p>
								1. 우리 병원은 최첨단 의료 시설을 갖추고 있습니다. <br>2. 우리 병원은 전문 의료진으로 구성되어
								있습니다. <br>3. 환자들은 편리하게 온라인을 통해 진료 일정을 예약할 수 있습니다. <br>4.
								우리 병원은 환자들 간의 소통과 지원을 위해 커뮤니티 게시판을 운영하고 있습니다. 환자들 간의 의견 교환과 상호
								지원의 장을 제공합니다.
							</p>
							<p id="plus">더조은종합병원은 항상 환자의 건강과 안전을 최우선으로 생각하며, 최고의 의료 서비스를
								제공하기 위해 노력하고 있습니다.</p>

						</li>
					</ul>
				</div>
				<div class="cont2_right">

					<ul>
						<li><a> <img src="static/img/hospital.jpg" alt="병원소개 페이지">
						</a></li>
					</ul>
				</div>
			</div>
			<div class="cont3">
				<div class="cont3_right">
					<ul>
						<li><strong>외과</strong></li>
						<li><span><b>외과</b>는 외상, 질병 또는 기타 신체적 이상을 치료하기 위해 수술적
								절차를 사용하는 의학 분야입니다. </span></li>
						<li>
							<p>
								1. 일반외과: 주로 내장 장기 수술 및 일상적인 수술 절차를 다룹니다. <br> 2. 정형외과: 뼈와
								관련된 상처, 골절, 관절 이상 및 기타 뼈 손상에 대한 수술적 치료를 다룹니다. <br> 3. 성형외과:
								성형 수술을 수행하여 외모를 개선 및 흉터 치료를 전문으로 하는 분야입니다. <br> 4. 심장외과: 심장
								및 혈관 관련 질환의 수술적 치료를 전문으로 합니다.
							</p>
						</li>
					</ul>
				</div>
				<div class="cont3_left">

					<ul>
						<li><a> <img src="static/img/surgery.jpg" alt="병원소개 페이지">
						</a></li>
					</ul>
				</div>
			</div>
			<div class="cont4">
				<div class="cont4_left">
					<ul>
						<li><strong>내과</strong></li>
						<li><span><b>내과</b>는 다양한 질병과 장애를 다루는 의학 분야로, 주로 내장 장기에
								관련된 질환을 다룹니다. </span></li>
						<li>
							<p>
								1. 일반내과: 일반적인 성인 내과 질환을 다룹니다. 심혈관 질환, 호흡기 질환, 내분비 질환, 소화기 질환 등을
								진단하고 치료합니다. <br> 2. 호흡기 내과 (Pulmonary Medicine): 폐와 호흡기 질환을
								전문으로 다루는 분야입니다. 폐 질환, 천식, 만성 폐쇄성 폐질환 (COPD) 등을 다룹니다. <br>
								3. 소화기 내과 (Gastroenterology): 소화기 관련 질환을 전문으로 다루는 분야로, 위장관 질환,
								간질환, 췌장질환 등을 진단하고 치료합니다. <br> 4. 내분비 내과 (Endocrinology):
								호르몬과 내분비 질환을 다루는 분야로, 당뇨병, 갑상선 질환, 난소 및 고환 질환 등을 진단하고 치료합니다.
							</p>
						</li>
					</ul>
				</div>
				<div class="cont4_right">

					<ul>
						<li><a> <img src="static/img/surgery1.jpg" alt="병원소개 페이지">
						</a></li>
					</ul>
				</div>
			</div>
			<div class="cont5">
				<div class="cont5_right">
					<ul>
						<li><strong>산부인과</strong></li>
						<li><span><b>산부인과</b>는 여성의 생식기와 관련된 질환을 다루는 의학 분야입니다.
								주로 다음과 같은 여성 건강에 관련된 질환을 다루며, 이를 통해 여성의 건강을 총괄적으로 관리합니다 </span></li>
						<li>
							<p>
								1. 여성 생식기 질환: 자궁, 난관, 난소, 질 등 여성 생식기의 질환과 이상을 다룹니다. <br> 2.
								임신 및 출산 관리: 임신 중의 여성 건강과 임신 중의 합병증, 분만 전후의 건강 상태를 관리합니다. <br>
								3. 여성 생식력 및 생식기 기능 관리: 생식기 건강과 생식력에 영향을 미치는 요인을 다룹니다. <br>
								4. 여성 성 건강: 여성의 성 건강과 성 기능에 관련된 문제를 다룹니다. 성병 치료, 여성 성기능 장애, 성매매
								피해자 지원 등을 포함합니다.
							</p>
						</li>
					</ul>
				</div>
				<div class="cont5_left">

					<ul>
						<li><a> <img src="static/img/surgery2.jpg" alt="병원소개 페이지">
						</a></li>
					</ul>
				</div>
			</div>
			<div class="cont6">
				<div class="cont6_left">
					<ul>
						<li><strong>피부과</strong></li>
						<li><span><b>피부과</b>는 피부와 관련된 질환 및 미용 치료를 다루는 의학
								분야입니다. </span></li>
						<li>
							<p>
								1. 피부 질환 관리: 여드름, 피부염, 습진, 포진, 거상 등과 같은 다양한 피부 질환의 진단과 치료를
								담당합니다. <br> 2. 미용 치료: 주름 개선, 피부 탄력 회복, 주근깨 및 색소침착 치료, 여드름
								흉터 치료, 피부 홍조 개선 등과 같은 미용 치료를 제공합니다. <br> 3. 피부 성형 및 성형수술:
								피부 성형, 리프팅, 보톡스 주사, 필러 주사 등을 통해 얼굴 형태를 개선하고 더욱 젊고 건강한 피부를 유지할 수
								있도록 도와줍니다. <br> 4. 피부암 조기 발견 및 치료: 피부암 조기 발견을 위한 피부 검진과 다양한
								피부암 치료를 수행합니다.
							</p>
						</li>
					</ul>
				</div>
				<div class="cont6_right">

					<ul>
						<li><a href="#none"> <img src="static/img/surgery3.jpg"
								alt="병원소개 페이지">
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>

</html>