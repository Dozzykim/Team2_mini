<%@page import="hospital.DTO.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

    <%
        // 세션에서 사용자 ID 가져오기
        String sessionUserId = (String) session.getAttribute("loginId");
        
        // 세션에 사용자 ID가 없으면 로그인 페이지로 리다이렉트
        if (sessionUserId == null || sessionUserId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        } else {
            ReservationService reservationService = new ReservationServiceImpl();
            List<Reservation> reservationList = reservationService.listByUserId(sessionUserId);
    %>
    

    
    <div class="container">
        <h1>본인 예약 리스트</h1>
        <table border="1">
         <tr>
            <!--  <th>회원 아이디</th> -->
            <th>카테고리</th>
            <th>예약 날짜</th>
            <th>예약 시간</th>
            <th>예약 취소</th>
         </tr>
         
         <% if(reservationList == null || reservationList.size() == 0){ %>
        <tr>
                <td colspan="5">조회된 예약 항목이 없습니다.</td>
            </tr>
            <% } else {
                    for(Reservation reservation : reservationList) {
            %>
                        <tr>
                            
                            <!-- <td><%= reservation.getUser_id() %></td> -->
                            <td><%= reservation.getR_category() %></td>
                            <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getR_date()) %></td>
                            <td><%= reservation.getR_time() %></td>
                            <td>
                                <!-- 삭제 링크 -->
                                <a href="<%= request.getContextPath() %>/reservation/reserv_del.jsp?no=<%= reservation.getR_no() %>"
                                		onclick="return confirm('정말로 삭제하시겠습니까?')">예약취소</a>
                                
                            </td>
                            
                        </tr>
            <%      }
                }
            %>
        </table>
    </div>
    <% } %>
</body>
</html>
