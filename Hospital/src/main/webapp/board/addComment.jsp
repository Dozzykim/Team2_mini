<%@page import="hospital.Service.CmntServiceImpl"%>
<%@page import="hospital.Service.CmntService"%>
<%@page import="hospital.DTO.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userId = (String)session.getAttribute("loginId");
	String content = request.getParameter("commentText");
	
	Comment cmnt = new Comment(userId, content);

	CmntService cmntService = new CmntServiceImpl();
	int result = cmntService.insert(cmnt);
	
	String root = request.getContextPath();
	
	if (result > 0) {
		// 등록 성공
		response.sendRedirect(root + "/board/comment.jsp");
	} else {
		// 등록 실패
		
	}
%>