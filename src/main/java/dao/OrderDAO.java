package dao;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import bean.Order;

public class OrderDAO {
	// データベース接続情報
	private static String RDB_DRIVE = "org.mariadb.jdbc.Driver";
	private static String URL = "jdbc:mariadb://localhost/kandazakkadb";
	private static String USER = "root";
	private static String PASS = "root123";

	// データベースに接続するクラスメソッド
	private static Connection getConnection() {
		try {
			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			return con;
		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}

	// 購入したい商品をカートに追加するインスタンスメソッド
	public void insert(Order order) {

		Connection con = null;
		Statement smt = null;

		try {
			String sql = "INSERT INTO goodsinfo(goods_id,selluser_id,img_path,name,price,quantity,category,goods_memo,status,exhibit_date,buy_date,buyuser_id) "
					+ "VALUES('" + order.getGoodsId() + "','" + order.getSelluserId() + "','" + order.getImgPath()
					+ "','" + order.getGoodsName() + "','" + order.getPrice() + "'," + "'" + order.getQuantity() + "',"
					+ "'" + order.getCategory() + "','" + order.getGoodsMemo() + "','" + order.getStatus() + "','"
					+ order.getExhibitDate() + "','" + order.getBuyDate() + "','" + order.getBuyuserId() + "')";

			con = getConnection();
			smt = con.createStatement();
			smt.executeUpdate(sql);

		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			try {
				if (smt != null) {
					smt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException ignore) {
			}
		}
	}

}

// カートに入っている商品を購入するインスタンスメソッド
