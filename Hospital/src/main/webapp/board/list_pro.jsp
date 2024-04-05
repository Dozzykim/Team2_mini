<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="hospital.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 게시글 카테고리별 조회 -->

<%
	String category = request.getParameter("category");

	switch (category) {
	case "1" :
		category = "외과";
		break;
	case "2" :
		category = "피부과";
		break;
	case "3" :
		category = "소아과";
		break;
	default :
		category = null;
		break;
	}

	
	String root = request.getContextPath();
	
	if (category != null) {
		response.sendRedirect(root + "/board/list_test.jsp?category=" + category);
	} else {
		response.sendRedirect(root + "/board/list_test.jsp");
	}
	
	
	
%>