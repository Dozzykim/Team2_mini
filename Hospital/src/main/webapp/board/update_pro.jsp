<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@page import="hospital.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 필요한 정보: 번호, 제목, 작성자, 내용
	String reqNo = request.getParameter("no");
	int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
	
	String title = request.getParameter("title");
	String userId = request.getParameter("userId");
	String content = request.getParameter("content");
	String category = request.getParameter("category");
	
	Board board = new Board(category, title, userId, content);
	board.setNo(no);
	
	BoardService boardService = new BoardServiceImpl();
	int result = boardService.update(board);
	
	String root = request.getContextPath();
	if(result > 0) {
		//수정 성공
		response.sendRedirect( root + "/board/list.jsp");
	} else { 
		//수정 실패
		response.sendRedirect( root + "/board/update.jsp?no=" + no + "&msg=0");
	}

%>