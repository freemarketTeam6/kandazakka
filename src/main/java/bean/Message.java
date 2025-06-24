package bean;

import java.util.Date;

public class Message {
	
	private int messageId;
	private String userId;
	private int goodsId;
	private int inquiryNumber;
	private String message;
	private Date date;

	//↓inquiryinfoの情報
	private String category;
	private String title;
	private String filePath;
	
	//コンストラクタ
	public Message() {
		this.messageId = 0;
		this.userId = null;
		this.goodsId = 0;
		this.inquiryNumber = 0;
		this.message = null;
		this.date = null;
		this.category = null;
		this.title = null;
		this.filePath = null;
	}
	
	//アクセサメソッド	
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	
	public int getMessageId() {
		return messageId;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getGoodsId() {
		return goodsId;
	}
	
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	
	public int getInquiryNumber() {
		return inquiryNumber; 
	}
	
	public void setInquiryNumber(int inquiryNumber) {
		this.inquiryNumber = inquiryNumber;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getCateory() {
		return category;
	}
	
	public void setCategory( String category) {
		this.category = category;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


}
