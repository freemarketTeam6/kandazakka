package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class OrderedGoodsDAO {

// データベース接続情報
	private static String RDB_DRIVE = "org.mariadb.jdbc.Driver";
	private static String URL = "jdbc:mariadb://localhost/kandazakkadb";
	private static String USER = "root";
	private static String PASS = "root123";

private static Connection getConnection() {
		try {
			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			return con;

		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}




}
