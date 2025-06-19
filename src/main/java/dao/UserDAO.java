package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.User;

public class UserDAO {

	// データベース接続情報
	private static String RDB_DRIVE = "org.mariadb.jdbc.Driver";
	private static String URL = "jdbc:mariadb://localhost/kandazakkadb"; // 変更点
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
	
	// ユーザー名とパスワードが一致したらユーザー情報を全取得
	public User selectByUser(String userid, String password) {
		
		Connection con = null;
		Statement smt = null;
		
		User user = new User();
		
		try {
			con =getConnection();
			smt = con.createStatement();
			
			// SQL文
			String sql = "SELECT * FROM userinfo WHERE user ='"+userid+"' AND password='"+password+"'";
			
			ResultSet rs = smt.executeQuery(sql);

			/*
			// ユーザー情報をuserオブジェクトに格納
			if (rs.next()) {
				user.setUserid(rs.getString("user_id"));
				user.setName(rs.getString("name"));
				user.setNameKana(rs.getString("name_kana"));
				user.setNickname(rs.getString("nickname"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setTell(rs.getString("tell"));
				user.setmemo(rs.getString("memo"));
				user.setAuthority(rs.getString("authority"));
			}
			*/
			
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
		return user;
	}

}
