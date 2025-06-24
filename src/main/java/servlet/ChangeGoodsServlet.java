package servlet;

import java.io.IOException;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 
 */
@WebServlet("/changeGoods")
public class ChangeGoodsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String error = "";
		String cmd = "";
		try {
			GoodsDAO goodsDao = new GoodsDAO();

			// パラメータの取得
			String imgpath = request.getParameter("imgpath");
			String goodsname = request.getParameter("goodsname");
			String price = request.getParameter("price");         //int
			String quantity = request.getParameter("quantity");   //int
			String category = request.getParameter("category");
			String region = request.getParameter("region");
			String memo = request.getParameter("memo");

			// 入力チェック
			if (imgpath.equals("")) {
				error = "グッズの写真がない為、商品情報変更できません。";
				return;
			}
			if (goodsname.equals("")) {
				error = "グッズの名前が未入力の為、商品情報変更できません。";
				return;
			}
			if (price.equals("")) {
				error = "グッズの価格が未入力の為、商品情報変更できません。";
				return;
			}
			if (quantity.equals("")) {
				error = "グッズの価格が未入力の為、商品情報変更できません。";
				return;
			}
			if (category.equals("")) {
				error = "グッズのカテゴリーが未入力の為、商品情報変更できません。";
				return;
			}
			if (region.equals("選択")) {
				error = "グッズの地域が未入力の為、商品情報変更できません。";
				return;
			}

			// 新しい情報をbookに格納
			Goods goods = new Goods();
			goods.setGoodsName(goodsname);
			goods.setImgPath(imgpath);
			goods.setPrice(Integer.parseInt(price));
			goods.setQuantity(Integer.parseInt(quantity));
			goods.setCategory(category);
			goods.setRegion(region);
			goods.setGoodsMemo(memo);

			// DBの更新処理
			goodsDao.update(goods);
		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、商品情報変更は行えませんでした。";
			cmd = "logout";
		} catch (NumberFormatException e) {
			error = "価格と個数は数値を入力してください。";
		} finally {
			if (error.equals("")) {
				request.getRequestDispatcher("/view/changeGoodsConfirm.jsp").forward(request, response);
			} else {
				request.setAttribute("cmd", cmd);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}

	}

}
