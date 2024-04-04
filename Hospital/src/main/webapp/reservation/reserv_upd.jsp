<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@page import="hospital.DTO.Reservation"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>삭제</title>
</head>
<body>
	<script>
	
		// 삭제 요청
		function deletePro() {
			const form = document.getElementById('form')
			const no = document.getElementById('no').value
			
			// action 속성을 삭제요청 경로로 변경
			form.action = 'delete.jsp?no=' + no
			// 입력양식 폼 제출
			form.submit()
			
		}
	</script>
</body>
</html>