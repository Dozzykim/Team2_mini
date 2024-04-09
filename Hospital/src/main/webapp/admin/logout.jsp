<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 로그아웃 기능만 있고, 페이지는 없음 -->
	<!-- 로그아웃 버튼 클릭시 로그아웃 처리되면서 메인화면으로 바로 이동됨 -->
<%
	
	
	// ii)) url 경로를 지정하여 이동
	response.sendRedirect(request.getContextPath() + "/");
%>