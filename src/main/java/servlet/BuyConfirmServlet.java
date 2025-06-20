package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Goods;
import bean.Order;
import bean.User;
import dao.GoodsDAO;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/buyConfirm")
public class BuyConfirmServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cmd = "";
		String error = "";

		// DAOオブジェクト宣言
		GoodsDAO objDao = new GoodsDAO();
		OrderDAO objOrderDao=new OrderDAO();
		ArrayList<Goods> goods_list = new ArrayList<>();
		
		try {
			// 文字エンコーディングの指定
			request.setCharacterEncoding("UTF-8");

			// セッションからGoodsオブジェクトを取得してセッション切れの判定
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if (user == null) {
				cmd = "logout";
				error = "セッション切れの為、購入は出来ません。";
				return;
			}

			// セッションから"order_list"を取得する。
			ArrayList<Order> order_list = (ArrayList<Order>) session.getAttribute("order_list");
			if (order_list == null||order_list.size()==0) {
				cmd = "top";
				error = "カートの中に何も無かったので購入は出来ません。";
				return;
			}

			//合計
			String buyList="";
			int total=0;
			
			//goodsinfoからカートデータ分だけ商品情報を呼び出す
			for (Order order : order_list) {
				Goods goods = objDao.selectGoodsByGoodsID(order.getGoodsId());
				//DBのorderinfoに注文情報を登録
				objOrderDao.insert(order);
				//取得したデータをlistに追加
				goods_list.add(goods);
			
				request.setAttribute("goods_List",goods_list);
				request.setAttribute("total",total);
			
				//オーダー情報クリア
				session.setAttribute("order_list", null);
				
			}	

		}catch (IllegalStateException e) {
			cmd = "menu";
			error = "DB接続エラーの為、購入はできません。";
		} finally {
			if (error.equals("")) {
				// 登録された件数を持ってbuyConrirm.jspにフォワード
				request.getRequestDispatcher("/view/buyConfirm.jsp").forward(request, response);
			} else {
				request.setAttribute("cmd", cmd);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
		
	}
}


