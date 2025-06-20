package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/exhibitList")
public class ExhibitListServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String error = "";
		String cmd = "";

		ArrayList<Goods> goodsList = new ArrayList<Goods>();
		// GoodsDAOのインスタンス化
		GoodsDAO goodsDao = new GoodsDAO();
		try {
			// グッズ情報を全て取得
			goodsList = goodsDao.selectAll();

			// スコープにgoodsListを登録
			request.setAttribute("goodsList", goodsList);

			// exhibitList.jspにフォワード
			request.getRequestDispatcher("/view/exhibitList.jsp").forward(request, response);

		} catch (IllegalStateException e) {
			// リクエストスコープにエラーを入れる
			error = "DB接続エラーの為、出品一覧表示はできません。";
			cmd="adminMenu";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
}
