package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Goods;
import bean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/showCart")
public class ShowCartServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		String cmd = "";
		User user = null;
		int total = 0;
		boolean login = true;
		// 商品リスト用のArrayListを作成
		ArrayList<Goods> GoodsListInCart = new ArrayList<Goods>();

		try {
			// 削除対象の商品番号を取得
			String delno = request.getParameter("delno");

			HttpSession session = request.getSession();
			// ログインしていなかったらログインページに飛ばす
			user = (User) session.getAttribute("user");
			if (user == null) {
				login = false;
				request.getRequestDispatcher("/view/userLogin.jsp").forward(request, response);
				return;
			}

			// セッションからカートを取得
			ArrayList<Goods> orderList = (ArrayList<Goods>) session.getAttribute("orderList");
			// もし削除対象のデータが送られていればカートから削除
			if (delno != null) {
				orderList.remove(Integer.parseInt(delno));
			}

			if (orderList != null) {

				for (int i = 0; i < orderList.size(); i++) {
					Goods goods = orderList.get(i);
					GoodsListInCart.add(goods);
				}

			}

			// リクエストスコープに登録
			session.setAttribute("orderList", GoodsListInCart);

		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、カート状況は確認できません。";
			cmd = "logout";
		} finally {
			if (login == true) {
				if (error.equals("")) {
					request.getRequestDispatcher("/view/showCart.jsp").forward(request, response);
				} else {
					// エラーなら
					request.setAttribute("cmd", cmd);
					request.setAttribute("error", error);
					request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				}
			}
		}
	}
}
