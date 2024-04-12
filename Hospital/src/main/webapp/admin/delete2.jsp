<%@page import="hospital.DTO.Users"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.Service.UserServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String reqNo = request.getParameter("no");
	int no = reqNo == null ? 0 : Integer.parseInt(reqNo);
	String userId = request.getParameter("userId");
	
	UserService userService = new UserServiceImpl();
	BoardService boardService = new BoardServiceImpl();
	int result = boardService.delete(no);
	
	List<Users> userList = userService.list();
	String root = request.getContextPath();
	
	if (result > 0) {
        // 삭제 성공 시
        response.sendRedirect(root + "/admin/userdetail.jsp?userId=" + userId);
    } else {
        // 삭제 실패 시
        response.sendRedirect(root + "/admin/userdetail.jsp?userId=" + userId);
    }
	
%>