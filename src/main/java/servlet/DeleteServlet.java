package servlet;

import java.io.IOException;

import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	public void doGet( HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException{
		
		//BookDAOオブジェクトの作成
		GoodsDAO objGoodsDAO = new GoodsDAO();

		//エラー文を管理する変数
		String error = "";
		
		//削除対象ののパラメータの取得
		int goodsID = Integer.parseInt(request.getParameter("goodsID"));
		
		try {
		
		//削除対象があるかどうか調べる  判定式　== nullでOK？
		if ( objGoodsDAO.selectGoodsByGoodsID(goodsID) == null) {
			error = "削除対象の書籍が存在しない為、書籍削除処理は行えませんでした。";
			request.setAttribute("error", error);
		}
		
		//削除対象のステータスが「販売中」（DB上だと「０」かどうか調べる
		if ( objGoodsDAO.selectGoodsByGoodsID(goodsID).getStatus().equals("0")) {
			error = "販売中の商品でないため、削除処理は行えませんでした。";
			request.setAttribute("error", error);
		}
		
		//エラー時の画面遷移をif文とともに記載
		if ( error.equals("")) {
			//deleteメソッドの実行
			objGoodsDAO.delete(goodsID);
			//list.jspへフォワード
			request.getRequestDispatcher("/ListServlet").forward(request, response);
		
		}else {
			//error.jspにフォワード
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
		}catch( Exception e ) {
			error = "DB接続エラーの為、書籍削除処理は行えませんでした。";
			request.setAttribute("error", error);
			request.setAttribute("transition", "menu");	
		}
		
		
		
	}

}
