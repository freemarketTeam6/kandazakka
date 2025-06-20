package util;

import java.text.NumberFormat;
import java.util.Locale;


public class MyFormat {
	
	public String moneyFormat(int price) { //\xxx,xxxの型にフォーマット
		String formatPrice = null;
		NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.JAPAN);//日本の通貨の型
		nf.setMaximumFractionDigits(0);//小数点以下の最大桁数を0桁に指定
		nf.setMinimumFractionDigits(0);//小数点以下の最小桁数を0桁に指定
		formatPrice = nf.format(price);//フォーマットの実行
		return formatPrice;
	}

	public String yenFormat(int price) {//xxx円の型にフォーマット
		String formatPrice = price + "円";
		return formatPrice;
	}

	//authorityフォーマット
	public String authorityFormat(String authority) {
		String formatAuthority = null;

		if (authority.equals("u")) {
			formatAuthority = "一般ユーザー";

		} else if (authority.equals("m")) {
			formatAuthority = "管理者";

		} else {
			formatAuthority = authority;

		}

		return formatAuthority;
	}

	//status（出品状態）フォーマット
	public String statusFormat(String status) {
		String formatStatus = null;

		if (status.equals("0")) {
			formatStatus = "出品中";

		} else if (status.equals("1")) {
			formatStatus = "入金待ち";

		} else if (status.equals("2")) {
			formatStatus = "発送待ち";

		} else if (status.equals("3")) {
			formatStatus = "発送完了";

		} else {
			formatStatus = status;

		}

		return formatStatus;
	}

	//category（お問い合わせカテゴリ）フォーマット
	public String categoryFormat(String category) {
		String formatCategory = null;

		switch (category) {
		case "0":
			formatCategory = "注文について";
			break;
		case "1":
			formatCategory = "アカウントについて";
			break;
		case "2":
			formatCategory = "支払いについて";
			break;
		case "3":
			formatCategory = "注文後トラブルについて";
			break;

		case "other":
			formatCategory = "その他";
			break;

		}

		return formatCategory;
	}
	
	//region（出品地域）フォーマット
	public String regionFormat(String region) {
		String formatRegion = null;

		switch (region) {
		case "0":
			formatRegion = "北海道地方";
			break;
		case "1":
			formatRegion = "東北";
			break;
		case "2":
			formatRegion = "関東";
			break;
		case "3":
			formatRegion = "中部";
			break;
		case "4":
			formatRegion = "近畿";
			break;
		case "5":
			formatRegion = "中国";
			break;
		case "6":
			formatRegion = "四国";
			break;
		case "7":
			formatRegion = "九州";
			break;
		case "8":
			formatRegion = "沖縄";
			break;
		
		}

		return formatRegion;
	}

}



