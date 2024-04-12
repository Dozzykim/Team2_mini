package hospital.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import hospital.DTO.Comment;
import hospital.Service.CmmtService;
import hospital.Service.CmmtServiceImpl;

/**
 * Servlet implementation class listCmmtServlet
 */
@WebServlet("/board/listCmmt")
public class listCmmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CmmtService cmmtService;

	public listCmmtServlet() {
		super();
		cmmtService = new CmmtServiceImpl();
	}

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
}
