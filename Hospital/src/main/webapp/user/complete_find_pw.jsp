<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 완료</title>
    
    <!-- css  -->
    <jsp:include page="../layout/link.jsp" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/complete_find_pw.css">
    
    <!-- js -->
    <jsp:include page="../layout/script.jsp" />
	
</head>
		
<body>
    <!-- 헤더 -->
    <jsp:include page="../layout/header.jsp" />

    <div class="container">
        <h1>비밀번호 찾기 완료</h1>
        <p><%= request.getAttribute("user_pw") %></p>
        <div class="button-container">
            <button onclick="moveToLoginPage()">로그인 페이지로 이동</button>
        </div>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>
    
    <script >
        function moveToLoginPage() {
            var root = "<%= request.getContextPath() %>";
            window.location.href = root + "/user/login.jsp";
        }
    </script>
</body>

</html>
