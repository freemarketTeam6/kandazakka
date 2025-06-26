package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;



@WebServlet("/changeGoods")
@MultipartConfig
public class ChangeGoodsServlet extends HttpServlet {
	String error = "";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.error = "";
		String cmd = "";
		try {
			GoodsDAO goodsDao = new GoodsDAO();

			// パラメータの取得
			String imgpath = request.getParameter("imgpath");
			String goodsname = request.getParameter("goodsname");
			String price = request.getParameter("price");         //int
			String quantity = request.getParameter("quantity");   //int
			String category = request.getParameter("category");
			String region = request.getParameter("region");
			String memo = request.getParameter("memo");
			//変更前の商品情報の取得
			int goodsid = Integer.parseInt(request.getParameter("goodsid"));
			Goods oldGoods = goodsDao.selectGoodsByGoodsID(goodsid);

			// 入力チェック
			
			if (goodsname==null||goodsname.equals("")) {
				goodsname=oldGoods.getGoodsName();
			}
			if (price.equals("")) {
				price=Integer.toString(oldGoods.getPrice());
			}
				
			if (quantity.equals("")) {
				quantity=Integer.toString(oldGoods.getQuantity());
			}
			if (category.equals("")) {
				category=oldGoods.getCategory();
			}
			if (region.equals("選択")) {
				region=oldGoods.getRegion();
			}
			
			//ファイル取得用のimage情報を受け取る
			Part filePart = request.getPart("image");

			//ルート情報とファイルパスを管理する変数を初期化
			String filePath=fileSave(filePart,imgpath);
			
			if(filePath.equals("")) {
				filePath=imgpath;
			}

			// 新しい情報をgoodsに格納
			Goods goods = new Goods();
			goods.setGoodsName(goodsname);
			goods.setImgPath(filePath);
			goods.setPrice(Integer.parseInt(price));
			goods.setQuantity(Integer.parseInt(quantity));
			goods.setCategory(category);
			goods.setRegion(region);
			goods.setGoodsMemo(memo);
			goods.setGoodsId(goodsid);

			// DBの更新処理
			goodsDao.update(goods);
			request.setAttribute("goods", goods);
		} catch (IllegalStateException e) {
			error = "DB接続エラーの為、商品情報変更は行えませんでした。";
			cmd = "logout";
		} catch (NumberFormatException e) {
			error = "価格と個数は数値を入力してください。";
		} finally {
			if (error.equals("")) {
				request.getRequestDispatcher("/view/changeGoodsConfirm.jsp").forward(request, response);
			} else {
				request.setAttribute("cmd", cmd);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/view/error.jsp").forward(request, response);
			}
		}

	}
	
	private String fileSave(Part filePart,String imgpath) throws IOException{

		//ルート情報とファイルパスを管理する変数を初期化
		String uploadDir = "";
		String filePath = "";
		
		//ファイル名を管理する変数
		String newFileName = "";

		//ファイルサイズを元にファイルの有無を確認
		if (filePart.getSize() != 0) {
			
			//ファイル名を取得
			String fileName= imgpath;
			
			int extensionIndex=fileName.lastIndexOf(".");
			int nameIndex = fileName.lastIndexOf("_");
			String extension=fileName.substring(extensionIndex);
			String name = fileName.substring(0,nameIndex+1);
			String change = fileName.substring(nameIndex+1,extensionIndex);
			int changeNo = Integer.parseInt(change)+1;
			
			newFileName=name+changeNo+extension;

			// 保存先ディレクトリを設定
			//uploadDir = "../webapp/file/images";
			uploadDir = "C:/Users/kanda-it/git/kandazakka/src/main/webapp/file/images";

			//アップロード先のディレクトリが存在しない場合に、そのディレクトリを作成
			File uploadDirectory = new File(uploadDir);
			if (!uploadDirectory.exists()) {
				uploadDirectory.mkdirs();
			}
			

			//アップロードした画像ファイルパス
			filePath = uploadDir +"/"+ newFileName;
			Path deletePath = Paths.get(uploadDir +"/"+ fileName);

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
				
			}else {
				Files.delete(deletePath);
				System.out.println("削除されたパス: " + deletePath);
			}
			

			//リクエストスコープにファイル名を設定
		} else {
			newFileName = imgpath;
		}
		return newFileName;

	}
	
}
