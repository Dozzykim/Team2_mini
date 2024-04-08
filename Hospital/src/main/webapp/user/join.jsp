<%@ page import="hospital.Service.UserService" %>
<%@ page import="hospital.Service.UserServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<jsp:include page="/layout/link.jsp" />
	<link href="<%= request.getContextPath() %>/static/css/join.css" rel="stylesheet"/>
    

    <!-- jQuery CDN 방식으로 포함하기 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- slick js FILE -->
    <script src="js/slick.min.js"></script>
    <!-- script -->
    <script src="js/script.js"></script>
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

        // 주민등록번호 유효성 검사 (숫자와 '-'로만 이루어져 있는지)
        var age = document.getElementById("user_age").value;
        var ageRegex = /^\d{6}-\d{7}$/;
        if (!ageRegex.test(age)) {
            alert("주민등록번호는 '000000-0000000' 형식으로 입력해야 합니다.");
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

    <div class="container">
        <div class="inner">
            <div class="join">
                <h1>회원가입</h1>
                    <c:if test="${param.msg == 0}">
       					 <p style="color: red;">이미 아이디가 존재하고 있습니다.</p>
   					 </c:if>
                <form action="join_pro.jsp" method="post" onsubmit="return validateForm()">
                <ul>
                    <li>
                        <input type="text" name="user_name" id="user_name" placeholder="이름">
                    </li>
                    <li>
                        <input type="text"  name="user_id" placeholder="아이디" id="user_id">
                      
                    </li>
                    <li><input type="password" name="user_pw" placeholder="비밀번호" id="user_pw"></li>
                    <li><input type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호확인"></li>
                    <li><input type="text" name="user_age" id="user_age1" placeholder="주민등록번호">-<input type="text" name="user_age2" id="user_age" placeholder="주민등록번호"></li>
                    <li><input type="text"  name="user_pno" id="user_pno" placeholder="연락처"></li>
                    <li><input type="text" name="user_address" id="user_address" placeholder="주소"></li>
                    <li><a href="<%=request.getContextPath() %>/user/join_pro.jsp" class="join_btn"><button>회원가입</button></a></li>
                    <li class="log_area"><span>계정이 있으십니까?</span><a href="<%=request.getContextPath() %>/user/login.jsp" class="log_btn">로그인</a></li>
                </ul>
                    </form>
            </div>
        </div>
    </div>





 <!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>

</html>