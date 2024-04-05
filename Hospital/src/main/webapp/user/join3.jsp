<%@ page import="hospital.Service.UserService" %>
<%@ page import="hospital.Service.UserServiceImpl" %>
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
<title>회원가입</title>
	<jsp:include page="/layout/link_join.jsp" />
	<!-- jQuery CDN 방식으로 포함하기 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
<script>
    function validateForm() {
        var password = document.getElementById("user_pw").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        
        // 비밀번호와 비밀번호 확인이 일치하는지 확인
        if (password !== confirmPassword) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
        
        // 비밀번호의 정규식 검사
        var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        if (!passwordRegex.test(password)) {
            alert("비밀번호는 8자 이상의 영문과 숫자 조합이어야 합니다.");
            return false;
        }
        
        // 이름 유효성 검사 (숫자가 포함되어 있지 않은지)
        var name = document.getElementById("user_name").value;
        var nameRegex = /^[가-힣]+$/;
        if (!nameRegex.test(name)) {
            alert("이름은 한글로만 입력해야 합니다.");
            return false;
        }

        // 생년월일 유효성 검사 (숫자만 포함되어 있는지)
        var age = document.getElementById("user_age").value;
        var ageRegex = /^[0-9]+$/;
        if (!ageRegex.test(age)) {
            alert("생년월일은 숫자로만 입력해야 합니다.");
            return false;
        }
 
        // 전화번호 유효성 검사 (숫자만 포함되어 있는지)
        var phone = document.getElementById("user_pno").value;
        var phoneRegex = /^[0-9]+$/;
        if (!phoneRegex.test(phone)) {
            alert("전화번호는 숫자로만 입력해야 합니다.");
            return false;
        }
        
        return true;
    }
    
</script>



</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
    <h1>회원 가입</h1>
    <c:if test="${param.msg == 0}">
        <p style="color: red;">이미 아이디가 존재하고있습니다.</p>
    </c:if>
    <form action="join_pro.jsp" method="post" onsubmit="return validateForm()">
         <p>
            <label for="user_id">아이디</label>
            <input type="text" name="user_id" id="user_id" />
        </p>
        <p>
            <label for="user_pw">비밀번호</label>
            <input type="password" name="user_pw" id="user_pw" />
        </p>
        <p>
            <label for="confirmPassword">비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </p>
        <p>
            <label for="user_name">이름</label>
            <input type="text" name="user_name" id="user_name" />
        </p>
        <p>
            <label for="user_age">생년월일</label>
            <input type="text" name="user_age" id="user_age" />
        </p>
        <p>
            <label for="user_pno">전화번호</label>
            <input type="text" name="user_pno" id="user_pno" />
        </p>
        <p>
            <label for="user_address">주소</label>
            <input type="text" name="user_address" id="user_address" />
        </p>
        <input type="submit" value="회원가입" />
    </form>
    
    <!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>