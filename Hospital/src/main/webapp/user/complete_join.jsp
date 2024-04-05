<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가입 완료</title>
    
    <!-- slick css FILE -->
    <link rel="stylesheet" href="../static/css/slick.css">
    <link rel="stylesheet" href="../static/css/slick-theme.css">

    <!-- css -->
    <link rel="stylesheet" href="../static/css/main.css">
    <link rel="stylesheet" href="../static/css/reset.css">
    <link rel="stylesheet" href="../static/css/complete_join.css">
    
    <!-- jQuery CDN 방식으로 포함하기 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- slick js FILE -->
    <script src="/static/js/slick.min.js"></script>
    <!-- script -->
    <script src="/static/js/script.js"></script>
    
</head>

<body>
    <header class="header" id="header">
        <div class="inner">
            <div class="header_top">
                <ul class="util">
                    <li><a href="<%= request.getContextPath() %>/user/login.jsp">로그인</a></li>
                    <li><a href="<%=request.getContextPath()%>/user/join.jsp">회원가입</a></li>
                    <li><a href="<%=request.getContextPath()%>/admin/login.jsp">어드민 로그인</a></li>
                </ul>
                <h1 class="main_name"><a href="#none">더조은 종합병원</a></h1>
            </div>
            <div class="header_bottom">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/board/list.jsp">소통 해요</a></li>
                    <li><a href="<%=request.getContextPath()%>/reservation/reserv.jsp">진료 예약</a></li>
                    <li><a href="#none">병원 소개</a></li>
                </ul>
            </div>
        </div>
    </header>

    <div class="container">
        <h1>" 회원가입 완료 "</h1>
        <h3>회원가입이 완료되었습니다.</h3>
        <div class="button-container">
            <button onclick=>확인</button>
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
</body>

</html>