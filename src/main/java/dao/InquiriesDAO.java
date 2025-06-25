package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Inquiries;

public class InquiriesDAO {
	

	//接続用の情報をフィールドに定数として定義
	private static final String RDB_DRIVE = "org.mariadb.jdbc.Driver";
	private static String URL = "jdbc:mariadb://localhost/kandazakkadb";
	private static String USER = "root";
	private static String PASS = "root123";

	// データベース接続を行うメソッド
	// データベース接続用定義を基にデータベースへ接続し、戻り値としてコネクション情報を返す
	private static Connection getConnection() {
		try {

			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			return con;

		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}

	public ArrayList<Inquiries> selectAll() {

		// 変数宣言
		Connection con = null; // DBコネクション
		Statement smt = null; // SQLステートメント

		//①検索したお問い合わせ情報を格納するArrayListオブジェクトを生成
		ArrayList<Inquiries> InquiriesList = new ArrayList<Inquiries>();

		try {
			//②SQL文を文字列として定義
			String sql = "SELECT * FROM inquiryinfo ORDER BY inquiryno";

			con = InquiriesDAO.getConnection();
			smt = con.createStatement();

			// SQL文発行
			ResultSet rs = smt.executeQuery(sql);

			// 検索結果をArrayListに格納
			while (rs.next()) {
				Inquiries inquiriesDto = new Inquiries();
				inquiriesDto.setInquiryno(rs.getInt("inquiryno"));
				inquiriesDto.setUser_id(rs.getString("user_id"));
				inquiriesDto.setCategory(rs.getString("category"));
				inquiriesDto.setTitle(rs.getString("title"));
				inquiriesDto.setContents(rs.getString("contents"));
				inquiriesDto.setFile_path(rs.getString("file_path"));
				InquiriesList.add(inquiriesDto);
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
		return InquiriesList;
	}

	public void insert(Inquiries Inquiries) {
		// 変数宣言
		Connection con = null; // DBコネクション
		Statement smt = null; // SQLステートメント

		// SQL文
		String sql = "INSERT INTO inquiryinfo  (inquiryno, user_id, category, title, contents, file_path) VALUES (NULL,'" + Inquiries.getUser_id() + "','"
				+ Inquiries.getCategory() + "','" + Inquiries.getTitle() + "','"
				+ Inquiries.getContents() + "','" + Inquiries.getFile_path() + "')";
				
		try {
			// DBに接続
			con = InquiriesDAO.getConnection();
			smt = con.createStatement();

			// SQL文発行
			smt.executeUpdate(sql);

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

	}

	//お問い合わせを削除するメソッド
	// 引数に渡されたお問い合わせ番号をデータベースから削除する
	public void delete(int inquiryno) {
		// 変数宣言
		Connection con = null; // DBコネクション
		Statement smt = null; // SQLステートメント

		String sql = "DELETE FROM inquiryinfo WHERE inquiryno = '" + inquiryno + "';";

		try {

			con = InquiriesDAO.getConnection();
			smt = con.createStatement();

			// SQL文発行
			smt.executeUpdate(sql);

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
	}

	// データベースから指定データの検索を行うメソッド
	// 指定したinquirynoに対応するデータをInquiriesへ格納し、戻り値として返す
	public Inquiries selectInquiry(int inquiryno) {
		// 変数宣言
		Connection con = null; // DBコネクション
		Statement smt = null; // SQLステートメント

		Inquiries Inquiries = new Inquiries();

		String sql = "SELECT * FROM inquiryinfo WHERE inquiryno='" + inquiryno + "';";

		try {

			con = InquiriesDAO.getConnection();
			smt = con.createStatement();

			ResultSet rs = smt.executeQuery(sql);

			// 検索結果をArrayListに格納
			while (rs.next()) {

				Inquiries inquiriesDto = new Inquiries();
				inquiriesDto.setInquiryno(rs.getInt("inquiryno"));
				inquiriesDto.setUser_id(rs.getString("user_id"));
				inquiriesDto.setCategory(rs.getString("category"));
				inquiriesDto.setTitle(rs.getString("title"));
				inquiriesDto.setContents(rs.getString("contents"));
				inquiriesDto.setFile_path(rs.getString("file_path"));

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
		return Inquiries;
	}
	
	public int inquiriesCount() {

		// 変数宣言
		Connection con = null; // DBコネクション
		Statement smt = null; // SQLステートメント

		int last_inquiryno = 0;

		try {
			//②SQL文を文字列として定義
			String sql = "SELECT * FROM inquiryinfo ORDER BY inquiryno DESC LIMIT 1";

			con = InquiriesDAO.getConnection();
			smt = con.createStatement();

			// SQL文発行
			ResultSet rs = smt.executeQuery(sql);

			// 検索結果をArrayListに格納
			if(rs.next()==false) {
				last_inquiryno=-1;
			}else {
			last_inquiryno = rs.getInt("inquiryno");
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
		return last_inquiryno;
	}
	
	public ArrayList<Inquiries> selectUser(String userid) {

		// 変数宣言
		Connection con = null; // DBコネクション
		Statement smt = null; // SQLステートメント

		//①検索したお問い合わせ情報を格納するArrayListオブジェクトを生成
		ArrayList<Inquiries> InquiriesList = new ArrayList<Inquiries>();

		try {
			//②SQL文を文字列として定義
			String sql = "SELECT * FROM inquiryinfo WHERE user_id = '" + userid + "' ORDER BY inquiryno";

			con = InquiriesDAO.getConnection();
			smt = con.createStatement();

			// SQL文発行
			ResultSet rs = smt.executeQuery(sql);

			// 検索結果をArrayListに格納
			while (rs.next()) {
				Inquiries inquiriesDto = new Inquiries();
				inquiriesDto.setInquiryno(rs.getInt("inquiryno"));
				inquiriesDto.setUser_id(rs.getString("user_id"));
				inquiriesDto.setCategory(rs.getString("category"));
				inquiriesDto.setTitle(rs.getString("title"));
				inquiriesDto.setContents(rs.getString("contents"));
				inquiriesDto.setFile_path(rs.getString("file_path"));
				InquiriesList.add(inquiriesDto);
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
		return InquiriesList;
	}

}
