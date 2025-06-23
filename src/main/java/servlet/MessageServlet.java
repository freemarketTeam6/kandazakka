package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import bean.Message;
import bean.User;
import dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*
 *利用者同士のやり取りをする機能 
 */

@WebServlet("/message")
public class MessageServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//エラー文を格納する変数宣言
		String error ="";
		
		//商品IDの取得
		int  goods_id = Integer.parseInt(request.getParameter("goods_id"));
		
		//セッションからユーザー情報を取得
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		
		//取得したメッセージを保管する用のArrayListを宣言
		ArrayList<Message> messageList = new ArrayList<Message>();
		
		//MessageDAOのインスタンス化
		MessageDAO objMsgDAO = new MessageDAO();
		
		//パラメータ取得して、「メッセージ追加」ならinsertメソッド→一覧表示、違うなら一覧表示のみ
		String cmd = request.getParameter("cmd");
		
		try {
		
		if ( cmd.equals("insert")) {
			
			//入力されたメッセージ内容を取得
			String message = request.getParameter("message");
			
			//現在日時を取得
			Date nowdate = new Date();
			
			Message messageinfo = new Message();
			
			//messageに必要な情報を格納していく
			messageinfo.setUserId(user.getUserid());
			messageinfo.setGoodsId(goods_id);
			messageinfo.setMessage(message);
			messageinfo.setDate(nowdate);
			
			 objMsgDAO.insertMesssageIntoGoodsMessages(messageinfo);
			 
			//取得したIDをもとにメッセージ取得
			 messageList = objMsgDAO.selectMessageByGoodsId(goods_id);
			 
		}else {
			//取得したIDをもとにメッセージ取得
			messageList = objMsgDAO.selectMessageByGoodsId(goods_id);
		}

	}catch (Exception e) {
		error = "DB接続エラーの為、出品一覧を表示できません。";
	} finally {
		if (error.equals("")) {
			//スコープに取得したメッセージとグッズIDを登録
			request.setAttribute("goods_id", goods_id);
			request.setAttribute("messageList", messageList);
			//message.jspにフォワード
			request.getRequestDispatcher("/view/message.jsp").forward(request, response);
		} else {
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
	
	
	}
				
}
