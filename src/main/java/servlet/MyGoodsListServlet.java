package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Goods;
import bean.User;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MyGoodsListServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String cmd = "";
	String error = "";
	
	try {
	
	// セッションからUserオブジェクトを取得してセッション切れの判定
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute("user");
				if (user == null) {
					cmd = "logout";
					error = "セッション切れの為、出品一覧を表示できません。";
					return;
				}
	
		//Useridを変数に格納
		String userid=user.getUserid();
				
		//GoodsDAOのオブジェクトを作成
		GoodsDAO goodsDaoObj=new GoodsDAO();		
		
		
		//useridをもとに出品したGoodsオブジェクトのArrayListを取得
		ArrayList<Goods> myGoodsList = new ArrayList<Goods>();
		myGoodsList=goodsDaoObj.selectGoodsBySelluser(userid);
		
		//リクエストスコープに出品一覧GoodsのArrayListを送る
		request.setAttribute("myGoodsList", myGoodsList);
		
		//myGoodsList.jspに遷移
		request.getRequestDispatcher("/view/myGoodsList.jsp").forward(request, response);
	}catch (IllegalStateException e) {
		cmd = "mypage";
		error = "DB接続エラーの為、出品一覧を表示できません。";
	} finally {
		if (error.equals("")) {
			// 登録された件数を持ってbuyConrirm.jspにフォワード
			request.getRequestDispatcher("/view/buyConfirm.jsp").forward(request, response);
		} else {
			request.setAttribute("cmd", cmd);
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
	
	
	}
				
}
