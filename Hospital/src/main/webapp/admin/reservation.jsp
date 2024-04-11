<%@page import="hospital.DAO.UserDAO"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="hospital.DTO.Reservation"%>
<%@page import="hospital.DTO.Users"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.Service.UserServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 예약 현황</title>
	
	<!-- css -->
	<jsp:include page="/layout/link_admin.jsp" />
	<link rel="stylesheet" href="<%= request.getContextPath()%>/static/admin_css/admin_reservation.css">
</head>
<body>
	<%
	
	ReservationService reservationService = new ReservationServiceImpl();
	List<Reservation> reservationList = reservationService.list();
	UserService userService = new UserServiceImpl();
	
	%>

	<!-- 헤더 -->
	<jsp:include page="/layout/header_adm.jsp"></jsp:include>
	
	<!-- 플로팅 -->
	<jsp:include page="../layout/floating.jsp"></jsp:include>
	
	<div class="container">
		<h1>전체 예약 환자</h1>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>카테고리</th>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>예약 취소</th>
			</tr>

			<%
			if (reservationList == null || reservationList.size() == 0) {
			%>
			<tr>
				<td colspan="5">조회된 예약 항목이 없습니다.</td>
			</tr>
			<%
			} else {
			for (Reservation reservation : reservationList) {
			%>
			<tr>
				<td><%=reservation.getR_no()%></td>
				<td><%=reservation.getUser_id()%></td>
				<td><%= reservation.getUser_name() %></td>
				<td><%=reservation.getR_category()%></td>
				<td><%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getR_date())%></td>
				<td><%=reservation.getR_time()%></td>
				<td><a
					href="<%=request.getContextPath()%>/reservation/reserv_del_a.jsp?no=<%=reservation.getR_no()%>"
					onclick="return confirm('정말로 삭제하시겠습니까?')">
						<button id="cancel">예약취소</button>
				</a></td>
			</tr>
			<%
			}
			}
			%>
		</table>


	</div>
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>