package servlet;

import java.io.IOException;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/shipping")
public class ShippingServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//GoodsDAOのオブジェクト化
		GoodsDAO objGoodsDAO = new GoodsDAO();
		
		//商品IDの情報だけもらう
		int goodsid = Integer.parseInt(request.getParameter("goodsid"));
		
		//cmdの値を取得
		String cmd = request.getParameter("cmd");
		
		//受け取ったパラメータをもとに、DBから商品の情報を取得
		Goods goods = objGoodsDAO.selectGoodsByGoodsID(goodsid);
		
		/*
		 * cmdの値によって処理内容を変える
		 * cmd = detail → shipping.jspへ
		 * cmd = shipping → shippingConfirm.jspへ
		 */
		
		if ( cmd.equals("detail")) {	//マイページ → 出品商品一覧 → 発送するボタンを押したときに遷移
			
			//商品情報をリクエストスコープに登録
			request.setAttribute("goods", goods);
			
			//発送しますか？画面に遷移
			request.getRequestDispatcher("/view/shipping.jsp").forward(request, response);
			
		}else if( cmd.equals("shipping")) {	//マイページ → 出品商品一覧 → shipping.jspで発送ボタンを押したときに遷移
			
			//商品のステータスを2(入金済み)から3（発送済み）へ変更
			goods.setStatus("3");
			
			//DBのステータスを変える
			objGoodsDAO.updateStatus(goodsid, "3");
			
			//商品情報をリクエストスコープに登録
			request.setAttribute("goods", goods);
			
			//発送完了画面に遷移
			request.getRequestDispatcher("/view/shippingConfirm.jsp").forward(request, response);
			
		}
		
	}
}
