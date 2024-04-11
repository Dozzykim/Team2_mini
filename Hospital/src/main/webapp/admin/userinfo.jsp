<%@page import="hospital.DAO.UserDAO"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="hospital.DTO.Users"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.Service.UserServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보</title>
    
	<!-- css -->
	<jsp:include page="/layout/link_admin.jsp" />
	<link rel="stylesheet" href="<%= request.getContextPath()%>/static/admin_css/admin_reservation.css">
	
</head>

<body>
   <!-- 헤더 -->
	<jsp:include page="/layout/header_adm.jsp"></jsp:include>
	
	<!-- 플로팅 -->
	<jsp:include page="../layout/floating.jsp"></jsp:include>

    <!-- 컨테이너 영역 -->
   
    <%
    	UserService userService = new UserServiceImpl();
    	List<Users> userList = userService.list();
	%>


	<div class="container">
		<div class="inner">
			<div class="cont_full">
				<div class="cont_top">
					<h1>회원정보</h1>
				</div>
				
				
				<div class="cont_top">
					
				</div>
				
				<div class="cont_tb">
				
					<table border="1">
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>주민등록번호</th>
							<th>전화번호</th>
							<th>주소</th>
						</tr>
						<% 
                        if(userList == null || userList.size() == 0){ %>
						<tr>
							<td colspan="6">조회된 회원 항목이 없습니다.</td>
						</tr>
						<% 
                        } else {
                            for(Users user : userList) { %>
						<tr>
							<td><%= user.getUser_name() %></td>
							<td><%= user.getUser_id() %></td>
							<td><%= user.getUser_pw() %></td>
							<td><%= user.getUser_age() %></td>
							<td><%= user.getUser_pno() %></td>
							<td><%= user.getUser_address()%></td>
						</tr>
						<%      }
                        } %>
					</table>

				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>

</html>