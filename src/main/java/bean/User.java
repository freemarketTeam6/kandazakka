package bean;

public class User {
	private String userid; //ユーザーID
	private String username; //名前
	private String name_kana; //名前(カナ)
	private String nick_name; //ニックネーム
	private String address; //住所
	private String email; //メールアドレス
	private String password; //パスワード
	private String tell; //電話番号
	private String memo; //メモ
	private String authority; //権限（m：管理者、u：ユーザー）

	//初期化処理
	public User() {	
		this.userid=null;
		this.username=null;
		this.name_kana=null;
		this.nick_name=null;
		this.address=null;
		this.email=null;
		this.password=null;
		this.tell=null;
		this.memo=null;
		this.authority=null;
	}
	
	//取得と設定
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid=userid;
	}
	
	public String getName() {
		return username;
	}
	public void setName(String name) {
		this.username=name;
	}
	
	public String getNamekana() {
		return name_kana;
	}
	public void setNamekana (String name_kana) {
		this.name_kana=name_kana;
	}	
	
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name=nick_name;
	}
	
	public String getAddres() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password=password;
	}

	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell=tell;
	}
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo=memo;
	}
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority=authority;
	}
}

