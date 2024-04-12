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
        if (!nameRegex.test(name) || !name) {
            alert("이름은 한글로만 입력해야 합니다.");
            return false;
        }

        // 주민등록번호 유효성 검사
        var age1 = document.getElementById("user_age1").value; // 주민등록번호 앞자리
        var age2 = document.getElementById("user_age2").value; // 주민등록번호 뒷자리
        
        // 주민등록번호 앞자리 정규표현식
        var age1Regex = /^\d{6}$/;
        if (!age1Regex.test(age1)) {
            alert("주민등록번호 앞자리는 6자리의 숫자로 입력해야 합니다.");
            return false;
        }
        
        // 주민등록번호 뒷자리 정규표현식 
        var age2Regex = /^\d{7}$/;
        if (!age2Regex.test(age2)) {
            alert("주민등록번호 뒷자리는 7자리의 숫자로 입력해야 합니다.");
            return false;
        }
        
        // 주민등록번호 전체
        var age = age1.toString() + '-' + age2.toString();
        
        // 전화번호 유효성 검사 (숫자만 포함되어 있는지)
        var phone = document.getElementById("user_pno").value;
        var phoneRegex = /^[0-9]+$/;
        if (!phoneRegex.test(phone)) {
            alert("전화번호는 숫자로만 입력해야 합니다.");
            return false;
        }
        
        // 주소 유효성 검사(아무 값도 들어오지 않으면 경고창)
        var address = document.getElementById("user_address").value;
        if (address.trim() === "") {
        	// trim() : 문자열의 양 끝에서 공백을 제거한 새로운 문자열을 반환하는 함수
            alert('주소를 입력해주세요.');
            return false;
        }
        
        // 아이디 중복 확인 여부 체크
        var idChecked = document.getElementById("idChecked").value;
        if (idChecked !== "true") {
            alert("아이디 중복 확인을 해주세요.");
            return false;
        }
        return true; 
    }
    
    </script>

    <% String root = request.getContextPath(); %>
    <c:set var="root" value="<%= root %>" />
    <script type="text/javascript">

        // 자바 - EL(표현언어)를 자바스크립트로 가져오는 방법
        const root = "${ root }"
        
        function checkId() {
            var id = $('#user_id').val();
            
            if( id == null || id == "" ) {
                alert("아이디를 입력하세요!")
                return
            }
            
            $.ajax({
            	//url은 서블릿 주소를 가리킴
                url: root + '/user/id_check',
                type: 'post',
                data: {user_id: id},
                success: function(data) {
                    if (data === "true") {
                        // 중복된 아이디일 경우
                        $('.id_already').show();
                        $('.id_ok').hide();
                        document.getElementById("idChecked").value = "false";
                    } else {
                        // 중복되지 않은 아이디일 경우
                        $('.id_ok').show();
                        $('.id_already').hide();
                        document.getElementById("idChecked").value = "true";
                    }
                },
                error: function() {
                    alert("에러입니다.");
                }
            })
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
                    <p style="color: red;">회원가입에 실패하였습니다.</p>
                </c:if>
                <form action="join_pro.jsp" method="post" onsubmit="return validateForm()">
                <ul>
                    <li>
                        <input type="text" name="user_name" id="user_name" placeholder="이름">
                    </li>
                    <li>
                         <input type="text" name="user_id" placeholder="아이디" id="user_id"/>
                         <input type="button" id="emoverlay" onclick="checkId()" value="중복확인"/>
                         <input type="hidden" id="idChecked" value="false"/>
                    </li>
                    <p>
                         <span class="id_ok" style="color: green; display: none;">사용 가능한 아이디입니다.</span>                      
                         <span class="id_already" style="color: red; display: none;">중복된 아이디입니다.</span>                      
                    </p>
                    <li><input type="password" name="user_pw" placeholder="비밀번호" id="user_pw"></li>
                    <li><input type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호확인"></li>
                    <li>
                        <input type="text" name="user_age1" id="user_age1" placeholder="주민등록번호 앞자리" >
                        -  
                        <input type="text" name="user_age2" id="user_age2" placeholder="주민등록번호 뒷자리">
                    </li>
                    <li><input type="text"  name="user_pno" id="user_pno" placeholder="연락처"></li>
                    <li><input type="text" name="user_address" id="user_address" placeholder="주소"></li>
                    <li><a href="<%=request.getContextPath() %>/user/join_pro.jsp" class="join_btn"><button type="submit" >회원가입</button></a></li>
                    <li><p>계정이 있으십니까?</p><a
                    	 href="<%=request.getContextPath() %>/user/login.jsp">로그인</a></li>
                </ul>
                    </form>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>
    
</body>

</html>
