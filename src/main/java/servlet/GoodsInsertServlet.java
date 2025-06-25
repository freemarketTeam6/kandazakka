package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import bean.Goods;
import bean.User;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/goodsInsert")
@MultipartConfig
public class GoodsInsertServlet extends HttpServlet {
	String error = "";
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String empty = "";
		this.error="";
		GoodsDAO goodsDao = new GoodsDAO();
		try {
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			
			Goods goods = new Goods();
			
			/*
			 * ブラウザから送られてきたファイル（`name="img"`）を受け取る
			 * getSubmittedFileName()：アップロードされたファイルの「元の名前」を取得
			 * 例えば、「xxx.jpg」みたいな
			 */
			
			Part filePart = request.getPart("image"); 
			
			//保存先のパスを取得↓
			//C\\:usr\kis_java_pkg_2023\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\bmsweb40j_yamashita\img
			String uploadDir = request.getServletContext().getRealPath("/file/images");
					
			String fileName = "goods_" + user.getUserid() + "_" + (goodsDao.userGoodsCount( user.getUserid())+1)   +".jpg";
			
			String filePath = uploadDir + File.separator + fileName;

			filePart.write(filePath); // ファイルを書き込み
			
			// 出品者のIDを格納する変数
			String selluserId =user.getUserid();
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
				goods.setImgPath(fileName);
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
	
}
