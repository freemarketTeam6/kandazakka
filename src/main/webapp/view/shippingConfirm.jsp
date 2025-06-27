<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods, bean.User, util.MyFormat"%>

<%
Goods goods = (Goods) request.getAttribute("goods");
%>

<html>
<head>
<title>発送完了</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/view/css/style.css">
</head>
<body>
	<style>
.img {
	width: 100%;
	height: 100%;
	max-height: 150px;
	object-fit: contain;
}
</style>
	<%@include file="../common/userHeader.jsp"%>
	<h1 style="text-align: center;">発送完了</h1>
	<hr size=5px color="black">

	<br>
	<br>
	<p style="text-align: center">
		<strong>商品の発送が完了しました</strong>
	</p>
	<br>

	<table style="width: 200; height: 150; margin: 0 auto; border-spacing: 0 10px; margin-top: 50px;text-align: center">
		<tr>
			<td style="background-color:  #ccff99">写真</td>
			<td><img class="img" src="<%=request.getContextPath()%>/file/images/<%=goods.getImgPath()%>" alt="商品写真"></td>
		<tr>
			<td style="background-color:  #ccff99">商品名</td>
			<td ><%=goods.getGoodsName()%></td>
		</tr>
		<tr>
			<td style="background-color:  #ccff99">個数</td>
			<td><%=goods.getQuantity()%></td>
		</tr>
		<tr>
			<td style="background-color:  #ccff99">種類</td>
			<td><%=goods.getCategory()%></td>
		</tr>
		<tr>
			<td style="background-color:  #ccff99">備考</td>
			<td><%=goods.getGoodsMemo()%></td>
		</tr>
		<tr>
			<td style="background-color:  #ccff99">価格</td>
			<td ><%=goods.getPrice()%></td>
		</tr>
	</table>

<br><br>
	<p style="text-align: center">
		<a href="<%=request.getContextPath()%>/mygoodsList">出品一覧に戻る</a>
	</p>
</body>
<%@include file="../common/userFooter.jsp"%>
</html>