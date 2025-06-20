package servlet;

import java.io.IOException;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PaymentServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//マイページの購入品一覧の「入金」ボタンから遷移
		//商品IDの情報だけもらう
		int goodsid = (int)request.getAttribute("goodsid");
		
		//GoodsDAOのオブジェクト化
		GoodsDAO goodsDaoObj = new GoodsDAO();
		
		Goods goods = goodsDaoObj.selectGoodsByGoodsId(goodsid);
		
		//商品のステータスを1(入金前)から2(入金済み)へ変更
		goods.setStatus(2);
		
		
	}
}
