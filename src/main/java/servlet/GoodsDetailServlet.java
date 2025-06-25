package servlet;

import java.io.IOException;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/goodsDetail")
public class GoodsDetailServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		String cmd = "";

		try {
			// 表示する商品情報を格納するGoodsオブジェクトを生成
			Goods goods = new Goods();

			// GoodsDAOクラスのオブジェクトを生成
			GoodsDAO goodsDao = new GoodsDAO();
			
			// cmd取得（フォワード先を変更するため）
			cmd = (String) request.getParameter("cmd");

			// 画面から送信されるgoods_id情報を受け取る
			int goods_id = Integer.parseInt(request.getParameter("goods_id"));
			
			// 商品情報を取得
			goods = goodsDao.selectGoodsByGoodsID(goods_id);

			// エラー処理
			if (goods.getGoodsId() == 0) {
				error = "表示対象の商品が存在しないため、詳細画面は表示されませんでした。";
				cmd = "list";
				return;
			}

			// 取得した商品情報をリクエストスコープに登録
			request.setAttribute("goods", goods);
			
			// エラー処理
		} catch (IllegalStateException e) {
			error = "DB接続エラーのため、詳細画面は表示できませんでした。";
			cmd = "logout";
		} finally {
			if (error.equals("")) {
				// エラーがなくcmdがdetailなら「goodsDetail.jsp」へフォワード
				if (cmd.equals("detail")) {
					request.getRequestDispatcher("/view/goodsDetail.jsp").forward(request, response);
				// エラーがなくcmdがupdateなら「changeGoods.jsp」へフォワード
				} else if(cmd.equals("update")){
					request.getRequestDispatcher("/view/changeGoods.jsp").forward(request, response);
				// エラーがなくcmdが上記以外なら「shipping.jsp」へフォワード
				}else {
					request.getRequestDispatcher("/view/shipping.jsp").forward(request, response);
				}
			} else {
				// エラーがあればエラー文とcmdをリクエストスコープに登録し、「error.jsp」へフォワード
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}
	}

}