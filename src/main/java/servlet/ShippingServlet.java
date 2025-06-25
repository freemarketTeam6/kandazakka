package servlet;

import java.io.IOException;

import bean.Goods;
import bean.User;
import dao.GoodsDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.SendMailKanda;

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
			String buyUserid = goods.getBuyuserId();
			UserDAO userDao = new UserDAO();
			User buyUser = userDao.selectByUser(buyUserid);
			String subject = "【神田雑貨店】商品発送のお知らせ";
			String body = "\n" + buyUser.getNickname() + "様のご入金を確認いたしました。\n"
					+ "	以下の商品の発送を行いましたので、ご連絡致します。\n"
					+ "\n商品名" + goods.getGoodsName() + "\t価格" + goods.getPrice() + "円"
					+ "またのご利用よろしくお願いします。";

			SendMailKanda mail = new SendMailKanda();
			mail.shippingMail(subject, body, buyUser.getEmail());
			
			//発送完了画面に遷移
			request.getRequestDispatcher("/view/shippingConfirm.jsp").forward(request, response);
			
		}
		
	}
}
