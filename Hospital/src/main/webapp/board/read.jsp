<%@page import="hospital.DTO.Comment"%>
<%@page import="java.util.List"%>
<%@page import="hospital.Service.CmmtServiceImpl"%>
<%@page import="hospital.Service.CmmtService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hospital.DTO.Board"%>
<%@page import="hospital.Service.BoardServiceImpl"%>
<%@page import="hospital.Service.BoardService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 조회</title>

<!-- css -->
<jsp:include page="../layout/link.jsp" />
<link rel="stylesheet" href="../static/css/read.css">

<!-- js -->
<jsp:include page="../layout/script.jsp" />
</head>

<body>

	<%
	int no = Integer.parseInt(request.getParameter("no"));

	// 게시글 세팅
	BoardService boardService = new BoardServiceImpl();
	Board board = boardService.select(no);
	String writer = board.getUser_id();
	String loginId = (String) session.getAttribute("loginId");

	// 해당 게시글의 댓글 세팅
	CmmtService cmmtService = new CmmtServiceImpl();
	List<Comment> cmmtList = cmmtService.list(no);

	// 등록일자/수정일자를 yyyy-mm-dd형식으로 출력도와주는 클래스 생성
	SimpleDateFormat boardDate = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat cmmtDate = new SimpleDateFormat("MM/dd HH:mm");
	%>

	<!-- 헤더 -->
	<jsp:include page="../layout/header.jsp" />

	<!-- 플로팅 -->
	<jsp:include page="/layout/floating.jsp"></jsp:include>

	<div class="container">
		<h1>
			<img src="../static/img/board.png" alt="">커뮤니티 게시판
		</h1>
		<p>자신만의 건강 고민과 팁을 사람들과 공유해 보세요!</p>
		<div class="table-wrapper">

			<table id="board_table" border="1">
				<thead>
					<tr>
						<th><%=board.getNo()%>.</th>
						<th>[<%=board.getCategory()%>] <%=board.getTitle()%></th>
						<th><%=board.getUser_id()%></th>
						<th><%=boardDate.format(board.getReg_date())%></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4"><textarea id="content" readonly><%=board.getContent()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="insert">
				<div class="left_area">
					<c:if test="<%=writer.equals(loginId)%>">
						<button onclick="moveToUpdate()">수정</button>
						<button onclick="doubleCheck()">삭제</button>
					</c:if>
					<button onclick="moveToList()">목록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 댓글작성 -->
	<div class="cont_tb2">
		<ul>
			<li class="head">
				<p>댓글</p>
				<form>
					<!-- 비로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId == null }">
						<div class="input-wrapper">
							<input type="hidden" id="boardNo" name="boardNo" value="<%=no%>" />
							<input type="text" id="noneLoginCmmt" value="댓글을 작성하려면 로그인 해주세요" readonly />
						</div>
					</c:if>

					<!-- 로그인 시에만 보임 -->
					<c:if test="${sessionScope.loginId != null }">
						<div class="input-wrapper">
							<input type="hidden" id="boardNo" name="boardNo" value="<%=no%>" />
							<input type="hidden" id="loginid" name="loginId" value="<%=loginId%>" />
							<input type="text" id="cBox" placeholder="댓글을 입력해주세요." />
							<input type="text" id="cmmt" name="cmmt" style="display: none;"	placeholder="부적절한 댓글은 관리자에 의해 무통보 삭제 될 수 있습니다." />
							<input id="insertCmmt" onclick="insertComment()" disabled value="작성" />
						</div>
					</c:if>
				</form>
			</li>
		</ul>

		<!-- 댓글리스트 -->
		<%
		// 무플 시,
		if (cmmtList == null || cmmtList.size() == 0) {
		%>
		<!-- 아무정보도 표시되지 않음 -->
		<%
		// 댓글 존재 시,
		} else {
		%>
		<div class="cbox_Container"></div>
			<table id="Cmmt_area">
				<thead>
					<tr>
						<th>아이디</th>
						<th>댓글</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<!-- 1댓글 1tr 가짐 -->				
				</tbody>
			</table>
		</div>
		<%
		}
		%>
		
	<!-- 푸터 -->
	<jsp:include page="../layout/footer.jsp" />

	<!-- 스크립트 -->
	<%String root = request.getContextPath();%>
	<c:set var="root" value="<%=root%>" />
	<script type="text/javascript">		
	// 자바 - EL(표현언어)를 자바스크립트로 가져오는 방법
    const root = "${ root }"
    
		// 선택받기
	    function doubleCheck() {
	        var choice = confirm("정말로 삭제하시겠습니까?");
	        
	        if (choice == true) {
	            window.location.href= root + "/board/delete.jsp?no=<%=board.getNo()%>";
	        }
	    }
		
		// 수정페이지로 이동
		function moveToUpdate() {
			window.location.href= root + "/board/update.jsp?no=<%=board.getNo()%>";
		}
		
		// 리스트로 이동
		function moveToList() {
			window.location.href= root + "/board/list.jsp";
		}
		
		// 비로그인상태로 댓글작성 시도 시, 로그인 요청 얼럿
		$('#noneLoginCmmt').on('click', function() {
			$('#insertCmmt')
			alert("로그인을 하신 후 이용해 주시기 바랍니다.")
			var loginConfirm = confirm("로그인 창으로 이동하시겠습니까?");
			
			if (loginConfirm) {
				window.location.href= root + '/login_sub.jsp';
				return;
			}
		});
		
		// 로그인 상태면, 댓글창 바뀜
		$('#cBox').on('click', function() {
			$('#cmmt').show().focus();
			/* $('#insertCmmt').show(); */
			$('#insertCmmt').attr("disabled", false);
			$('#cBox').hide();
		});
		
		$('#cmmt').on('blur', function() {
            if ($('#cmmt').val() === "") {
            	$('#cmmt').hide();
            	$('#insertCmmt').attr("disabled", true);
            	/* $('#insertCmmt').hide(); */
            	$('#cBox').show();
            }
        });


		// 댓글 입력 및 db에 저장
  		function insertComment() {
			
			if( $('#loginid').val() == null || $('#loginid').val() == "" ) {
                alert("로그인을 하신 후 이용해 주시기 바랍니다.")
                return
            }
			$.ajax({
				url: root + '/board/cmmtController',
				type: 'post',
				data: {
					boardNo : $('#boardNo').val(),
					loginId : $('#loginid').val(),
					comment : $('#cmmt').val()
				},
				success: function (result) {
					if(result > 0) {
						//댓글 재호출하는 함수
						listCmmt();
						$('#cmmt').val("");
					} else {
						alert('실패');
					}
				}
			})
		};
		
		
		//댓글 조회
		function listCmmt() {
			$.ajax({
				url: root + '/board/cmmtController?boardNo=' + <%=board.getNo()%>,
				//data: { boardNo : $('#boardNo').val() },
				type : 'get',
				success : function(list) {
					var result = "";
					
					for ( var i in list) {
						result += "<tr>"
								+ 	"<form>"
								+		'<input type="hidden" id="cmmtNo" value="'+ list[i].c_no +'" />'
								+		'<td id="cmmtId">' + list[i].user_id + "</td>"
								+		"<td>" + list[i].content + "</td>"
								+		"<td>" + '<button onclick="deleteCmmt()">삭제</button>' + "</td>"
								+   "</form>"
								+ "</tr>" ;
					}
					$("#Cmmt_area tbody").html(result);
				}
			})
		}
		
		$(document).ready(function() {
			listCmmt();
		})
		
		function deleteCmmt() {
			var loginId = $('#loginid').val();
			var cmmtId = document.getElementById("cmmtId").innerText;
			
			if (loginId !== cmmtId) {
				alert('본인이 작성한 댓글만 삭제 가능합니다.');
				return;
			}
			
			var choice = confirm("정말로 삭제하시겠습니까?");
			
			if (choice == false) {
				return;
	        }
			
			var cmmtNo = $('#cmmtNo').val();			
			
			$.ajax({
				url: root + '/board/cmmtController?cmmtNo=' + $('#cmmtNo').val(),
				type: 'delete',
// 				data: {cmmtNo : $('#cmmtNo').val()},
				success: function (result) {
					if(result > 0) {
						//댓글 재호출하는 함수
						listCmmt();
					}
				}
			})
		}
		
	</script>

</body>
</html>