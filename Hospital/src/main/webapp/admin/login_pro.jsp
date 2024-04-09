<%@page import="hospital.Service.AdminServiceImpl"%>
<%@page import="hospital.Service.AdminService"%>
<%@page import="hospital.DTO.Admin"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Admin admin = new Admin();
	admin.setAdmin_id(id);
	admin.setAdmin_pw(pw);
	
	// 로그인 요청
	AdminService userService = new AdminServiceImpl();
	Admin loginAdmin = userService.login(admin);
	
	// 로그인 실패
	if( loginAdmin == null ) {
		response.sendRedirect("admin/login.jsp?msg=0");
		return;
	}
	String root = request.getContextPath();
	if( loginAdmin != null) {
		// 로그인 성공
		// 세션에 아이디 등록 후, 메인 페이지로 이동
		session.setAttribute("loginId", loginAdmin.getAdmin_id() );
		response.sendRedirect( root + "/index_admin.jsp" );
	}
	
%>