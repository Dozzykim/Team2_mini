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
	
	// �α��� ��û
	AdminService userService = new AdminServiceImpl();
	Admin loginAdmin = userService.login(admin);
	
	// �α��� ����
	if( loginAdmin == null ) {
		response.sendRedirect("admin/login.jsp?msg=0");
		return;
	}
	String root = request.getContextPath();
	if( loginAdmin != null) {
		// �α��� ����
		// ���ǿ� ���̵� ��� ��, ���� �������� �̵�
		session.setAttribute("loginId", loginAdmin.getAdmin_id() );
		response.sendRedirect( root + "/index_admin.jsp" );
	}
	
%>