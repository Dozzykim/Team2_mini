<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <meta charset="UTF-8">
    <title>예약화면</title>
   
   
    <jsp:include page="/layout/link_reserv.jsp" />
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd' // 날짜 형식을 지정합니다. yyyy-mm-dd 형식으로 지정합니다.
            });
        });
        
        function clickDatePicker() {
        	// $('선택자').trigger('이벤트')
        	$('#datepicker').trigger('focus')
        }
    </script>
    
</head>
<body>

    
	<!-- <h3>${sessionScope.loginId} 님 환영합니다!</h3> -->
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
    <div class="container">
    <div class="inner">
        <div class="board_area">
            <h1><img src="/image/reservation.png" alt="">예약</h1>
            <p>원하는 진료 과와 날짜 및 시간을 선택하여 빠르게 예약해 보세요!</p>
            <div class="action_area">
                <form action="reserv_pro.jsp" method="post">
                    <select name="r_category" id="r_category">
                        <option value="외과">외과</option>
                        <option value="내과">내과</option>
                        <option value="산부인과">산부인과</option>
                        <option value="피부과">피부과</option>
                    </select>
					
  					<div class="cal">
                    	<input type="text" id="datepicker" name="r_date" placeholder="날짜">
						<i class="fa fa-calendar" onclick="clickDatePicker()"></i>
					</div>
                    
                    <select name="r_time" id="r_time">
                        <option value="09:00">09:00</option>
                        <option value="10:00">10:00</option>
                        <option value="11:00">11:00</option>
                        <option value="13:00">13:00</option>
                        <option value="14:00">14:00</option>
                        <option value="15:00">15:00</option>
                        <option value="16:00">16:00</option>
                        <option value="17:00">17:00</option>
                    </select>
                    <button type="submit">예약하기</button>
                </form>
            </div>
        </div>
    </div>
</div>
    <!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
    
</body>
</html>
