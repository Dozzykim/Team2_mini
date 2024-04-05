<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <jsp:include page="/layout/header.jsp" />
    <!-- jQuery CDN 방식으로 포함하기 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- slick js FILE -->
    <script src="js/slick.min.js"></script>
    <!-- script -->
    <script src="js/script.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 선택</title>
    <!-- slick css FILE -->
    <jsp:include page="/layout/link_login_sub.jsp" />
</head>

<!-- 컨테이너 영역 -->

<div class="container">
    <div class="inner">
        <ul>
            <li><a href="<%= request.getContextPath() %>/user/login.jsp"><span class="user">회원용<br>로그인</span></a></li>
            <li><span class="admin">관리자용<br>로그인</span></li>
        </ul>
    </div>
</div>


<!-- 푸터 -->
<jsp:include page="/layout/footer.jsp"></jsp:include>
<jsp:include page="/layout/script.jsp"></jsp:include>
</body>

</html>
