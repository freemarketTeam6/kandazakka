package bean;

import java.util.Date;

public class Goods {

	// グッズIDを格納する変数
	private String goods_id;
	// 出品者のIDを格納する変数
	private String selluser_id;
	// 画像のパスを格納する変数
	private String img_path;
	// グッズの名前
	private String name;
	// グッズの値段
	private int price;
	// グッズの個数
	private int quantity;
	// グッズの種類
	private String category;
	// グッズの状態、商品説明
	private String goods_memo;
	// 出品のステータス
	private String status;
	// 出品日
	private Date exhibit_date;
	// 購入日
	private Date buy_date;
	// 購入者のID
	private String buyuser_id;

	// グッズID
	public String goods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	// 購入者ID
	public String selluser_id() {
		return selluser_id;
	}

	public void setSelluser_id(String selluser_id) {
		this.selluser_id = selluser_id;
	}

	// 画像のパス
	public String img_path() {
		return img_path;
	}

	public void setImgpath_id(String img_path) {
		this.img_path = img_path;
	}

	//グッズの名前
	public String name() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	//グッズの値段
	public int price() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	//グッズの数量
	public int quantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	//グッズの種類
	public String category() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	//グッズのメモ
	public String goods_memo() {
		return goods_memo;
	}

	public void setGoods_memo(String goods_memo) {
		this.goods_memo = goods_memo;
	}
	
	//グッズの状態
	public String status() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	//グッズの出品日
	public Date exhibit_date() {
		return exhibit_date;
	}

	public void setExhibit_date(Date exhibit_date) {
		this.exhibit_date = exhibit_date;
	}
	
	//グッズの購入日
	public Date buy_date() {
		return buy_date;
	}

	public void buy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	
	//購入者のID
	public String buyuser_id() {
		return buyuser_id;
	}

	public void buyuser_id(String buyuser_id) {
		this.buyuser_id = buyuser_id;
	}
}