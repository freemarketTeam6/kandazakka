package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
	
	
	//全部持ってくる　selectALL()
	public ArrayList<Goods> selectAll(){
		Connection con = null;
		Statement smt = null;
		
		//戻り値用の配列宣言
		ArrayList<Goods> goodsList = new ArrayList<Goods>();
		
		String sql = "SELECT * FROM goodsinfo";
		
		try {
			ResultSet rs = smt.executeQuery(sql);
			
			while (rs.next() ){
				Goods goods = new Goods();
				goods.setGoodsId(rs.getString("goods_id"));
				goods.setSelluserId(rs.getString("selluser_id"));
				goods.setImgpath_id(rs.getString("img_path"));
				goods.setName(rs.getString("name"));
				goods.setPrice(rs.getInt("price"));
				goods.setQuantity(rs.getInt("quantity"));
				goods.setCategory(rs.getString("category"));
				goods.setGoods_memo(rs.getString("goods_memo"));
				goods.setStatus(rs.getString("status"));
				goods.setExhibit_date(rs.getDate("exhibit_date"));
				goods.setbuy_date(rs.getString("exhibit_date"));
			goods.setBuyuser_id(rs.getString("exhibit_date"));
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
	
	
	//マイページ表示用に、userID渡したらその人の商品を取得する　selectGoodsByUser
	
	//他に必要な機能追加

}
