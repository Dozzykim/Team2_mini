<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%



	//아직 아무곳에도 연결 안해놓은 jsp임!!!!!!!!!!!!!!!!!!!!!!
	
	
	
	
	
	// 게시글 등록 페이지에서 최신 글번호 가져와야해서 만든 과정
	BoardService boardService = new BoardServiceImpl();
	int latestNo = boardService.lastNo(); // lastNo은 마지막 게시글 번호를 가져옴
	
	String root = request.getContextPath();
	response.sendRedirect(root + "/board/insert.jsp?no="+ latestNo);
%>