package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Message;

public class MessageDAO {
	
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

	//問い合わせID(inquiryNo)をもとに、inquiry_messagesから問い合わせのメッセージ内容を取得するメソッド
	public ArrayList<Message> selectMessageByInquiryNo(int inquiryNo){
		
		Connection con = null;
		Statement smt = null;
		
		//戻り値用のMessage型のArrayListを宣言
		ArrayList<Message> messageList = new ArrayList<Message>();
		
		//SQL文定義
		String sql = "SELECT * FROM inquiry_messages WHERE inquiry_no = " + inquiryNo;
		
		try {
			con = getConnection();
			smt = con.createStatement();
			
			ResultSet rs = smt.executeQuery("sql");
			
			while( rs.next() ) {
				Message message = new Message();
				message.setMessageId(rs.getInt("inquiry_messages_id"));
				message.setUserId(rs.getString("user_id"));
				message.setInquiryNumber(rs.getInt("inquiryno"));
				message.setMessage(rs.getString("message"));
				message.setDate(rs.getDate("date"));
				messageList.add(message);
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
		
		return messageList;
	}
	
	//goodsIDをもとに、goods_messagesからメッセージを取得するメソッド
	public ArrayList<Message> selectMessageByGoodsId(int goodsId){
		
		Connection con = null;
		Statement smt = null;
		
		//戻り値用のMessage型のArrayListを宣言
		ArrayList<Message> messageList = new ArrayList<Message>();
		
		//SQL文定義
		String sql = "SELECT * FROM goods_messages WHERE goods_id = " + goodsId;
		
		try {
			con = getConnection();
			smt = con.createStatement();
			
			ResultSet rs = smt.executeQuery("sql");
			
			while( rs.next() ) {
				Message message = new Message();
				message.setMessageId(rs.getInt("goods_messages_id"));
				message.setUserId(rs.getString("user_id"));
				message.setGoodsId(rs.getInt("goods_id"));
				message.setMessage(rs.getString("message"));
				message.setDate(rs.getDate("date"));
				messageList.add(message);
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
		
		return messageList;
	}	
	
	//チャット内容をinquiry_messagesに追加するメソッド
	public void insertMesssageIntoInquiryMessages(Message message) {
		Connection con = null;
		Statement smt = null;
		
		//SQL文
		String sql = "INSERT INTO inquiry_messages(user_id, inquiryno, message, date) VALUES("
				+ message.getUserId() + "'," + message.getInquiryNumber() + ",'" 
				+ message.getMessage() + "'," + message.getDate() + ")";
		try {
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
	
	//チャット内容をgoods_messagesに追加するメソッド
	public void insertMesssageIntoGoodsMessages(Message message) {
		
		Connection con = null;
		Statement smt = null;
		
		//SQL文
		String sql = "INSERT INTO goods_messages(user_id, goods_id, message, date) VALUES("
				+ message.getUserId() + "'," + message.getGoodsId() + ",'" 
				+ message.getMessage() + "'," + message.getDate() + ")";
		try {
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
	

	

}
