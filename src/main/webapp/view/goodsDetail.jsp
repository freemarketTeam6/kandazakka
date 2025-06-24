<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.Goods, util.MyFormat"%>

<%
Goods goods = (Goods) request.getAttribute("goods");

MyFormat myFormat = new MyFormat();
%>

<html>
<head>
<title>商品詳細</title>
</head>
<body>
	<div style="text-align: center">
		<%@ include file="/common/userHeader.jsp"%>
		
		<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
		<h1 style="text-align: center; color: #000000;">商品詳細</h1>
		<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
		<p style="margin-top: 100px"></p>

		<p style="text-align: center">
			<img src="<%=goods.getImgPath()%>" alt="商品写真">
		</p>
		
		<p style="margin-top: 25px"></p>
		
		<p style="font-size: 24px; text-align: center">
			<strong><%=goods.getGoodsName()%></strong>
		</p>
		
		<p style="margin-top: 25px"></p>
		
		<p style="font-size: 20px; text-align: center">
			<%=myFormat.moneyFormat(goods.getPrice())%>
		</p>
		
		<p style="margin-top: 25px"></p>

		<table style="margin: auto">
			<tr>
				<th style="background-color: #ccff99; width: 200px">商品の数量</th>
				<td><%=goods.getQuantity()%></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 200px">商品の種類</th>
				<td><%=goods.getCategory()%></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 200px">出品日</th>
				<td><%=goods.getExhibitDate()%></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 200px">出品地域</th>
				<td><%=myFormat.regionFormat(goods.getRegion())%></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 200px">商品の説明</th>
				<td style="white-space: pre-line"><%=goods.getGoodsMemo()%></td>
			</tr>
		</table>

		<p style="margin-top: 50px"></p>

		<div style="text-align: center">
			<form action="<%=request.getContextPath()%>/insertCart" method="get">
				<input type="submit" value="カートに入れる">
				<input type="hidden" name="goodsId" value="<%=goods.getGoodsId()%>">
			</form>
		</div>
		
		<p style="margin-top: 25px"></p>

		<!-- 未ログインの場合にログインページへ遷移する処理は「message.jsp」と「InsertCartServlet」でやる -->
		<p style="text-align: center">
			<a href="<%=request.getContextPath()%>/message?goods_id=<%=goods.getGoodsId()%>&cmd=list">メッセージ></a>
		</p>

	</div>
	<p style="margin-top: 100px"></p>
	<%@include file="/common/userFooter.jsp"%>
</body>
</html>