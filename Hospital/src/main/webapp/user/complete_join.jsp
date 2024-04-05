<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가입 완료</title>
    
    <!-- css  -->
    <jsp:include page="../layout/link.jsp" />
    
    <!-- js -->
    <jsp:include page="../layout/script.jsp" />

</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />

    <div class="container">
        <h1>" 회원가입 완료 "</h1>
        <h3>회원가입이 완료되었습니다.</h3>
        <div class="button-container">
            <button onclick=moveToMain()>확인</button>
        </div>
    </div>
    
     
    

    <footer class="footer">
        <div class="inner3">
            <div class="info">
                <ul>
                    <li></li>
                    <li>영업 시간: 9:00 ~ 18: 00</li>
                    <li>찾아오시는 길 :  인천광역시 부평구 부평1동 534-48</li>
                    <li>전화번호 : 032 - 123 - 5678</li>
                    
                </ul>
            </div>
            <div class="joeun">
                <p>THE JOEUN HOSPITAL</p>
            </div>
            <div class="copy_r">
                <p>Copyright ⓒ The Joeun Hospital. All Rights Rerved</p>
            </div>
        </div>
    </footer>
    
    <script >
	    <%
		String root = request.getContextPath();
		%>
	    function moveToMain() {
	    	window.location.href="<%=root%>/user/login.jsp";
		}
    </script>
</body>

</html>