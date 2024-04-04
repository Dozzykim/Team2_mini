<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	String reqNo = request.getParameter("no");
	int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
	
	ReservationService reservationService = new ReservationServiceImpl();
	int result = reservationService.delete(no);
	
	String root = request.getContextPath();
	if( result > 0 ) {
		// ���� ���� 
		response.sendRedirect(root + "/admin/reservation.jsp");
	}
	else {
		// ���� ���� 
		response.sendRedirect(root + "/admin/reservation.jsp");
	}
	
	

%>