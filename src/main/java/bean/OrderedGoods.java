package bean;

public class OrderedGoods {
		//グッズID
		private int goodsid;
		//カテゴリー
		private String category;
		//個数
		private int quantity;
		//価格
		private int price;
		//購入日
		private String buydate;
		
		//コンストラクタ
		public OrderedGoods() {
			this.goodsid = 0;
			this.category = null;
			this.quantity = 0;
			this.price = 0;
			this.buydate = null;
		}
		
		//グッズID
		public void setUserid(int goodsid) {
			this.goodsid = goodsid;
		}
		
		public int getGoodsId() {
			return goodsid;
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
		public void setBuydate(String buydate) {
			this.buydate = buydate;
		}
		
		public String getBuydate() {
			return buydate;
		}
}
