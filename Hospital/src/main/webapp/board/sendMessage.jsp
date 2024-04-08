<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // POST 방식으로 전달된 메시지 데이터 가져오기
    String message = request.getParameter("message");
    
    // 메시지를 DB에 저장하거나 다른 작업을 수행할 수 있습니다.
    // 여기서는 간단히 콘솔에 출력합니다.
    System.out.println("Received message: " + message);
%>
