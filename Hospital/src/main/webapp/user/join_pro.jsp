<%@page import="hospital.Service.UserServiceImpl"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.DTO.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	String name = request.getParameter("user_name");
	String age1 = request.getParameter("user_age1"); // 주민등록번호 앞자리
	String age2 = request.getParameter("user_age2"); // 주민등록번호 뒷자리
	String age = age1 + '-' +  age2; 				 // 주민등록번호 전체
	String pno = request.getParameter("user_pno");
	String address = request.getParameter("user_address");
	
	Users user = new Users();
	user.setUser_id(id);
	user.setUser_pw(pw);
	user.setUser_name(name);
	user.setUser_age(age); 
	user.setUser_pno(pno);
	user.setUser_address(address);
	


	
	// 회원 정보 등록 요청
	UserService userService = new UserServiceImpl();
	int result = userService.join(user);

	
	String root = request.getContextPath();
	// 회원가입 성공
	if( result > 0 ) {
		response.sendRedirect(root + "/user/complete_join.jsp");
	}
	// 회원가입 실패
	else {
		response.sendRedirect("join.jsp?msg=0");		// msg=0 은 회원가입 실패
	}
	
	
%>