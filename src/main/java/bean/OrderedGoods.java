package bean;

public class OrderedGoods {
		//グッズID
		private int goods_id;
		//カテゴリー
		private String category;
		//個数
		private int quantity;
		//価格
		private int price;
		//購入日
		private String buy_date;
		
		//コンストラクタ
		public OrderedGoods() {
			this.goods_id = 0;
			this.category = null;
			this.quantity = 0;
			this.price = 0;
			this.buy_date = null;
		}
		
		//グッズID
		public void setGoodsId(int goods_id) {
			this.goods_id = goods_id;
		}
		
		public int getGoodsId() {
			return goods_id;
		}
		
		//カテゴリー
		public void setCategory(String category) {
			this.category = category;
		}
		
		public String getCategory() {
			return category;
		}
		
		//個数
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		
		public int getQuantity() {
			return quantity;
		}
		
		//価格
		public void setPrice(int price) {
			this.price = price;
		}
		
		public int getPrice() {
			return price;
		}
		
		//購入日
		public void setBuyDate(String buy_date) {
			this.buy_date = buy_date;
		}
		
		public String getBuyDate() {
			return buy_date;
		}
}
