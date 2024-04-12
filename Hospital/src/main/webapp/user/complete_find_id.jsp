<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 완료</title>
    
    <!-- css  -->
    <jsp:include page="../layout/link.jsp" />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/complete_join.css">
    
    <!-- js -->
    <jsp:include page="../layout/script.jsp" />

	
</head>
		
<body>
    <!-- 헤더 -->
    <jsp:include page="../layout/header.jsp" />

    <div class="container">
        <h2>" 아이디 찾기 완료 "</h2>
        <p>찾은 아이디:</p>
        <ul>
            <% 
                List<String> userIds = (List<String>) request.getAttribute("user_id");
                if(userIds != null && !userIds.isEmpty()) {
                    for(String userId : userIds) {
            %>
                        <li><%= userId %></li>
            <% 
                    }
                } else {
            %>
                    <li>일치하는 아이디가 없습니다.</li>
            <% } %>
        </ul>
        <div class="button-container">
            <button onclick="moveTofindId()">로그인 페이지로 이동</button>
        </div>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>
    
    <script >
        function moveTofindId() {
            var root = "<%= request.getContextPath() %>";
            window.location.href = root + "/user/login.jsp";
        }
    </script>
</body>

</html>
