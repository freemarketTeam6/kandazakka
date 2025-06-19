package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Goods;

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
		
		goods.setGoodsId(rs.getString("goods_id"));
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



}
