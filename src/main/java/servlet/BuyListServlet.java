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

@WebServlet("/buyList")
public class BuyListServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = "";
		String cmd = "";

		try {
			// 表示する商品情報を格納するGoods型のArrayListを生成
			ArrayList<Goods> goodsList = new ArrayList<Goods>();

			// GoodsDAOクラスのオブジェクトを生成
			GoodsDAO goodsDao = new GoodsDAO();

			// セッションからデータを受け取る
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			// エラー処理
			if (user == null) {
				error = "セッション切れのため、購入履歴は表示できませんでした。";
				cmd = "top";
			}

			// UserクラスのgetUseridメソッドを使用し、user_idを取得
			String user_id = user.getUserid();

			// 購入した商品の情報を取得
			goodsList = goodsDao.selectGoodsByByeUser(user_id);

			// 取得した商品情報をリクエストスコープに登録
			request.setAttribute("goodsList", goodsList);

			// エラー処理
		} catch (IllegalStateException e) {
			error = "DB接続エラーのため、購入履歴は表示できませんでした。";
			cmd = "logout";
		} finally {
			// エラーがなければ「buyList.jsp」へフォワード
			if (error.equals("")) {
				request.getRequestDispatcher("/view/buyList.jsp").forward(request, response);
			} else {
				// エラーがあればエラー文とcmdをリクエストスコープに登録し、「userError.jsp」へフォワード
				request.setAttribute("error", error);
				request.setAttribute("cmd", cmd);
				request.getRequestDispatcher("/view/userError.jsp").forward(request, response);
			}
		}
	}

}
