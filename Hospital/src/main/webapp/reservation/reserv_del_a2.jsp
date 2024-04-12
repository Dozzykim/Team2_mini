<%@page import="hospital.DTO.Users"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.Service.UserServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String reqNo = request.getParameter("no");
    int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
    String userId = request.getParameter("userId");
    
    UserService userService = new UserServiceImpl();
    ReservationService reservationService = new ReservationServiceImpl();
    int result = reservationService.delete(no);
    
    List<Users> userList = userService.list();
    
    String root = request.getContextPath();

    if (result > 0) {
        // 삭제 성공 시
        response.sendRedirect(root + "/admin/userdetail.jsp?userId=" + userId);
    } else {
        // 삭제 실패 시
        response.sendRedirect(root + "/admin/userdetail.jsp?userId=" + userId);
    }
%>