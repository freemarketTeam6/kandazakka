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

@WebServlet("/insertCart")
public class InsertCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String error = "";
		String cmd = "";
		User user = null;
		try {
			HttpSession session = request.getSession();
			// ログインしていなかったらエラー
			user = (User) session.getAttribute("user");
			if (user == null) {
				error = "セッション切れの為、カートに追加できません。";
				return;
			}

			// goodsIdを取得
			String strgoodsId = request.getParameter("goodsId");
			int goodsId=Integer.parseInt(strgoodsId);
			GoodsDAO goodsDao = new GoodsDAO();
			// 一件検索メソッド
			 Goods goods = goodsDao.selectGoodsByGoodsID(goodsId);

			// 注文情報を格納
			goods.setGoodsId(goodsId);
			goods.setSelluserId(goods.getSelluserId());
			goods.setImgPath(goods.getImgPath());
			goods.setGoodsName(goods.getGoodsName());
			goods.setPrice(goods.getPrice());
			goods.setQuantity(1);

			// セッションからlist配列を取得
			ArrayList<Goods> orderList = (ArrayList<Goods>) session.getAttribute("orderList");
			if (orderList == null) {
				orderList = new ArrayList<Goods>();
			}
			// orderListに加える
			orderList.add(goods);

			request.setAttribute("Goods", goods);
			// カートをセッション保存
			session.setAttribute("orderList", orderList);
		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、カートに追加はできません。";
			cmd="logout";
		} finally {
			if (error.equals("")) {
				request.getRequestDispatcher("/showCart").forward(request, response);
			} else {
				request.setAttribute("cmd", cmd);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}

	}

}
