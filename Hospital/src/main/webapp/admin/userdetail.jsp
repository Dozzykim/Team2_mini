<%@page import="org.apache.catalina.User"%>
<%@page import="hospital.DTO.Reservation"%>
<%@page import="hospital.DTO.Users"%>
<%@page import="hospital.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hospital.Service.ReservationService"%>
<%@page import="hospital.Service.ReservationServiceImpl"%>
<%@page import="hospital.Service.UserService"%>
<%@page import="hospital.Service.UserServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@page import="hospital.Service.BoardServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보</title>
<jsp:include page="/layout/link_admin.jsp" />
<link rel="stylesheet"
    href="<%= request.getContextPath()%>/static/admin_css/admin_reservation.css">
</head>
<body>

    <!-- 헤더 -->
    <jsp:include page="/layout/header_adm.jsp"></jsp:include>

    <!-- 플로팅 -->
    <jsp:include page="/layout/floating.jsp"></jsp:include>

    <%
	    // 사용자의 아이디를 파라미터로 받아오기
	    String userId = request.getParameter("userId");
	
	    UserService userService = new UserServiceImpl();
	    ReservationService reservationService = new ReservationServiceImpl();
	    BoardService boardService = new BoardServiceImpl();
	    
	
	    List<Users> userList = userService.list();
	    List<Board> userboardList = boardService.listByUserId(userId);
	    
	    int boardNo = -1; // 기본값 설정
	    String boardNoParam = request.getParameter("boardNo");
	    if (boardNoParam != null && !boardNoParam.isEmpty()) {
	        boardNo = Integer.parseInt(boardNoParam);
	    }
	   
	    
	    
	    Users user = null;
	    for (Users u : userList) {
	        if (u.getUser_id().equals(userId)) {
	            user = u;
	            break;
	        }
	    }
	    
	    Board board = null;
	    for (Board b : userboardList){
	        if(b.getUser_id().equals(userId)){
	            board = b;
	            break;
	        }
	    }
	    
	   
	
	    List<Reservation> reservationList = reservationService.listByUserId(userId);
	    
	%>

	    <div class="container">
	    <div class="inner">
	        <div class="cont_full">
	            <!-- 회원 예약 현황 -->
	            <div class="cont_top">
	                <h1>회원 정보</h1>
	                <p>회원 예약 현황</p>
	                <table border="1">
	                    <tr>
	                        <th>회원 아이디</th>
	                        <th>회원 이름</th>
	                        <th>카테고리</th>
	                        <th>예약 날짜</th>
	                        <th>예약 시간</th>
	                        <th>예약 취소</th>
	                    </tr>
	                    <% if (reservationList == null || reservationList.size() == 0) { %>
	                    <tr>
	                        <td colspan="6">조회된 예약 항목이 없습니다.</td>
	                    </tr>
	                    <% } else {
	                        for (Reservation reservation : reservationList) { %>
	                    <tr>
	                        <td><%= reservation.getUser_id() %></td>
	                        <td><%= user.getUser_name() %></td>
	                        <td><%= reservation.getR_category() %></td>
	                        <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getR_date()) %></td>
	                        <td><%= reservation.getR_time() %></td>
	                        <td><a href="<%= request.getContextPath() %>/reservation/reserv_del_a2.jsp?no=<%= reservation.getR_no() %>&userId=<%= userId %>"
	                                onclick="return confirm('예약을 취소하시겠습니까?')"><button id="cancel">예약취소</button></a></td>
	                    </tr>
	                    <% }
	                    } %>
	                </table>
	            </div>
	            <!-- 회원의 작성글 현황 -->
	            <div class="cont_top">
	                <p>회원의 작성글 현황</p>
	            </div>
	            <div class="cont_my">
	                <table border="1">
	                    <tr>
	                        <th>번호</th>
	                        <th>카테고리</th>
	                        <th>제목</th>
	                        <th>등록 날짜</th>
	                        <th>글 삭제</th>
	                    </tr>
	                    <% if (userboardList == null || userboardList.size() == 0) { %>
	                    <tr>
	                        <td colspan="5">조회된 글이 없습니다.</td>
	                    </tr>
	                    <% } else {
	                        for (Board userBoard : userboardList) { %>
	                    <tr>
	                        <td><%= userBoard.getNo() %></td>
	                        <td><%= userBoard.getCategory() %></td>
	                        <td><a href="<%= request.getContextPath() %>/admin/read.jsp?no=<%= userBoard.getNo() %>"><%= userBoard.getTitle() %></a></td>
	                        <td><%= userBoard.getReg_date() %></td>
	                        <td><a href="<%= request.getContextPath() %>/admin/delete2.jsp?no=<%= userBoard.getNo() %>&userId=<%= userId %>"
	                                onclick="return confirm('정말로 삭제하시겠습니까?')"><button id="cancel">삭제</button></a></td>
	                    </tr>
	                    <% }
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
