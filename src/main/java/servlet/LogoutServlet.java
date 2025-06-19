package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			// 文字エンコーディングの指定
			request.setCharacterEncoding("UTF-8");

			HttpSession session = request.getSession();
			session.invalidate();
			
			request.getRequestDispatcher("/view/top.jsp").forward(request, response);
	}
}

