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
	int searchNo = Integer.parseInt(request.getParameter("searchNo"));

	/* BoardService boardService = new BoardServiceImpl();
	Board board = boardService.select(searchNo);
		
	String root = request.getContextPath();
	
	if (board != null) {
		response.sendRedirect(root + "/board/list.jsp?msg=" + searchNo);
	} */
	
	// 여기부터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	String root = request.getContextPath();
	response.sendRedirect(root + "/board/list.jsp?msg=" + searchNo);
%>