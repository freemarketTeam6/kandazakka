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

/**
 * 
 */
@WebServlet("/sellerList")
public class SellerListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//エラー変数
		String error = "";
		String cmd = "";
		
		try {
			UserDAO userDao = new UserDAO();
			ArrayList<User> sellerList = userDao.selectBySelluser();
			
			// 取得した出品者一覧をリクエストスコープに登録
			request.setAttribute("sellerList", sellerList);
			
		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、商品情報変更は行えませんでした。";
			cmd = "logout";
		} finally {
			if (error.equals("")) {
				request.getRequestDispatcher("/view/sellerList.jsp").forward(request, response);
			} else {
				request.setAttribute("cmd", cmd);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}

	}

}
