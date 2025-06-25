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
import util.SendMail;

@WebServlet("/buyConfirm")
public class BuyConfirmServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cmd = "";
		String error = "";

		// DAOオブジェクト宣言
		GoodsDAO objDao = new GoodsDAO();
		
		try {
			// 文字エンコーディングの指定
			request.setCharacterEncoding("UTF-8");

			// セッションからGoodsオブジェクトを取得してセッション切れの判定
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			String userID = user.getUserid();
			if (user == null) {
				cmd = "logout";
				error = "セッション切れの為、購入は出来ません。";
				return;
			}

			// セッションから"order_list"を取得する。
			ArrayList<Goods> orderList = (ArrayList<Goods>)session.getAttribute("orderList");
			if (orderList == null||orderList.size()==0) {
				cmd = "top";
				error = "カートの中に何も無かったので購入は出来ません。";
				return;
			}

			//合計
			String buyList="";
			int total=0;
			
			//goodsinfoからカートデータ分だけ商品情報を呼び出す
			for ( int i = 0; i < orderList.size(); i++ ) {
				int goodsID = orderList.get(i).getGoodsId();
				objDao.updateStatus(goodsID, "1");
				objDao.updateBuyUserAndBuyDate(goodsID, userID);
				total += orderList.get(i).getPrice();
			}
				
				//メール件名
				String subject="【神田書店】ご購入誠にありがとうございます。";
				//メール本文
				String body=user.getUserid()+"様\n\n"
							+"ご購入ありがとうございます。\n"
							+"以下内容でご注文を受け付けましたので、ご連絡致します。\n\n"
							+buyList
							+"合計" 
							+ total 
							+ "円\n\n"
							+"またのご利用よろしくお願いします。";
				//メール送信
				SendMail mail = new SendMail();
				mail.send(subject, body, user.getEmail());
				
				request.setAttribute("goods_List",orderList);
				request.setAttribute("total",total);
			
				//オーダー情報クリア
				session.setAttribute("orderList", null);

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


