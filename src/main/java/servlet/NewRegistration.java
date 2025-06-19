package servlet;

import java.io.File;
import java.io.IOException;

import bean.Goods;
import dao.GoodsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class NewRegistration extends HttpServlet {
	public void doPost( HttpServletRequest request, HttpServletResponse response) 

			throws IOException, ServletException{
		
		//Goods型オブジェクトの作成
		Goods goods = new Goods();
		
		//GoodsDAOのインスタンス化
		GoodsDAO objGoodsDAO = new GoodsDAO();
		
		//エラー文を管理する変数宣言
		String error = "";

		while ( true ) {
				String goodsName = request.getParameter("goodsName");
				if(goodsName.equals("")){
					error = "商品名が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else {
					goods.setGoodsName(goodsName);
				}
				
				//パラメータを受け取り、PRICEに関するエラー処理を行う				
				String price = request.getParameter("price");
				if(price.equals("")){
					error = "価格が未入力の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}
				
				try {
					goods.setPrice(Integer.parseInt(request.getParameter("price")));
				}catch(NumberFormatException e) {
					error = "価格の値が不正の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}
				
				//パラメータを受け取り、個数に関するエラー処理を行う				
				String quantity = request.getParameter("quantity");
				if(quantity.equals("")){
					error = "個数が未入力の為、処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}
				
				try {
					goods.setQuantity(Integer.parseInt(request.getParameter("quantity")));
				}catch(NumberFormatException e) {
					error = "個数の値が不正の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}
				
				//「カテゴリ」のパラメータを取得してエラー処理
				//optionの未選択は .equals("")でいいの？
				String category = request.getParameter("category");
				if(category.equals("")){
					error = "カテゴリがの為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else {
					goods.setCategory(category);
				}
				
				//「地域」のパラメータを取得してエラー処理
				//optionの未選択は .equals("")でいいの？
				String region = request.getParameter("region");
				if(region.equals("")){
					error = "地域が未選択の為、登録処理は行えませんでした。";
					request.setAttribute("error", error);
					break;
				}else {
					goods.setCategory(category);
				}
				
				/*
				 * 画像の保存先を指定する
				 */								
			}
		
		try {
			//insertメソッド呼び出し
			
		}catch( Exception e ) {
			error = "DB接続エラーの為、一覧表示は行えませんでした。";
			request.setAttribute("error", error);
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}

}
