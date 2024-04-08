package hospital.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.Service.UserService;
import hospital.Service.UserServiceImpl;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet("/user/id_check")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService userService;
       
    public CheckIdServlet() {
        super();
        userService = new UserServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("user_id");
		boolean result = userService.idCheck(id);
		
		System.out.println("id : " + id);
		
		PrintWriter writer = response.getWriter();
		writer.print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
