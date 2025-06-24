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

@WebServlet("/inquiry")
public class InquiryServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		commonMethod(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		commonMethod(request, response);
	}
	
	public void commonMethod(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// メッセージ送信があれば送信されたメッセージをDBに格納し、そのスレッドのメッセージログをもってjspに遷移するサーブレット
		// メッセージ送信がなければメッセージログをもってjspに遷移する

		// エラー文と遷移先を格納する変数宣言
		String error = "";
		String cmd = "";
		
		// お問い合わせIDを取得
		int inquiryNo = Integer.parseInt(request.getParameter("inquiryNo"));
		
		//どこから来たかを判別するfromの値を取得（管理者側 or ユーザー側）
		String from = request.getParameter("from");

		try {
			// addパラメータ取得
			cmd = request.getParameter("cmd");

			// addがaddだったらメッセージ追加を行う
			if ( cmd != null && cmd.equals("insert")) {
				
				//セッションから送信したユーザーの情報を取得
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute("user");
				String userid = user.getUserid();
				
				// 送信されたメッセージの情報を取得
				String message = (String) request.getParameter("message");

				// Messageクラスをインスタンス化
				Message messageDto = new Message();

				// Messageオブジェクトに情報を格納
				messageDto.setUserId(userid);
				messageDto.setInquiryNumber(inquiryNo);
				messageDto.setMessage(message);

				// MessageDAOをインスタンス化し、MessageオブジェクトをDBに格納
				MessageDAO messageDao = new MessageDAO();
				messageDao.insertMesssageIntoInquiryMessages(messageDto);

			}
			
			// Inquiry.jspに表示するメッセージログを格納したArrayListを作成
			ArrayList<Message> messageList = new ArrayList<Message>();
			
			// inquiryNumをもとにメッセージログを取得するメソッド
			MessageDAO messageDao = new MessageDAO();
			
			//inquiry_infoからユーザーからきた初めの問い合わせメッセージを取得
			messageList = messageDao.selectMessageByInquiryNoFromInquiryInfo(inquiryNo);
			
			//inquiry_messageから、2件目以降の問い合わせメッセージを取得し、messageListの末尾に追加
			messageList.addAll(messageDao.selectMessageByInquiryNoFromInquiryMessage(inquiryNo));

			// リクエストスコープにメッセージログが入ったArrayListを登録
			request.setAttribute("messageList", messageList);
			
			//リクエストスコープにinquiryNoを登録
			request.setAttribute("inquiryNo", inquiryNo);

		} catch (Exception e) {
			error = "DB接続エラーの為、お問い合わせ詳細を表示できません。";
			cmd = "top";
			request.setAttribute("cmd", cmd);
			request.setAttribute("error", error);

		} finally {
			if (error.equals("")) {
				if ( from.equals("admin")) {
					// inquiryDetails.jspに遷移
					request.getRequestDispatcher("/view/inquiryDetails.jsp").forward(request, response);
				}else if ( from.equals("user")) {
					// inquiry.jspに遷移
					request.getRequestDispatcher("/view/inquiry.jsp").forward(request, response);
				}

			}else {
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}

		}

	}

}
