package bean;

import java.util.Date;

public class Message {
	
	private int messageId;
	private String userId;
	private int goodsId;
	private int inquiryNumber;
	private String message;
	private Date date;
	
	//コンストラクタ
	public Message() {
		this.messageId = 0;
		this.userId = null;
		this.goodsId = 0;
		this.inquiryNumber = 0;
		this.message = null;
		this.date = null;
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


}
