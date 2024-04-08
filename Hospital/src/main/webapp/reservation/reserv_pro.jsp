<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@page import="hospital.DTO.Reservation"%>
<%@ page import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String root = request.getContextPath();
    
    // 필요한 정보 : 유저아이디, 진료과, 날짜, 시간
    String user_id = (String) session.getAttribute("loginId");
    
    // 로그인되어 있지 않으면 로그인 페이지로 이동
    if (user_id == null || user_id.isEmpty()) {
%>
    <script>
        alert("로그인이 필요합니다.");
        window.location.href = "<%= root %>/user/login.jsp";
    </script>
<%
        return; 
    }
%>
<% 
    String r_category = request.getParameter("r_category");
    String r_dateStr = request.getParameter("r_date");
    Date r_date = null;
    if (r_dateStr != null && !r_dateStr.isEmpty()) {
        r_date = Date.valueOf(r_dateStr);
    }
    else{
    	out.println("<script>alert('날짜를 선택해주세요.'); history.go(-1);</script>");
    	// histroy.go() 이전 또는 이후 페이지의 이동이 가능
    	// -1을 넣었기 때문에 이전 페이지로 돌아감
    	return;
    }
    

    String r_time = request.getParameter("r_time");
    
    // Reservation 객체 생성
    Reservation reservation = new Reservation();
    reservation.setUser_id(user_id);
    reservation.setR_category(r_category);
    reservation.setR_date(r_date);
    reservation.setR_time(r_time);
    
    ReservationServiceImpl reservationService = new ReservationServiceImpl();
    int result = 0; // 중복체크하는 함수
    result = reservationService.check(reservation);
    
    if (result > 0) {
        // 중복 걸리면
        response.sendRedirect(root + "/reservation/reserv.jsp?msg=0");
    } else {
        // 예약 insert
        reservationService.insert(reservation);
        response.sendRedirect(root + "/reservation/reservComplete.jsp");
    }
%>


