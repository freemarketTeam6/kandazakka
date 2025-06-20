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

@WebServlet("/saleslist")
public class SalesListServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//販売済み商品を格納するArraylistを宣言
		ArrayList<Goods> salesGoodsList = new ArrayList<Goods>();
		
		GoodsDAO objGoodsDAO = new GoodsDAO();
		
		try {
			//ステータスが「３」以降の商品をDBからもってきて、salesGoodsListに格納
			salesGoodsList = objGoodsDAO.selectGoodsByStatus(3);
			
			//スコープに登録
			request.setAttribute("salesGoodsList", salesGoodsList);
			
			//salesList.jspにフォワードする
			request.getRequestDispatcher("/view/salesList.jsp").forward(request, response);			
			
		}catch (IllegalStateException e) {
			String error = "DB接続エラーのため、詳細画面は表示できませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
		

		


}
}
