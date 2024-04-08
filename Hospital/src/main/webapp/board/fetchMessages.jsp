<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 여기에는 DB에서 최근 채팅 메시지를 가져와서 화면에 출력하는 코드를 작성합니다.
    // 이 예제에서는 간단하게 고정된 메시지를 반환합니다.
    String message1 = "사용자1: 안녕하세요!";
    String message2 = "사용자2: 안녕하세요!";
%>
<div><%= message1 %></div>
<div><%= message2 %></div>
