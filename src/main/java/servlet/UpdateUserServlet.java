package servlet;

import java.io.IOException;

import bean.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String error = "";
		String message = "";
		User updateUser = new User();
		try {

			request.setCharacterEncoding("UTF-8");

			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			UserDAO userDao = new UserDAO();

			if (user == null) {
				error = "セッション切れの為、パスワード変更は行えません。 ";
				request.setAttribute("cmd", "logout");
				return;

			}

			String nowUserid = user.getUserid();
			String name = request.getParameter("name");
			String name_kana = request.getParameter("name_kana");
			String nickname = request.getParameter("nickname");
			String userID = request.getParameter("userid");
			String mail = request.getParameter("email");
			String oldPass = request.getParameter("oldpass");
			String password = request.getParameter("pass");
			String passwordCheck = request.getParameter("checkpass");
			String address = request.getParameter("address");
			String memo = request.getParameter("memo");
			String tell = request.getParameter("tell");
			
		
			updateUser.setAddress(address);
			updateUser.setName(name);
			updateUser.setEmail(mail);
			updateUser.setPassword(password);
			updateUser.setMemo(memo);
			updateUser.setUserid(userID);
			updateUser.setNamekana(name_kana);
			updateUser.setNickname(nickname);
			updateUser.setTell(tell);
			

			
			if (name.equals("")) {
				message = "名前を入力してください";

				return;
			}

			//パラメータを受け取って、ユーザー名（フリガナ）の空欄処理

			if (name_kana.equals("")) {
				message = "名前（カナ）を入力してください";

				return;
			} 

			//パラメータを受け取って、ニックネームの空欄処理

			if (nickname.equals("")) {
				message = "ニックネームを入力してください。";

				return;
			} 

			/*
			 * パラメータを受け取って、ユーザーIDに関するエラー処理
			 * 空欄判定と、重複判定
			 */

			if (userID.equals("")) {
				message = "ユーザーIDを入力してください。";

				return;
			}

			if (userDao.selectByUser(userID).getUserid() != null) {
				message = "このユーザーIDはすでに使われています！";
				updateUser.setUserid("");
				return;
			}
			if (tell.equals("")) {
				message = "電話番号を入力してください。";

				return;
			}

			/*
			 * パラメータを受け取って、メールアドレスの空欄処理
			 * 正規表現を追加予定 6/20
			 */

			if (address.equals("")) {
				message = "住所を入力してください";

				return;
			}

			if (!user.getPassword().equals(oldPass)) {
				message = "現在のパスワードが間違っています";
				return;
			}

			if (password.equals("")) {
				message = "パスワードを入力してください";
				return;

			} else if (passwordCheck.equals("")) {
				message = "パスワード（確認用）を入力してください";
				return;

			} else if (!password.equals(passwordCheck)) {
				message = "パスワードとパスワード（確認用）が一致しません";
				return;

			}
			
			userDao.update(updateUser,nowUserid);
			updateUser=userDao.selectByUser(userID);
			session.setAttribute("user",updateUser);
			

		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、パスワード変更は行えません。 ";
			request.setAttribute("cmd", "logout");

		} catch (Exception e) {
			error = "予期せぬエラーが発生しました。<br>" + e;
			request.setAttribute("cmd", "logout");

		} finally {
			if (error.equals("") && message.equals("")) {
				request.setAttribute("user", updateUser);
				request.getRequestDispatcher("/view/updateUserConfirm.jsp").forward(request, response);

			} else if(!error.equals("")) {
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}else {
				request.setAttribute("message", message);
				request.setAttribute("user", updateUser);
				request.getRequestDispatcher("/view/updateUser.jsp").forward(request, response);
			}
		}

	}
}
