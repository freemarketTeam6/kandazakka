<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods, util.MyFormat" %>

<%
//リクエストスコープに登録した書籍情報を取得
Goods goods= (Goods)request.getAttribute("goods");
//MyFormatクラスのオブジェクトを生成
MyFormat format = new MyFormat();
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>出品商品変更完了</title>
</head>
<body style="background-color:#FFFFFF; text-align:center;">

	<h1>出品商品確認</h1>
	<hr>
	<div style="text-align: center">	
		<table style="margin: 0 auto">
		<br>
		<tr>以下の情報で商品情報を変更しました。</tr>		
			<tr>
				<th style="background-color: #00a7db; width: 100">写真</th>	
				<td style="text-align:center;"><img src="<%=request.getContextPath() %>/file/images/<%= goods.getImgPath() %>" alt="商品写真"></td>
			</tr>
			<br> 
			<tr>	
				<th style="background-color: #00a7db; width: 100">商品名</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=goods.getGoodsName()%></td>
			</tr>	
			<tr>	
				<th style="background-color: #00a7db; width: 100">価格</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%= goods.getPrice() %></td>
			</tr>
			<tr>	
				<th style="background-color: #00a7db; width: 100">個数</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%= goods.getQuantity() %></td>
			</tr>
			<tr>	
				<th style="background-color: #00a7db; width: 100">種類</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%= goods.getCategory() %></td>
			</tr>
			<tr>	
				<th style="background-color: #00a7db; width: 100">地域</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%= format.regionFormat(goods.getRegion()) %></td>
			</tr>
			<tr>
				<th style="background-color: #00a7db; width: 100">備考</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%= goods.getGoodsMemo() %></td>
			</tr>	
 			<br>
		</table>
		<br>
	</div>
	<form action="<%=request.getContextPath()%>/mygoodsList" method="get">
		<input type="submit" name="BackMygoods" value="出品一覧へ戻る"></input>
	</form>
</body>
</html>