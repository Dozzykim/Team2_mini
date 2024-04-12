<%@page import="java.util.List"%>
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

    // 입력값이 비어있는지 확인합니다.
    if (name == null || name.trim().isEmpty() || pno == null || pno.trim().isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/user/find_id.jsp?msg=0"); // 입력값이 비어있는 경우
        return;
    }

    // 사용자 객체를 생성하고 입력된 이름과 연락처를 설정합니다.
    Users user = new Users();
    user.setUser_name(name);
    user.setUser_pno(pno);

    // 아이디 찾기를 위해 UserService 객체를 생성합니다.
    UserService userService = new UserServiceImpl();

    // 아이디를 찾는 메서드를 호출하여 결과를 가져옵니다.
    List<String> resultList = userService.findId(user);

    // 결과값이 null이거나 비어 있는 경우에 대한 처리
    if (resultList == null || resultList.isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/user/find_id.jsp?msg=0"); // 사용자를 찾을 수 없는 경우
        return;
    }

    // 사용자가 존재하는 경우
    request.setAttribute("user_id", resultList);
    request.getRequestDispatcher("/user/complete_find_id.jsp").forward(request, response);
%>
