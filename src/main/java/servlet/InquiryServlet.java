package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import bean.Message;
import dao.MessageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/inquiery")
public class InquiryServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// メッセージ送信があれば送信されたメッセージをDBに格納し、そのスレッドのメッセージログをもってjspに遷移するサーブレット
		// メッセージ送信がなければメッセージログをもってjspに遷移する

		// エラー文と遷移先を格納する変数宣言
		String error = "";
		String cmd = "";

		try {
			// cmdパラメータ取得
			String add = request.getParameter("add");

			// addがaddだったらメッセージ追加を行う
			if (add.equals("add")) {
				// 送信されたメッセージの情報を取得
				String userid = (String) request.getParameter("userid");
				int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
				String message = (String) request.getParameter("message");

				// 送信された日時を取得
				Date nowdate = new Date();

				// Messageクラスをインスタンス化
				Message messageDto = new Message();

				// Messageオブジェクトに情報を格納
				messageDto.setUserId(userid);
				messageDto.setInquiryNumber(inquiryNum);
				messageDto.setMessage(message);
				messageDto.setDate(nowdate);

				// MessageDAOをインスタンス化し、MessageオブジェクトをDBに格納
				MessageDAO messageDao = new MessageDAO();
				messageDao.insertMesssageIntoInquiryMessages(messageDto);

			}

			// お問い合わせIDを取得
			int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));

			// Inquiry.jspに表示するメッセージログを格納したArrayListを作成
			ArrayList<Message> messageList = new ArrayList<Message>();
			// inquiryNumをもとにメッセージログを取得するメソッド
			MessageDAO messageDao = new MessageDAO();
			messageList = messageDao.selectMessageByInquiryNo(inquiryNum);

			// リクエストスコープにメッセージログが入ったArrayListを登録
			request.setAttribute("messageList", messageList);

		} catch (Exception e) {
			error = "DB接続エラーの為、お問い合わせ詳細を表示できません。";
			cmd = "top";

		} finally {
			if (error.equals("")) {
				// inquiry.jspに遷移
				request.getRequestDispatcher("/view/inquiry.jsp").forward(request, response);
			}

		}

	}

}
