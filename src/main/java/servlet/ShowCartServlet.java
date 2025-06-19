package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Goods;
import bean.User;
import dao.GoodsDAO;
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
		try {
			String delno = request.getParameter("delno");

			HttpSession session = request.getSession();
			// ログインしていなかったらエラー
			user = (User) session.getAttribute("user");
			if (user == null) {
				error = "セッション切れの為、カート状況は確認できません。";
				cmd = "logout";
				return;
			}

			// セッションからカートを取得
			ArrayList<Order> orderList = (ArrayList<Order>) session.getAttribute("orderList");
			// もし削除対象のデータが送られていればカートから削除
			if (delno != null) {
				orderList.remove(Integer.parseInt(delno));
			}

			GoodsDAO GoodsDao = new GoodsDAO();
			ArrayList<Goods> goodsList = new ArrayList<>();
			if (goodsList != null) {
				// goodsinfoからorderList(カートデータ)分だけグッズ情報を呼び出す。
				for (int i = 0; i < orderList.size(); i++) {
					Goods goods = GoodsDao.selectByGoods(orderList.get(i).getGoodsId());
					// 取得したデータをgoodsListに追加
					goodsList.add(goods);
					total += goods.getPrice();
				}
			}
			// リクエストスコープに登録
			request.setAttribute("goodsList", goodsList);
			request.setAttribute("total", total);
		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、カート状況は確認できません。";
			cmd = "logout";
		} finally {
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
