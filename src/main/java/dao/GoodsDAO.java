package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import bean.Goods;

//import bean.Goods;

public class GoodsDAO {
	
	//データベース接続情報
	private static String RDB_DRIVE ="org.mariadb.jdbc.Driver";
	private static String URL ="jdbc:mariadb://localhost/mybookdb";
	private static String USER ="root";
	private static String PASS ="root123";
	
	//データベースに接続するクラスメソッド
	private static Connection getConnection() {
		try {
			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			return con;
			
		}catch( Exception e ) {
			throw new IllegalStateException(e);
		}
	}
	
	//各種メソッド記載
	//
	
	//DBから全部持ってくるメソッド
	public ArrayList<Goods> selectAll(){
		Connection con = null;
		Statement smt = null;
		
		//戻り値用の配列宣言
		ArrayList<Goods> goodsList = new ArrayList<Goods>();
		
		String sql = "SELECT * FROM goodsinfo";
		
		try {
			
			con = getConnection();
			smt = con.createStatement();
			
			ResultSet rs = smt.executeQuery(sql);
			
			while (rs.next() ){
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goods_id"));
				goods.setSelluserId(rs.getString("selluser_id"));

				goods.setImgPath(rs.getString("img_path"));
				goods.setGoodsName(rs.getString("name"));
				goods.setPrice(rs.getInt("price"));
				goods.setQuantity(rs.getInt("quantity"));
				goods.setCategory(rs.getString("category"));
				goods.setGoodsMemo(rs.getString("goods_memo"));
				goods.setStatus(rs.getString("status"));
				goods.setExhibitDate(rs.getDate("exhibit_date"));
				goods.setBuyDate(rs.getDate("exhibit_date"));
				goods.setBuyuserId(rs.getString("exhibit_date"));

			}
			
			}catch(Exception e) {
				throw new IllegalStateException(e);
			}finally {
				if ( smt != null) {
					try {smt.close();}catch(SQLException ignore) {}
				}
				if ( con != null ) {
					try { con.close();}catch(SQLException ignore) {}
				}
			}
			return goodsList;

	}
	
	
	//マイページ表示用に、userID渡したらその人の商品を取得する
	public ArrayList<Goods> selectGoodsByUser(String userid){
		Connection con = null;
		Statement smt = null;
		
		//戻り値用の配列宣言
		ArrayList<Goods> goodsList = new ArrayList<Goods>();
		
		//SQL文定義
		String sql = "SELECT * FROM goodsinfo WHERE selluser_id = '" + userid  + "'";
		
		try {
			
			con = getConnection();
			smt = con.createStatement();
			
			ResultSet rs = smt.executeQuery(sql);
			
			while (rs.next() ){
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goods_id"));
				goods.setSelluserId(rs.getString("selluser_id"));
				goods.setImgPath(rs.getString("img_path"));
				goods.setGoodsName(rs.getString("name"));
				goods.setPrice(rs.getInt("price"));
				goods.setQuantity(rs.getInt("quantity"));
				goods.setCategory(rs.getString("category"));
				goods.setGoodsMemo(rs.getString("goods_memo"));
				goods.setStatus(rs.getString("status"));
				goods.setExhibitDate(rs.getDate("exhibit_date"));
				goods.setBuyDate(rs.getDate("exhibit_date"));
				goods.setBuyuserId(rs.getString("exhibit_date"));
			}
			
		}catch(Exception e) {
				throw new IllegalStateException(e);
			}finally {
				if ( smt != null) {
					try {smt.close();}catch(SQLException ignore) {}
				}
				if ( con != null ) {
					try { con.close();}catch(SQLException ignore) {}
				}
			}
			return goodsList;
		}
	
	//GoodsIDをもとに、商品情報を検索して戻す
	public Goods selectGoodsByGoodsID(int goodsid){
		Connection con = null;
		Statement smt = null;
		
		//戻り値用のGoods型オブジェクトを作成
		Goods goods = new Goods();
		
		//SQL文定義
		String sql = "SELECT * FROM goodsinfo WHERE goods_id = '" + goodsid  + "'";
		
		try {
			
			con = getConnection();
			smt = con.createStatement();
			
			ResultSet rs = smt.executeQuery(sql);
			
			if( rs.next() ) {
				goods.setGoodsId(rs.getInt("goods_id"));
				goods.setSelluserId(rs.getString("selluser_id"));
				goods.setImgPath(rs.getString("img_path"));
				goods.setGoodsName(rs.getString("name"));
				goods.setPrice(rs.getInt("price"));
				goods.setQuantity(rs.getInt("quantity"));
				goods.setCategory(rs.getString("category"));
				goods.setGoodsMemo(rs.getString("goods_memo"));
				goods.setStatus(rs.getString("status"));
				goods.setExhibitDate(rs.getDate("exhibit_date"));
				goods.setBuyDate(rs.getDate("exhibit_date"));
				goods.setBuyuserId(rs.getString("exhibit_date"));
			}
		}catch(Exception e) {
			throw new IllegalStateException(e);
		}finally {
			if ( smt != null) {
				try {smt.close();}catch(SQLException ignore) {}
			}
			if ( con != null ) {
				try { con.close();}catch(SQLException ignore) {}
			}
		}
		return goods;
	}
	
	//検索機能　キーワード、地域、種類（カテゴリ）を引数に検索を行う
	public ArrayList<Goods> search(String keyword, String region, String category){
		Connection con = null;
		Statement smt = null;
		 
		//戻り値用の配列宣言
		ArrayList<Goods> goodsList = new ArrayList<Goods>();
		
		//SQL文
		String sql = "SELECT * FROM goodsinfo WHERE name LIKE '%" + keyword + "%' AND region LIKE '%" + region + "%' AND category LIKE '%" + category + "%'";
		
		try {
			
			con = getConnection();
			smt = con.createStatement();
			
			ResultSet rs = smt.executeQuery(sql);
			
			while (rs.next() ){
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goods_id"));
				goods.setSelluserId(rs.getString("selluser_id"));
				goods.setImgPath(rs.getString("img_path"));
				goods.setGoodsName(rs.getString("name"));
				goods.setPrice(rs.getInt("price"));
				goods.setQuantity(rs.getInt("quantity"));
				goods.setCategory(rs.getString("category"));
				goods.setGoodsMemo(rs.getString("goods_memo"));
				goods.setStatus(rs.getString("status"));
				goods.setExhibitDate(rs.getDate("exhibit_date"));
				goods.setBuyDate(rs.getDate("exhibit_date"));
				goods.setBuyuserId(rs.getString("exhibit_date"));
			}
			
		}catch(Exception e) {
			throw new IllegalStateException(e);
		}finally {
			if ( smt != null) {
				try {smt.close();}catch(SQLException ignore) {}
			}
			if ( con != null ) {
				try { con.close();}catch(SQLException ignore) {}
			}
		}
		return goodsList;
	}
	
	//商品登録機能
	public void insert( Goods goods ) {
		 Connection con = null;
		 Statement smt = null;
		 
		 //出品日時の取得
		 Date nowDate = new Date();
		 
		 //SQL文
		 String sql = "INSERT INTO goodsinfo (selluser_id, img_path, name, price, quantity, categoty, goods_memo, status, region, exhibit_date) VALUE ('"
				 + goods.getSelluserId() + "','" +  goods.getImgPath() + "','" + goods.getGoodsName() + "','" + goods.getPrice() + "','" + goods.getQuantity() + "','"
				 + goods.getCategory() + "','" + goods.getGoodsMemo() +"','"  + goods.getStatus() + "','" + goods.getRegion() + "','" + nowDate + "')";
		 
		  try{
			 con = getConnection();
			 smt = con.createStatement();
			 
			 smt.executeUpdate(sql); 
			 
		  }catch(Exception e) {
				throw new IllegalStateException(e);
			}finally {
				if ( smt != null) {
					try {smt.close();}catch(SQLException ignore) {}
				}
				if ( con != null ) {
					try { con.close();}catch(SQLException ignore) {}
				}
			}
	}
	
	//商品変更機能
	public void update(Goods goods){
		 
		  Connection con = null;
		  Statement smt = null;
		  
		  try{	
			  String sql= "UPDATE goodsinfo SET img_path = '" + goods.getImgPath() + "', name = '" + goods.getGoodsName() + "', price = '" + goods.getPrice()
			  + "', quantity = '" + goods.getQuantity() + "', categoty = '" + goods.getCategory() + "', region = '" + goods.getRegion() + "', goods_memo = '" + goods.getGoodsMemo()
			  + "' WHERE goods_id = '" + goods.getGoodsId()  + "'";
		  
			  con = getConnection();
			  smt = con.createStatement();
		  
			  smt.executeUpdate(sql);
	 	 
	  }catch(Exception e){
	    throw new IllegalStateException(e);
	  }finally{
	    if( smt != null ){
	      try{smt.close();}catch(SQLException ignore){}
	    }
	    if( con != null ){
	      try{con.close();}catch(SQLException ignore){}
	    }
	  }
	}
	
	public void delete(int goodsID){
		 
		  Connection con = null;
		  Statement smt = null;
		  //SQL文
		  String sql = "DELETE FROM goodsinfo WHERE goods_id = " + goodsID;

		  try{
		  
			  con = getConnection();
			  smt = con.createStatement();
			  
			  smt.executeUpdate(sql);
			  
			  }catch(Exception e){
				  throw new IllegalStateException(e);
				  }finally{
					  if( smt != null ){
						  try{smt.close();}catch(SQLException ignore){}}
					  if( con != null ){
						  try{con.close();}catch(SQLException ignore){}
						  }
					  }
	}
	
	//引数のユーザーIDが購入した商品のArrayListを返すメソッド
	public ArrayList<Goods> orderedGoods(String buyuser_id){

		Connection con = null;
		Statement smt = null;
		
		String sql = "SELECT * FROM goodsinfo WHERE buyuser_id = "+ buyuser_id + "ORDER BY buy_date";
		
		//
		ArrayList<Goods> orderedGoodsList = new ArrayList<Goods>();

	try {
		con = getConnection();
		smt = con.createStatement();

		ResultSet rs = smt.executeQuery(sql);
		
		while (rs.next()) {
			Goods goods = new Goods();
			
			goods.setGoodsId(rs.getInt("goods_id"));
			goods.setSelluserId(rs.getString("selluser_id"));
			goods.setImgPath(rs.getString("img_path"));
			goods.setGoodsName(rs.getString("name"));
			goods.setPrice(rs.getInt("price"));
			goods.setQuantity(rs.getInt("quantity"));
			goods.setCategory(rs.getString("category"));
			goods.setGoodsMemo(rs.getString("goods_memo"));
			goods.setStatus(rs.getString("status"));
			goods.setExhibitDate(rs.getDate("exhibit_date"));
			goods.setBuyDate(rs.getDate("buy_date"));
			goods.setBuyuserId(rs.getString("buyuser_id"));
			
			orderedGoodsList.add(goods);
		}

	} catch (Exception e) {
		throw new IllegalStateException(e);
	} finally {
		if (smt != null) {
			try {
				smt.close();
			} catch (SQLException ignore) {
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException ignore) {
			}
		}
	}
	return orderedGoodsList;
	}
	//他に必要な機能追加

}
