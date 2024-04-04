<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@page import="hospital.DTO.Reservation"%>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 임시 세션 (왜냐하면 나는 로그인 코드가 없기 때문에 세션이 생기질 않음) 
    // session.setAttribute("user_id", "asdf");
    // 필요한 정보 : 유저아이디, 진료과, 날짜, 시간
    String user_id = request.getParameter("user_id");
    String r_category = request.getParameter("r_category");
    String r_dateStr = request.getParameter("r_date");
    Date r_date = null;
    if (r_dateStr != null && !r_dateStr.isEmpty()) {
        r_date = Date.valueOf(r_dateStr);
    }
    String r_time = request.getParameter("r_time");

    // Reservation 객체 생성
    Reservation reservation = new Reservation();
    reservation.setUser_id(user_id);
    reservation.setR_category(r_category);
    reservation.setR_date(r_date);
    reservation.setR_time(r_time);
    
    ReservationServiceImpl reservationService = new ReservationServiceImpl();

 // 중복 예약 확인
    boolean isDuplicate = reservationService.check(request, reservation);

    // 중복 예약이 아닌 경우에만 예약 처리
    if (!isDuplicate) {
        int result = reservationService.insert(request, reservation);
        
        String root = request.getContextPath();
        
        if( result > 0 ) {
            // 예약 성공
            response.sendRedirect(root + "/reservation/reservComplete.jsp");
        } else {
            // 예약 실패
            response.sendRedirect(root + "/reservation/reserv.jsp");
        }
    } else {
        // 중복 예약이므로 다시 예약 페이지로 이동
        response.sendRedirect(request.getContextPath() + "/reservation/reserv.jsp?duplicate=true");
    }
%>
