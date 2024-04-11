<%@page import="hospital.Service.UserServiceImpl"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.DTO.Users"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 요청으로부터 사용자가 입력한 이름과 연락처를 가져옵니다.
    String name = request.getParameter("user_name");
    String pno = request.getParameter("user_pno");

    // 사용자 객체를 생성하고 입력된 이름과 연락처를 설정합니다.
    Users user = new Users();
    user.setUser_name(name);
    user.setUser_pno(pno);

    // 아이디 찾기를 위해 UserService 객체를 생성합니다.
    UserService userService = new UserServiceImpl();

    // 아이디를 찾는 메서드를 호출하여 결과를 가져옵니다.
    String userId = userService.findId(user);

    String root = request.getContextPath();
    // 아이디 찾기 실패
    if(userId) {
        response.sendRedirect(root + "/user/complete_find_id.jsp");
        return;
    } else {
        // 아이디 찾기 성공
        response.sendRedirect("find_id.jsp?msg=0");
    }
%>
