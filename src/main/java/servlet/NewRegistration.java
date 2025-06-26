package servlet;

import java.io.IOException;

import bean.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/newRegistration")
public class NewRegistration extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)

			throws IOException, ServletException {

		// Goods型オブジェクトの作成
		User user = new User();

		// GoodsDAOのインスタンス化
		UserDAO objUserDAO = new UserDAO();

		// エラー文を管理する変数宣言
		String error = "";
		String cmd = "";

		try {

			/*
			 * 入力内容のエラー処理 エラーが発生したら or 最後まで処理が完了したらWhile文抜ける
			 */
			while (true) {

				// パラメータを受け取って、ユーザー名の空欄処理
				String name = request.getParameter("name");

				if (name.equals("") || name.isBlank()) {
					error = "名前が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else {
					user.setName(name);
				}

				// パラメータを受け取って、ユーザー名（フリガナ）の空欄処理
				String name_kana = request.getParameter("name_kana");

				if (name_kana.equals("") || name_kana.isBlank()) {
					error = "名前（カナ）が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else {
					user.setNamekana(name_kana);
				}

				// パラメータを受け取って、ニックネームの空欄処理
				String nickname = request.getParameter("nickname");

				if (nickname.equals("") || nickname.isBlank()) {
					error = "ニックネームが未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else {
					user.setNickname(nickname);
				}

				// パラメータを受け取って、住所の空欄処理
				String address = request.getParameter("address");

				if (address.equals("") || address.isBlank()) {
					error = "住所が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else {
					user.setAddress(address);
				}

				/*
				 * パラメータを受け取って、電話番号の空欄処理 正規表現を追加予定 6/20
				 */
				String tell = request.getParameter("tell");

				if (tell.equals("") || tell.isBlank()) {
					error = "電話番号が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else {
					user.setTell(tell);
				}

				/*
				 * パラメータを受け取って、メールアドレスの空欄処理 正規表現を追加予定 6/20
				 */
				String email = request.getParameter("email");

				if (email.equals("") || email.isBlank()) {
					error = "ニックネームが未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else {
					user.setEmail(email);
				}

				/*
				 * パラメータを受け取って、ユーザーIDに関するエラー処理 空欄判定と、重複判定
				 */
				String userID = request.getParameter("userID");
				User checkUser = objUserDAO.selectByUser(userID);

				if (userID.equals("") || userID.isBlank()) {
					error = "ユーザーIDが未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else if (checkUser.getUserid() != null) {
					error = "このユーザーIDはすでに使われています！";
					request.setAttribute("error", error);
					break;
				} else {
					user.setUserid(userID);
				}

				// パラメータを受け取って、パスワードの空欄・一致判定処理
				String password = request.getParameter("password");
				String passwordConfirm = request.getParameter("passwordConfirm");

				if (password.equals("") || password.isBlank()) {
					error = "パスワードが未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else if (passwordConfirm.equals("") || passwordConfirm.isBlank()) {
					error = "パスワード（確認用）が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else if (!password.equals(passwordConfirm)) {
					error = "パスワードとパスワード（確認用）が一致しないため、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				} else {
					user.setPassword(password);
				}
				user.setAuthority("u");
				break;
			}

			if (error.equals("")) {
				// insertメソッドを呼び出し
				objUserDAO.insert(user);
				// ログイン画面にフォワード
				request.getRequestDispatcher("/view/userLogin.jsp").forward(request, response);
			} else {
				// エラーページ後の遷移先をTOPページに指定
				cmd = "newRegistration";
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				// error画面にフォワード
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);

			}

		} catch (Exception e) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			cmd="top";
			request.setAttribute("error", error);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}

	}

}
