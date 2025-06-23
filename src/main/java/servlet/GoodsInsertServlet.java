package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import bean.Goods;
import bean.User;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/goodsInsert")
public class GoodsInsertServlet extends HttpServlet {
	String error = "";
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String empty = "";
		GoodsDAO goodsDao = new GoodsDAO();
		try {
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			
			Goods goods = new Goods();
			
			

			//ファイル取得用のimage情報を受け取る
			Part filePart = request.getPart("image");

			//ルート情報とファイルパスを管理する変数を初期化
			String filePath=fileSave(filePart,user.getUserid());
			
			// 出品者のIDを格納する変数
			String selluserId = request.getParameter(user.getUserid());
			// グッズの名前
			String goodsName = request.getParameter("name");
			// グッズの値段
			int price = Integer.parseInt(request.getParameter("price"));
			// グッズの個数
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			// グッズの種類
			String category = request.getParameter("category");
			// グッズの状態、商品説明
			String goodsMemo = request.getParameter("goods_memo");
			// 出品のステータス
			String status = "0";
			// 出品地域
			String region = request.getParameter("region");
			
			  
			if (goodsName == null || goodsName.equals("")) {

				empty = empty+"　商品名";
			}  
			
			if (price <= 0) {

				empty = empty+"　価格";

			}  
			if (quantity < 1) {
				empty = empty+"　個数";

			}  
			if (category == null || category.equals("")) {

				empty = empty+"　種類";
			}   
			if (region == null || region.equals("")) {

				empty = empty+"　主品地域";

			}
			
			if (!empty.equals("")) {

				empty = empty+"が未入力です";
				request.setAttribute("goods", goods);

			}else {
				goods.setSelluserId(selluserId);
				goods.setImgPath(filePath);
				goods.setGoodsName(goodsName);
				goods.setPrice(price);
				goods.setQuantity(quantity);
				goods.setCategory(category);
				goods.setGoodsMemo(goodsMemo);
				goods.setStatus(status);
				goods.setRegion(region);
				
				goodsDao.insert(goods);
				
				
			}

		

		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、出品できません。";
			request.setAttribute("cmd", "logout");

		} catch (Exception e) {
			error = "予期せぬエラーが発生しました。<br>" + e;
			request.setAttribute("cmd", "logout");

		} finally {
			if (error.equals("")&&empty.equals("")) {
				request.getRequestDispatcher("/mygoodsList").forward(request, response);

			} else if (!empty.equals("")) {
				request.setAttribute("empty", empty);
				request.getRequestDispatcher("/view/goodsInsert.jsp").forward(request, response);

			}else{
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}

		}

	}
	
	private String fileSave(Part filePart,String userid) throws IOException{

		//ルート情報とファイルパスを管理する変数を初期化
		String uploadDir = "";
		String filePath = "";
		
		//ファイル名を管理する変数
		String fileName = "";
		
		GoodsDAO goodsDao = new GoodsDAO();

		//ファイルサイズを元にファイルの有無を確認
		if (filePart.getSize() != 0) {


			//ファイル名を設定
			fileName = "goods_"+userid+"_"+goodsDao.userGoodsCount(userid)+1;
			

			// 保存先ディレクトリを設定
			uploadDir = "../../webapp/file/images";

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
		return filePath;

	}
}
