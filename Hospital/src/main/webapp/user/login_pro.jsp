<%@page import="hospital.DTO.Users"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	Users user = new Users();
	user.setId(id);
	user.setPassword(password);
	
	// �α��� ��û
	UserService userService = new UserServiceImpl();
	Users loginUser = userService.login(user);
	
	// �α��� ����
	if( loginUser == null ) {
		response.sendRedirect("login.jsp?msg=0");
		return;
	}
	
	// ���̵� ����
	String rememberId = request.getParameter("rememberId");
	Cookie cookieRememberId = new Cookie("rememberId", "");
	Cookie cookieUserId = new Cookie("userId", "");
	

	// üũ �ڽ� üũ ��, �� : on
	if (rememberId != null && rememberId.equals("on")) {
		// ��Ű ����
		// UTF-8 ���� ���ڵ��Ͽ� ���� �����ؾ��Ѵ�.
		cookieRememberId.setValue( URLEncoder.encode( rememberId, "UTF-8" ));
		cookieUserId.setValue( URLEncoder.encode( id, "UTF-8" ));
	}
	// üũ �ڽ� ��üũ ��
	else {
		// ��Ű ����
		cookieRememberId.setMaxAge(0);
		cookieUserId.setMaxAge(0);
	}
	// ��Ű ���信 ���
	response.addCookie(cookieRememberId);
	response.addCookie(cookieUserId);
	// ���̵� ����(��)
	
	
	
	// �ڵ� �α���
	String rememberMe = request.getParameter("rememberMe");
	Cookie cookieRemeberMe = new Cookie("rememberMe", "");
	Cookie cookieToken = new Cookie("token", "");
	
	// �ڵ� �α��� üũ ����, ��ū ��Ű�� ���� ��� ����
	cookieRemeberMe.setPath("/");
	cookieToken.setPath("/");
	// ��Ű ��ȿ�Ⱓ ����
	cookieRemeberMe.setMaxAge(7*60*60*24);		// �ʴ��� --> 7��
	cookieToken.setMaxAge(7*60*60*24);
	
	// üũ ���ο� ���� ��Ű ���� �Ǵ� ����
	if( rememberMe != null && rememberMe.equals("on") ) {
		// �ڵ� �α��� üũ
		// - ��ū ����
		String tokenValue = userService.refreshToken(id);
		// - ��Ű ����
		cookieRemeberMe.setValue( URLEncoder.encode( rememberMe, "UTF-8") );
		cookieToken.setValue( URLEncoder.encode( tokenValue, "UTF-8") );
	} else {
		// �ڵ� �α��� ��üũ
		// ��Ű ����
		cookieRemeberMe.setMaxAge(0);
		cookieToken.setMaxAge(0);
	}
	
	// ���信 ��Ű ���
	response.addCookie(cookieRemeberMe);
	response.addCookie(cookieToken);
	// �ڵ� �α���(��)
	
	
	if( loginUser != null) {
		// �α��� ����
		// ���ǿ� ���̵� ��� ��, ���� �������� �̵�
		session.setAttribute("loginId", loginUser.getId());
		response.sendRedirect("index.jsp");
	}
	else {
		// �α��� ����
		response.sendRedirect("login.jsp?msg=0");
	}
	
	
	
	
%>l>