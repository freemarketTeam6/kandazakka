package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
//	public ArrayList<Goods> selectAll(){
//		Connection con = null;
//		Statement smt = null;
		
		//戻り値用の配列宣言
//		ArrayList<Goods> goodsList = new ArrayList<Goods>();
//		
//		String sql = "SELECT * FROM goodsinfo";
//		
//		ResultSet rs = smt.executeQuery(sql);
//		
//		while (rs.next() ){
//			Goods goods = new Goods();
//			goods.setUserId(rs.getString("user_id"));
//			goods.setName(rs.getString("name"));
//			goods.setNameKana(rs.getString("name_kana"));
//			goods.setNickName(rs.getString("nickname"));
//			goods.setAddress(rs.getString("address"));
//			goods.setEmail(rs.getString("user_id"));
//			goods.setUserId(rs.getString("user_id"));
//		}
//	}
	
	
	//マイページ表示用に、userID渡したらその人の商品を取得する　selectGoodsByUser
	
	//

}
