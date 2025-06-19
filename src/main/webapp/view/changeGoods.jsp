<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>商品情報変更</title>
</head>

<h1>出品情報変更</h1>
<hr>
<table border="1">
	<tr>
		<th style="background-color: #00a7db; width: 100">写真</th>
		<td style="text-align: center;"><img src="img/img04.jpg"
			alt="商品写真"></td>
		<td><input type="file" name="test"></td>
	</tr>
	<br>
	<tr>
		<th style="background-color: #00a7db; width: 100">商品名</th>
		<td style="text-align: center; color: #000000; font-size: 20px">変更前データ</td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<th style="background-color: #00a7db; width: 100">価格</th>
		<td style="text-align: center; color: #000000; font-size: 20px">変更前データ</td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<th style="background-color: #00a7db; width: 100">個数</th>
		<td style="text-align: center; color: #000000; font-size: 20px">変更前データ</td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<th style="background-color: #00a7db; width: 100">種類</th>
		<td style="text-align: center; color: #000000; font-size: 20px">変更前データ</td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<th style="background-color: #00a7db; width: 100">地域</th>
		<td style="text-align: center; color: #000000; font-size: 20px">変更前データ</td>
		<td><select name="area">
				<option value="hokkaido">北海道</option>
				<option value="tohoku">東北</option>
				<option value="kanto">関東</option>
				<option value="tyubu">中部</option>
				<option value="kinki">近畿</option>
				<option value="tyugokushikoku">中国・四国</option>
				<option value="kyusyu">九州</option>	
			</select>
		</td>
	</tr>
	<tr>
		<th style="background-color: #00a7db; width: 100">備考</th>
		<td style="text-align: center; color: #000000; font-size: 20px">変更前データ</td>
		<td><input type="text"></td>
	</tr>
	<tr><td colspan="3"><input type="submit" value="更新"></td></tr>
</table>
<body>