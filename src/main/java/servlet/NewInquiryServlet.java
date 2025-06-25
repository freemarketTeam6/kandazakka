package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import bean.Inquiries;
import bean.User;
import dao.GoodsDAO;
import dao.InquiriesDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/newInquiry")
@MultipartConfig
public class NewInquiryServlet extends HttpServlet {
	String error = "";

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String message = "";
		Inquiries inquiries = new Inquiries();
		int inquiryno = 0;
		try {

			request.setCharacterEncoding("UTF-8");

			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			InquiriesDAO inquiriesDao = new InquiriesDAO();

			if (user == null) {
				error = "セッション切れの為、お問い合わせ作成は行えませんでした。";
				request.setAttribute("cmd", "logout");
				return;

			}

			String userID = user.getUserid();
			String category = request.getParameter("category");
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			int last_inquiryno = inquiriesDao.inquiriesCount();

			Part filePart = request.getPart("file_path");
			
			//ここでエラー吐く
			String filePath = fileSave(filePart, last_inquiryno);

			if (category == null || category.equals("")) {

				message = "お問い合わせカテゴリを選択してください";
				return;

			}
			if (title == null || title.equals("")) {

				message = "お問い合わせタイトルを入力してください";
				return;

			}
			if (contents == null || contents.equals("")) {

				message = "お問い合わせ内容を入力してください";
				return;

			}

			inquiries.setUser_id(userID);
			inquiries.setCategory(category);
			inquiries.setTitle(title);
			inquiries.setContents(contents);
			inquiries.setFile_path(filePath);

			inquiriesDao.insert(inquiries);

			inquiryno = last_inquiryno + 1;

		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、お問い合わせ作成は行えませんでした。";
			request.setAttribute("cmd", "logout");

		} catch (Exception e) {
			error = "予期せぬエラーが発生しました。" + e;
			request.setAttribute("cmd", "logout");

		} finally {
			if (error.equals("") && message.equals("")) {
				request.setAttribute("user", inquiryno);
				request.getRequestDispatcher("/inquiry").forward(request, response);

			} else if (!error.equals("")) {
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			} else {
				request.setAttribute("message", message);
				request.setAttribute("user", inquiries);
				request.getRequestDispatcher("/view/newInquiry.jsp").forward(request, response);
			}
		}

	}

	private String fileSave(Part filePart, int last_inquiryno) throws IOException {

		//ルート情報とファイルパスを管理する変数を初期化
		String uploadDir = "";
		String filePath = "";
		
		//ファイル名を管理する変数
		String fileName = "";
		
		GoodsDAO goodsDao = new GoodsDAO();

		//ファイルサイズを元にファイルの有無を確認
		if (filePart.getSize() != 0) {
			
			//拡張子を取得
			
			//アップロードされたファイルの詳細情報を取得
			String contentDisposition = filePart.getHeader("content-disposition");
			
			
			//ファイル名を取得するための正規表現パターンを設定
			Pattern pattern = Pattern.compile("filename=\"(.*)\"");
			
			//正規表現パターンを使用して、詳細情報からファイル名を抽出
			Matcher matcher = pattern.matcher(contentDisposition);
			
			
			//抽出したファイル名が存在していればファイル名を管理する変数に代入、なければ空白を代入
			if (matcher.find()) {
				fileName = matcher.group(1);
			} else {
				fileName = "";
			}
			
			//拡張子を取得
			fileName= fileName.substring(fileName.lastIndexOf("."));
			

			//ファイル名を設定
			fileName = "inquiries_" + (last_inquiryno + 1) + fileName;

			// 保存先ディレクトリを設定
			uploadDir = "C:/Users/kanda-it/git/kandazakka/src/main/webapp/file/inquiries";

			//アップロード先のディレクトリが存在しない場合に、そのディレクトリを作成
			File uploadDirectory = new File(uploadDir);
			if (!uploadDirectory.exists()) {
				uploadDirectory.mkdirs();
			}

			//アップロードした画像ファイルパス
			filePath = uploadDir + "/" + fileName;

			// デバッグ用にパスを出力
			System.out.println("保存されたパス: " + filePath);

			//ファイルの保存処理（アップロードされたファイルをサーバー上の指定されたディレクトリに保存）
			try (InputStream inputStream = filePart.getInputStream()) {
				Files.copy(inputStream, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
			}

			// 保存後にファイルの存在をチェック
			File savedFile = new File(filePath);
			if (!savedFile.exists()) {
				error = "保存に失敗しました。 ";
				throw new IOException();

			}

			//リクエストスコープにファイル名を設定
		} else {
			error = "ファイルがありません";
		}
		return fileName;

	}
}