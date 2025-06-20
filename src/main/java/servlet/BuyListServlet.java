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

@WebServlet("/buyList")
public class BuyListServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 表示する商品情報を格納するGoods型のArrayListを生成
			ArrayList<Goods> goodsList = new ArrayList<Goods>();

			// GoodsDAOクラスのオブジェクトを生成
			GoodsDAO goodsDao = new GoodsDAO();
			
			//セッションからデータを受け取る
			User user=(User)session.getAttribute("user");
			
			//UserクラスのgetUseridメソッドを使用し、user_idを取得
			String user_id=user.getUserid();
			
			goodsList=goodsDao.selectGoodsByByeUser(user_id);
		}
	}

}
