package servlet;

import java.io.IOException;

import bean.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/newRegistration")
public class NewRegistration extends HttpServlet {
	public void doPost( HttpServletRequest request, HttpServletResponse response) 

			throws IOException, ServletException{
		
		//Goods型オブジェクトの作成
		User user = new User();
		
		//GoodsDAOのインスタンス化
		UserDAO objUserDAO = new UserDAO();
		
		//エラー文を管理する変数宣言
		String error = "";
		
		/*
		 * 入力内容のエラー処理
		 * エラーが発生したら or 最後まで処理が完了したらWhile文抜ける
		 */
		while ( true ) {
			
				//パラメータを受け取って、ユーザー名の空欄処理
				String name = request.getParameter("name");
				
				if(name.equals("")){
					error = "名前が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else {
					user.setName(name);
				}
				
				//パラメータを受け取って、ユーザー名（フリガナ）の空欄処理
				String name_kana = request.getParameter("name_kana");
				
				if(name_kana.equals("")){
					error = "名前（カナ）が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else {
					user.setNamekana(name_kana);
				}
				
				//パラメータを受け取って、ニックネームの空欄処理
				String nickname = request.getParameter("nickname");
				
				if(nickname.equals("")){
					error = "ニックネームが未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else {
					user.setNickname(nickname);
				}	
				
				/*
				 * パラメータを受け取って、ユーザーIDに関するエラー処理
				 * 空欄判定と、重複判定
				 */
				String userID = request.getParameter("userID");
				if(userID.equals("")){
					error = "価格が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}
				
				if (objUserDAO.selectByUser(userID) != null ) {
					error = "このユーザーIDはすでに使われています！";
					request.setAttribute("error", error);
					break;
				}
				
				/*
				 * パラメータを受け取って、メールアドレスの空欄処理
				 * 正規表現を追加予定 6/20
				 */
				String mail = request.getParameter("mail");
				
				if(mail.equals("")){
					error = "ニックネームが未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else {
					user.setEmail(mail);
				}	
				
				//パラメータを受け取って、パスワードの空欄処理
				String password = request.getParameter("password");
				String passwordConfirm = request.getParameter("passwordConfirm");
				
				if(password.equals("")){
					error = "パスワードが未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else if( passwordConfirm.equals("")) {
					error = "パスワード（確認用）が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);	
					break;
				}else if( password.equals(passwordConfirm)) {
					error = "パスワードとパスワード（確認用）が一致しないため、登録処理は行えませんでした。";
					request.setAttribute("error", error);	
					break;
				}
		
		try {
			//insertメソッド呼び出し
			objUserDAO.insert(user);
			
		}catch( Exception e ) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}
		
	}

}
