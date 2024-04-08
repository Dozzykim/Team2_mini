<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Simple Chat</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="chat-box">
        <!-- 채팅 메시지가 표시될 영역 -->
    </div>
    <input type="text" id="message" placeholder="메시지를 입력하세요">
    <button id="send-btn">전송</button>

    <script>
        $(document).ready(function(){
            // 메시지 전송 버튼 클릭 이벤트
            $('#send-btn').click(function(){
                var message = $('#message').val(); // 입력된 메시지 가져오기
                sendMessage(message); // sendMessage 함수 호출
                $('#message').val(''); // 입력 필드 비우기
            });

            // 엔터 키로도 메시지 전송할 수 있도록 설정
            $('#message').keypress(function(event){
                if(event.which == 13){ // 엔터 키 누르면
                    $('#send-btn').click(); // 전송 버튼 클릭 이벤트 발생
                }
            });

            // 채팅 메시지를 받아오는 함수
            function fetchMessages(){
                $.ajax({
                    url: 'fetchMessages.jsp',
                    method: 'GET',
                    success: function(response){
                        $('#chat-box').html(response); // 서버로부터 받은 메시지를 출력
                    }
                });
            }

            // 채팅 메시지 전송 함수
            function sendMessage(message){
                $.ajax({
                    url: 'sendMessage.jsp',
                    method: 'POST',
                    data: { message: message }, // 전송할 데이터
                    success: function(){
                        fetchMessages(); // 전송 후에는 채팅 메시지 갱신
                    }
                });
            }

            // 페이지 로드 후 초기 채팅 메시지 불러오기
            fetchMessages();
        });
    </script>
</body>
</html>
