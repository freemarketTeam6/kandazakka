package servlet;

import java.io.IOException;

import bean.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 文字エンコーディングの指定
		request.setCharacterEncoding("UTF-8");
		
		String error = "";
		String cmd = "";
		
		// DTOオブジェクト宣言
		User user = new User();
		
	try {	
		// パラメータの取得
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		// UserDAOをインスタンス化し、関連メソッドを呼び出す。
		UserDAO objDao = new UserDAO();
		user =objDao.selectByUser(userid,password);
		
		HttpSession session=request.getSession();
		session.setAttribute("user",user);
		
		if(user.getUserid()==null){
			request.setAttribute("message","入力データが間違っています");
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
		}else {
			//ユーザー用クッキーの生成
 			Cookie useridCookie = new Cookie("userid", userid);
 			useridCookie.setMaxAge(60 * 60 * 24 * 5);
 			response.addCookie(useridCookie);
 
 			//パスワード用クッキーの生成
 			Cookie passwordCookie = new Cookie("password", password);
 			passwordCookie.setMaxAge(60 * 60 * 24 * 5);
 			response.addCookie(passwordCookie);
		}
	}catch(IllegalStateException e) {
		cmd = "logout";
		error = "DB接続エラーの為、一覧表示を行えませんでした。";
	}finally {
		if (error.equals("")) {
			// 登録された件数を持ってmenu.jspにフォワード
			request.getRequestDispatcher("/view/menu.jsp").forward(request, response);
		}else {
			request.setAttribute("cmd", cmd);
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
	}
}
