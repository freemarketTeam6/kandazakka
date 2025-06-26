package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// エラー文を管理する変数宣言
		String error = "";
		String cmd = "";

		try {
			// 文字エンコーディングの指定
			request.setCharacterEncoding("UTF-8");

			HttpSession session = request.getSession();
			session.invalidate();

			request.getRequestDispatcher("/list").forward(request, response);
		} catch (Exception e) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			cmd = "top";
			request.setAttribute("error", error);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}

	}
}
