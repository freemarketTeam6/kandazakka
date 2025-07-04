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

@WebServlet("/salesList")
public class SalesListServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//販売済み商品を格納するArraylistを宣言
		ArrayList<Goods> salesGoodsList = new ArrayList<Goods>();
		
		GoodsDAO objGoodsDAO = new GoodsDAO();
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
				
		try {
			
			//検索されたかどうかを判断するif文
			if( year == null && month == null) {
			
				//ステータスが「３」の商品をDBからもってきて、salesGoodsListに格納
				salesGoodsList = objGoodsDAO.selectGoodsByStatus("3");			
						
			}else {
				//ステータスが「３」かつ引数のyear,monthの条件を満たすgoodsの情報を取得する
				salesGoodsList = objGoodsDAO.searchByYearOrMonth(year, month);
			}
			
			//スコープに登録
			request.setAttribute("salesGoodsList", salesGoodsList);
			
			//salesList.jspにフォワードする
			request.getRequestDispatcher("/view/salesList.jsp").forward(request, response);			
			
		}catch (IllegalStateException e) {
			String error = "DB接続エラーのため、売上一覧画面は表示できませんでした。";
			String cmd="adminMenu";
			request.setAttribute("error", error);
			request.setAttribute("cmd", cmd);
			request.getRequestDispatcher("/view/adminError.jsp").forward(request, response);
		}
		

		


}
}
