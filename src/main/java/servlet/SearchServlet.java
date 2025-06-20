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

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// エラー変数
		String error = "";
		String cmd = "";
		
		try {
			// パラメータの取得
			String keyword = request.getParameter("keyword");
			String region = request.getParameter("region");
			String category = request.getParameter("category");

			//GoodsDAOのsearchメソッドを呼び出し、goodsListに格納
			GoodsDAO goodsDao = new GoodsDAO();
			ArrayList<Goods> goodsList = goodsDao.search(keyword, region, category);
			
			// リクエストスコープにgoodsListという名前で登録
			request.setAttribute("goodsList", goodsList);
		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、検索を行えませんでした。";
			cmd = "logout";
		} finally {
			if (error.equals("")) {
				request.getRequestDispatcher("/view/top.jsp").forward(request, response); // とりあえずTOPに遷移
			} else {
				request.setAttribute("cmd", cmd);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}

	}

}
