package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Inquiries;
import bean.User;
import dao.InquiriesDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/inquiryList")
public class InquiryListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String error = "";

		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			//DAOクラスのオブジェクト
			InquiriesDAO inquiriesDao = new InquiriesDAO();

			//一覧表示のメソッド
			ArrayList<Inquiries> UserInquiriesList = inquiriesDao.selectUser(user.getUserid());

			//お問い合わせの一覧(InqueriesList)を持って画面にフォワード
			request.setAttribute("InquiriesList", UserInquiriesList);
			request.getRequestDispatcher("/view/inquiryList.jsp").forward(request, response);
			
		} catch (IllegalStateException e) {
			
			error = "DB接続エラーの為、お問い合わせ一覧の表示は行えませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/Error.jsp").forward(request, response);
		}
	}
}
