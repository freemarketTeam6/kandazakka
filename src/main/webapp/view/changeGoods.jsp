<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods,util.MyFormat"%>

<%
//リクエストスコープに登録した書籍情報を取得
Goods goods= (Goods)request.getAttribute("goods");
//MyFormatクラスのオブジェクトを生成
MyFormat format = new MyFormat();
%>

<html>
<head>
<title>商品情報変更</title>
</head>

<!-- フォーマットと地域の値があっているか、Attributeの名前 -->

<h1>出品情報変更</h1>
<hr>
<form action="<%=request.getContextPath()%>/changeGoods" method="post">
	<table border="1">
		<tr>
			<th style="background-color: #00a7db; width: 100">写真</th>
			<td style="text-align: center;"><img src="<%= goods.getImgPath %>"
				alt="商品写真"></td>
			<td><input type="file" name="imgpath" value=""></td>
		</tr>
		<br>
		<tr>
			<th style="background-color: #00a7db; width: 100">商品名</th>
			<td style="text-align: center; color: #000000; font-size: 20px"><%=goods.getGoodsName()%></td>
			<td><input type="text" name="goodsid"></td>
		</tr>
		<tr>
			<th style="background-color: #00a7db; width: 100">価格</th>
			<td style="text-align: center; color: #000000; font-size: 20px"><%=format.yenFormat(goods.getPrice())%></td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<th style="background-color: #00a7db; width: 100">個数</th>
			<td style="text-align: center; color: #000000; font-size: 20px"><%=goods.getQuantity%></td>
			<td><input type="text" name="quantity"></td>
		</tr>
		<tr>
			<th style="background-color: #00a7db; width: 100">種類</th>
			<td style="text-align: center; color: #000000; font-size: 20px"><%=goods.getCategory%></td>
			<td><input type="text" name="category"></td>
		</tr>
		<tr>
			<th style="background-color: #00a7db; width: 100">地域</th>
			<td style="text-align: center; color: #000000; font-size: 20px"><%=format.RegionFormat(goods.getRegion)%></td>
			<td><select name="region">
					<option value="hokkaido">北海道</option>
					<option value="tohoku">東北</option>
					<option value="kanto">関東</option>
					<option value="tyubu">中部</option>
					<option value="kinki">近畿</option>
					<option value="tyugokushikoku">中国・四国</option>
					<option value="kyusyu">九州</option>
			</select></td>
		</tr>
		<tr>
			<th style="background-color: #00a7db; width: 100">備考</th>
			<td style="text-align: center; color: #000000; font-size: 20px"><%=goods.getMemo%></td>
			<td><input type="text" name="memo"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="更新"></td>
		</tr>
	</table>
</form>
<body>