package servlet;

import java.io.IOException;

import bean.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String error = "";
		String cmd = "";

		try {
			// 文字コード指定
			request.setCharacterEncoding("UTF-8");

			// 入力パラメータの取得
			String userid = request.getParameter("userid");
			
			// BookDAOをインスタンス化
			User user = new User();
			UserDAO userDao = new UserDAO();

			// 削除ボタンを押した時、削除対象の書籍があるか確認
			user = userDao.selectByUser(userid);
			if (user.getUserid() == null) {
				error = "naiyo";
				return;
			}
			// BookDAOオブジェクトでdeleteメソッドを呼び出している
			userDao.delete(userid);

		} catch (IllegalStateException e) {
			error = "aa";
			cmd = "logout";
		} finally {
			if (error.equals("")) {
				request.getRequestDispatcher("/userList").forward(request, response);
			} else {
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/adminError.jsp").forward(request, response);
			}
		}

	}

}
