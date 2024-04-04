<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <meta charset="UTF-8">
    <title>예약화면</title>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd' // 날짜 형식을 지정합니다. yyyy-mm-dd 형식으로 지정합니다.
            });
        });
    </script>
</head>
<body>

    <h1>예약</h1>
	<h3>${sessionScope.loginId} 님 환영합니다!</h3>
    <form action="reserv_pro.jsp" method="post"> 
        <select name="r_category" id="r_category">
            <option value="외과">외과</option>
            <option value="내과">내과</option>
            <option value="산부인과">산부인과</option>
            <option value="피부과">피부과</option>
        </select>

        <label for="datepicker">날짜 선택:</label>
        <input type="text" id="datepicker" name="r_date">
		
        
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
        <input type="submit" value="예약하기"> 
    </form>
    
    
</body>
</html>
