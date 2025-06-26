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
		User returnUser = new User();
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

			returnUser.setAddress(address);
			returnUser.setName(name);
			returnUser.setEmail(mail);
			returnUser.setPassword(password);
			returnUser.setMemo(memo);
			returnUser.setUserid(userID);
			returnUser.setNamekana(name_kana);
			returnUser.setNickname(nickname);
			returnUser.setTell(tell);

			if (name == null || name.equals("")) {

				name = user.getName();
			}

			if (name_kana == null || name_kana.equals("")) {

				name_kana = user.getNamekana();
			}

			if (nickname == null || nickname.equals("")) {

				nickname = user.getNickname();
			}

			if (userID == null || userID.equals("")) {
				userID = user.getUserid();

			}

			if (mail == null || mail.equals("")) {
				mail = user.getEmail();
			}

			if (oldPass == null || oldPass.equals("")) {
				message = "現在のパスワードを入力してください";
				return;
			}

			if (password == null || password.equals("")) {
				password = oldPass;
			}

			if (passwordCheck == null || passwordCheck.equals("")) {
				passwordCheck = null;
			}

			if (address == null || address.equals("")) {
				address = user.getAddress();
			}

			if (memo == null || memo.equals("")) {
				memo = user.getMemo();
			}

			if (tell == null || tell.equals("")) {
				tell = user.getTell();
			}

			updateUser.setAddress(address);
			updateUser.setName(name);
			updateUser.setEmail(mail);
			updateUser.setPassword(password);
			updateUser.setMemo(memo);
			updateUser.setUserid(userID);
			updateUser.setNamekana(name_kana);
			updateUser.setNickname(nickname);
			updateUser.setTell(tell);

			if (!nowUserid.equals(userID)) {

				if (userDao.selectByUser(userID).getUserid() != null) {
					message = "このユーザーIDはすでに使われています！";
					updateUser.setUserid("");
					return;
				}
			}

			if (!user.getPassword().equals(oldPass)) {
				message = "現在のパスワードが間違っています";
				return;
			}

			if (!password.equals(passwordCheck) && passwordCheck != null) {
				message = "パスワードとパスワード（確認用）が一致しません";
				return;

			}

			userDao.update(updateUser, nowUserid);
			updateUser = userDao.selectByUser(userID);
			session.setAttribute("user", updateUser);

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

			} else if (!error.equals("")) {
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			} else {
				request.setAttribute("message", message);
				request.setAttribute("user", returnUser);
				request.getRequestDispatcher("/view/updateUser.jsp").forward(request, response);
			}
		}

	}
}
