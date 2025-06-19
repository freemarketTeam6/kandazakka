package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderedGoodsDAO {

// データベース接続情報
	private static String RDB_DRIVE = "org.mariadb.jdbc.Driver";
	private static String URL = "jdbc:mariadb://localhost/kandazakkadb";
	private static String USER = "root";
	private static String PASS = "root123";

	// データベース接続情報を利用してデータベースに接続するクラスメソッド
private static Connection getConnection() {
		try {
			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			return con;

		} catch (Exception e) {
			throw new IllegalStateException(e);
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
		
		Goods.setGoodsId(rs.getString("goods_id"));
		Goods.setSelluserId(rs.getString("selluser_id"));
		Goods.setImgPath(rs.getString("img_path"));
		Goods.setGoodsName(rs.getString("name"));
		Goods.setPrice(rs.getString("price"));
		Goods.setQuantity(rs.getString("quantity"));
		Goods.setCategory(rs.getString("category"));
		Goods.setGoodsMemo(rs.getString("goods_memo"));
		Goods.setStatus(rs.getString("status"));
		Goods.setExhibitDate(rs.getString("exhibit_date"));
		Goods.setBuyDate(rs.getString("buy_date"));
		Goods.setBuyuserId(rs.getString("buyuser_id"));

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



}
