package hospital.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import hospital.DTO.Comment;
import hospital.Service.CmmtService;
import hospital.Service.CmmtServiceImpl;

/**
 * Servlet implementation class CmmtServlet
 */
@WebServlet("/board/cmmtController")
public class CmmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CmmtService cmmtService;

	public CmmtServlet() {
		super();
		cmmtService = new CmmtServiceImpl();
	}

	// 댓글 조회
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 파라미터로 받은 게시글 번호
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		// 넘겨받은 게시글번호에 맞는 게시글의 댓글을 조회
		List<Comment> cmmtList = cmmtService.list(boardNo);

		// 조회된 댓글을 json 형태로 변환하여 클라이언트에게 반환
		Gson gson = new Gson();
		String json = gson.toJson(cmmtList);

		// JSON 형태의 데이터를 응답으로 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	// 댓글 입력
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// read.jsp 로부터 받은 파라미터
		String loginId = request.getParameter("loginId");
		int no = Integer.parseInt(request.getParameter("boardNo"));
		String cmmt = request.getParameter("comment");

		System.out.println("글번호: " + no);
		System.out.println("아이디: " + loginId);
		System.out.println("댓글: " + cmmt);

		Comment comment = new Comment();
		comment.setB_no(no);
		comment.setUser_id(loginId);
		comment.setContent(cmmt);

		int result = cmmtService.insert(comment);

		if (result > 0) {
			System.out.println("댓글 저장 성공");
			response.getWriter().print(result);
		} else {
			System.out.println("댓글 저장 실패");
		}
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	// 댓글 삭제
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("cmmtNo"));
		System.out.println("삭제요청 댓글번호: " + no);

		int result = cmmtService.delete(no);

		if (result > 0) {
			System.out.println("댓글 삭제 성공");
			response.getWriter().print(result);
		} else {
			System.out.println("댓글 삭제 실패");
		}

	}

}
