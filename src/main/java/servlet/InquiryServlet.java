package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import bean.Message.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("inquiery")
public class InquiryServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	//メッセージ送信があれば送信されたメッセージをDBに格納し、そのスレッドのメッセージログをもってjspに遷移するサーブレット
	//メッセージ送信がなければメッセージログをもってjspに遷移する
		
		try {
		
		//送信されたメッセージの情報を取得
		String userid = request.getParameter(userid);
		String inquiryNum = request.getParameter(inquiryNum);
		String message = request.getParameter(message);
		
		//送信された日時を取得
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        
		//Messageクラスをインスタンス化
	Message messageDto = new Message();
	
	//Messageオブジェクトに情報を格納
	messageDto.setUserId(userid);
	messageDto.setInquiryNumber(inquiryNum);
	messageDto.setMessage(message);
	messageDto.setDate(date);
	
	//MessageDAOをインスタンス化し、MessageオブジェクトをDBに格納
	MessageDAO messageDao = new MessageDAO();
	messageDao.insertMesssageIntoInquiryMessages(messageDto);
	
	//Inquiry.jspに表示するメッセージデータを格納したArrayListを作成
	ArrayList<Message> messageList = new ArrayList<Message>();
	//inquiryNumをもとにメッセージログを取得するメソッド
	messageList = messageDao.selectMessageByInquiryNo(inquiryNum);
	
	//リクエストスコープにメッセージログが入ったArrayListを登録
	request.setAttribute("messageList", messageList);
	
	//inquiry.jspに遷移
	request.getRequestDispatcher("/view/inquiry.jsp").forward(request, response);
	
		}catch() {
		}
	
	}
	
	
	
	
}
