package servlet;

import java.io.IOException;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		//マイページの購入品一覧の「入金」ボタンから遷移
		//商品IDの情報だけもらう
		int goodsid = (int)request.getAttribute("goodsid");
		
		//GoodsDAOのオブジェクト化
		GoodsDAO goodsDaoObj = new GoodsDAO();
		
		//商品のステータスを2(入金済み・発送待ち)に変更
		goodsDaoObj.updateStatus(goodsid, 2);
		
		//paymentConfirm.jspに送る用Goodsオブジェクト
		Goods goods = goodsDaoObj.selectGoodsByGoodsID(goodsid);
		
		//リクエストスコープでGoodsオブジェクトをpaymentConfirm.jspへ送る
		request.setAttribute("goods", goods);
		
		//paymentConfirm.jspへ遷移
		request.getRequestDispatcher("/view/paymentConfirm.jsp").forward(request, response);
		
		
		}catch (IllegalStateException e) {
			request.setAttribute("error", "DB接続エラーの為、購入できませんでした。");
			request.setAttribute("cmd", "mypage");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
		
	}
}
