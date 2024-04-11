package hospital.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.DTO.Comment;
import hospital.Service.CmmtService;
import hospital.Service.CmmtServiceImpl;
import hospital.Service.UserService;
import hospital.Service.UserServiceImpl;

/**
 * Servlet implementation class CmmtServlet
 */
@WebServlet("/board/submitCmmt")
public class CmmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CmmtService cmmtService;
	
	public CmmtServlet() {
		super();
		cmmtService = new CmmtServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
