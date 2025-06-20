package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Goods;
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
		
		//ステータスが「３」以降の商品をDBからもってきて、salesGoodsListに格納
		
		//スコープに登録
		request.setAttribute("salesGoodsList", salesGoodsList);
		
		//salesList.jspにフォワードする
		request.getRequestDispatcher("/view/salesList.jsp").forward(request, response);
		
		//saleslist.jspの表は、左から購入日、商品画像、商品名、購入者、販売者、金額、利益（金額の10％）
		
		//
}
}
