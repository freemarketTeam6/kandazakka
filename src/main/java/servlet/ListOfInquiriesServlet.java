package servlet;

import java.io.IOException;
import java.util.ArrayList;

import bean.Inquiries;
import dao.InquiriesDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/listOfInquiries")
public class ListOfInquiriesServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String error = "";
		String cmd = "";
		
		try {
			//DAOクラスのオブジェクト
			InquiriesDAO inquiriesDao=new InquiriesDAO();
			
			//一覧表示のメソッド
			ArrayList<Inquiries>InquiriesList= inquiriesDao.selectAll();
			
			//お問い合わせの一覧(InqueriesList)を持って画面にフォワード
			request.setAttribute("InquiriesList", InquiriesList);
			request.getRequestDispatcher("/view/listOfInquiry.jsp");
		}catch(IllegalStateException e){
			error="DB接続エラーの為、お問い合わせ一覧の表示は行えませんでした。";
			cmd="adminMenu";
			request.setAttribute("cmd", cmd);
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/adminError.jsp").forward(request,response);
		}
	}
}
