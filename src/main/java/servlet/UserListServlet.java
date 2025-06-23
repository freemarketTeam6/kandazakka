package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userList")
public class UserListServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		String cmd = "";

		try {
			// 表示するユーザー情報を格納するUser型のArrayListを生成
			ArrayList<User> userList = new ArrayList<User>();

			// UserDAOクラスのオブジェクトを生成
			UserDAO userDao = new UserDAO();// Userクラスのオブジェクトを生成
			User user = new User();

			// 画面からパラメータを取得
			String delno = request.getParameter("delno");
			// もし削除対象のデータが送られていればリストから削除
			if (delno != null) {
				userList.remove(Integer.parseInt(delno));
			}

			// 画面からパラメータを取得
			String user_id = request.getParameter("user_id");
			// もしユーザーIDが送られていれば対象者のみを表示
			if (user_id != null) {
				
				userList.add(userDao.selectByUser(user_id));
				// 取得したユーザー情報をリクエストスコープに登録
				request.setAttribute("userList", userList);
				
			}else {
				
				// ユーザー情報を取得
				userList = userDao.selectUserAll();

				// セッションからデータを受け取る
				HttpSession session = request.getSession();
				user = (User) session.getAttribute("user");

				// エラー処理
				if (user == null) {
					error = "セッション切れのため、ユーザー一覧画面は表示できませんでした。";
					cmd = "top";
				}

				// 取得したユーザー情報をリクエストスコープに登録
				request.setAttribute("userList", userList);
				
			}

			// エラー処理
		} catch (IllegalStateException e) {
			error = "DB接続エラーのため、ユーザー一覧画面は表示できませんでした。";
			cmd = "logout";
		} finally {
			// エラーがなければ「userList.jsp」へフォワード
			if (error.equals("")) {
				request.getRequestDispatcher("/view/userList.jsp").forward(request, response);
			} else {
				// エラーがあればエラー文とcmdをリクエストスコープに登録し、「error.jsp」へフォワード
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/UserError.jsp").forward(request, response);
			}

		}
	}
}
