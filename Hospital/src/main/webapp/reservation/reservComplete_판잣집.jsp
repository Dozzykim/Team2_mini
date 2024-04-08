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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/static/css/complete_reserv.css">
    
    <!-- js -->
    <jsp:include page="../layout/script.jsp" />

</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />

    <div class="container">
        <h1>" 예약 완료 "</h1>
        <h3>예약이 완료되었습니다.</h3>
        <div class="button-container">
            <button onclick=moveToMain()>확인</button>
        </div>
    </div>
    

    <!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />
    
    <script >
	    <%
		String root = request.getContextPath();
		%>
	    function moveToMain() {
	    	window.location.href="<%=root%>/index.jsp";
		}
    </script>
</body>

</html>