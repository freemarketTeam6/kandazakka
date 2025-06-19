package bean;

public class Order {
	private int goods_id;
	private String selluser_id;
	private String img_path;
	private String goods_name;
	private int price;
	private int quantity;
	private String category;
	private String goods_memo;
	private String status;
	private String exhibit_date;
	private String buy_date;
	private String buyuser_id;

	// 変数初期化
	public Order() {
		goods_id = 0;
		selluser_id = null;
		img_path = null;
		goods_name = null;
		price = 0;
		quantity = 0;
		category = null;
		goods_memo = null;
		status = null;
		exhibit_date = null;
		buy_date = null;
		buyuser_id = null;
	}

	// 対象グッズのＩＤ
	public int getGoodsId() {
		return goods_id;
	}

	public void setGoodsId(int goods_id) {
		this.goods_id = goods_id;
	}

	// 出品者のID
	public String getSelluserId() {
		return selluser_id;
	}

	public void setSelluserId(String selluser_id) {
		this.selluser_id = selluser_id;
	}

	// 画像のパス
	public String getImgPath() {
		return img_path;
	}

	public void setImgPath(String img_path) {
		this.img_path = img_path;
	}

	// グッズの名前
	public String getGoodsName() {
		return goods_name;
	}

	public void setGoodsName(String goods_name) {
		this.goods_name = goods_name;
	}

	// グッズの値段
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	// グッズの個数
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	// 種類
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	// 状態・商品説明
	public String getGoodsMemo() {
		return goods_memo;
	}

	public void setGoodsMemo(String goods_memo) {
		this.goods_memo = goods_memo;
	}

	// 出品状態
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// 出品日
	public String getExhibitDate() {
		return exhibit_date;
	}

	public void setExhibitDate(String exhibit_date) {
		this.exhibit_date = exhibit_date;
	}

	// 購入日
	public String getBuyDate() {
		return buy_date;
	}

	public void setBuyDate(String buy_date) {
		this.buy_date = buy_date;
	}

	// 購入者のID
	public String getBuyuserId() {
		return buyuser_id;
	}

	public void setBuyuserId(String buyuser_id) {
		this.buyuser_id = buyuser_id;
	}

}