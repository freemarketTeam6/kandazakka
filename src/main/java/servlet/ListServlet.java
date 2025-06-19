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

@WebServlet("/list")
public class ListServlet extends HttpServlet {
	
	public void doGet( HttpServletRequest request, HttpServletResponse response) 
	throws IOException, ServletException{
		
		//GoodsDAOのインスタンス化
		GoodsDAO objGoodsDAO = new GoodsDAO();
		
		//GoodsクラスのArrayListを作成
		ArrayList<Goods> goodsList = new ArrayList<Goods>();
		
		try {
		//全件取得
		goodsList = objGoodsDAO.selectAll();
		
		//スコープにgoodsListを登録
		request.setAttribute("goodsList", goodsList);
		
		//top.jspにフォワードする
		request.getRequestDispatcher("/view/top.jsp").forward(request, response);
		
		}catch( Exception e) {
			//リクエストスコープにエラー内容を渡す
			String error = "DB接続エラーの為、一覧表示は行えませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
		
		
	}

}
