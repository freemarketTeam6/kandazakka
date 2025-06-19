package bean;

public class Inquiries {

	private int inquiryno; //お問い合わせID
	private String user_id; //お問い合わせ送信者のID
	private String category; //お問い合わせカテゴリ
	private String title; //お問い合わせタイトル
	private String contents; //詳細メッセージ
	private String file_path; //添付ファイルのpass

	//コンストラクタ
	public Inquiries() {
		this.inquiryno = 0;
		this.user_id = null;
		this.category = null;
		this.title = null;
		this.contents = null;
		this.file_path = null;
	}

	//inquirynoのゲッターメソッド
	// フィールド変数inquirynoで管理された値を返す
	public int getInquiryno() {
		return inquiryno;
	}

	//inquirynoのセッターメソッド
	// 引数に受け取った値をフィールド変数inquirynoに格納する
	public void setInquiryno(int inquiryno) {
		this.inquiryno = inquiryno;
	}

	// user_idのゲッターメソッド
	// フィールド変数user_idで管理された値を返す
	public String getUser_id() {
		return user_id;
	}

	// user_idのセッターメソッド
	// 引数に受け取った値をフィールド変数user_idに格納する
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	// categoryのゲッターメソッド
	// フィールド変数categoryで管理された値を返す
	public String getCategory() {
		return category;
	}

	// categoryのセッターメソッド
	// 引数に受け取った値をフィールド変数categoryに格納する
	public void setCategory(String category) {
		this.category = category;
	}

	// titleのゲッターメソッド
	// フィールド変数titleで管理された値を返す
	public String getTitle() {
		return title;
	}

	// titleのセッターメソッド
	// 引数に受け取った値をフィールド変数titleに格納する
	public void setTitle(String title) {
		this.title = title;
	}

	// contentsのゲッターメソッド
	// フィールド変数contentsで管理された値を返す
	public String getContents() {
		return contents;
	}

	// contentsのセッターメソッド
	// 引数に受け取った値をフィールド変数contentsに格納する
	public void setContents(String contents) {
		this.contents = contents;
	}

	// file_pathのゲッターメソッド
	// フィールド変数file_pathで管理された値を返す
	public String getFile_path() {
		return file_path;
	}

	// file_pathのセッターメソッド
	// 引数に受け取った値をフィールド変数file_pathに格納する
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

}
