<%@page import="hospital.DTO.Comment"%>
<%@page import="hospital.Service.CmmtServiceImpl"%>
<%@page import="hospital.Service.CmmtService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo= Integer.parseInt(request.getParameter("boardNo"));
	String loginId = request.getParameter("loginId");
	String content = request.getParameter("cmmt");
	
	CmmtService cmmtService = new CmmtServiceImpl();
	Comment cmmt = new Comment(boardNo, loginId, content);
	int result = cmmtService.insert(cmmt);
	
	
	String root = request.getContextPath();
	
	if (result > 0) {
		// 등록 성공
		response.sendRedirect(root + "/board/read.jsp?no=" + boardNo);
	} else {
		// 등록 실패
		response.sendRedirect(root + "/board/read.jsp?no=" + boardNo +"&msg=0");
	}


%>