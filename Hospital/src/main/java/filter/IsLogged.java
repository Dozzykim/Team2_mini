package filter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IsLogged extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); //false 입력하면 세션 없을 시, 새로 생성 안하고 null 반환
		String loginId = (session != null) ? (String)session.getAttribute("loginId") : null;
		
		String root = request.getContextPath();
		
		if (loginId != null) {
			System.out.println("로그인 한 상태입니다.");
			 request.getRequestDispatcher("insert.jsp").forward(request, response);
		} else {
			System.out.println("비로그인 상태입니다.");
		}
	}
	
}
