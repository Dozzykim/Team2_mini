<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@page import="hospital.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 게시글 등록처리 구간 -->
    
<%
	// 앞에 form태그에 작성해서 넘겨준 파라미터를 변수에 저장
	String title = request.getParameter("title");
	String userId = request.getParameter("userId");
	String content = request.getParameter("content");
	
	Board board = new Board(title, userId, content);
	
	BoardService boardService = new BoardServiceImpl();
	int result = boardService.insert(board);
	
	String root = request.getContextPath();
	
	if (result > 0) {
		// 등록 성공
		response.sendRedirect(root + "/board/list.jsp");
	} else {
		// 등록 실패
		response.sendRedirect(root + "/board/insert.jsp?no=&msg=0");
	}
	
%>