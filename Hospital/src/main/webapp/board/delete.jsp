
<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">

    
<%

	String reqNo = request.getParameter("no");
	int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
	
	BoardService boardService = new BoardServiceImpl();
	int result = boardService.delete(no);
	
	String root = request.getContextPath();
	
	if(result > 0) {
		// 삭제 성공 -> 목록으로 이동
		response.sendRedirect(root + "/board/list.jsp");
	} else {
		// 삭제 실패 -> 수정으로 이동
		response.sendRedirect(root + "/board/update.jsp?no=" + no);
	}
	
%>