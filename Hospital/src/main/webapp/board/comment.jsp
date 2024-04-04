<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <h1>댓글 목록</h1>
	<h3>${sessionScope.loginId} 님 환영합니다!</h3>
    <ul id="commentList">
        <!-- 여기에 댓글 목록이 나열될 것입니다. -->
    </ul>

    <h2>댓글 작성</h2>
    <form id="commentForm">
        <input type="text" id="commentText" placeholder="댓글을 입력하세요">
        <input type="submit" value="작성">
    </form>

    <script>
        $(document).ready(function() {
            // 페이지 로드 시 댓글 목록을 가져옴
            loadComments();

            // 댓글 작성 폼이 제출될 때
            $("#commentForm").submit(function(event) {
                // 폼 제출 이벤트를 막음
                event.preventDefault();

                // 입력된 댓글 내용을 가져옴
                var commentText = $("#commentText").val();

                // Ajax를 사용하여 서버에 댓글을 전송
                $.ajax({
                    type: "POST",
                    url: "addComment.jsp", // 댓글을 추가하는 서버 측 JSP 파일 경로
                    data: { comment: commentText }, // 댓글 내용을 데이터로 전송
                    success: function() {
                        // 댓글이 성공적으로 추가된 후 댓글 목록을 다시 로드함
                        loadComments();
                        // 댓글 입력 필드를 초기화
                        $("#commentText").val("");
                    }
                });
            });
        });

        // 댓글 목록을 가져오는 함수
        function loadComments() {
            $.get("getComments.jsp", function(data) { // 댓글을 가져오는 서버 측 JSP 파일 경로
                // 서버에서 받은 HTML을 댓글 목록 영역에 삽입
                $("#commentList").html(data);
            });
        }
    </script>
</body>
</html>
