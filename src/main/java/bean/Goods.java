package bean;

import java.util.Date;

public class Goods {

	// グッズIDを格納する変数
	private int goodsId;
	// 出品者のIDを格納する変数
	private String selluserId;
	// 画像のパスを格納する変数
	private String imgPath;
	// グッズの名前
	private String goodsName;
	// グッズの値段
	private int price;
	// グッズの個数
	private int quantity;
	// グッズの種類
	private String category;
	// グッズの状態、商品説明
	private String goodsMemo;
	// 出品のステータス
	private String status;
	// 出品日
	private Date exhibitDate;
	// 購入日
	private Date buyDate;
	// 購入者のID
	private String buyuserId;
	// 出品地域
	private String region;

	// グッズID
	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	// 購入者ID
	public String getSelluserId() {
		return selluserId;
	}

	public void setSelluserId(String selluserId) {
		this.selluserId = selluserId;
	}

	// 画像パス
	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	// グッズの名前
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	// グッズの値段
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	// グッズの数量
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	// グッズの種類
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	// グッズのメモ
	public String getGoodsMemo() {
		return goodsMemo;
	}

	public void setGoodsMemo(String goodsMemo) {
		this.goodsMemo = goodsMemo;
	}

	// グッズの状態
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// グッズの出品日
	public Date getExhibitDate() {
		return exhibitDate;
	}

	public void setExhibitDate(Date exhibitDate) {
		this.exhibitDate = exhibitDate;
	}

	// グッズの購入日
	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	// 購入者のID
	public String getBuyuserId() {
		return buyuserId;
	}

	public void setBuyuserId(String buyuserId) {
		this.buyuserId = buyuserId;
	}

	// グッズID
	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
}