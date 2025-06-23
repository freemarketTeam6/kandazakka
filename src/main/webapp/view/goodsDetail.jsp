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
		<img src="<%=goods.getImgPath()%>" alt="商品写真"> <br> <br>
		<p style="font-size: 24px">
			<strong><%=goods.getGoodsName()%></strong>
		</p>
		<br> <br>
		<p style="font-size: 20px"><%=myFormat.moneyFormat(goods.getPrice())%></p>
		<br>

		<table style="margin: auto">
			<tr>
				<th>商品の数量：</th>
				<td><%=goods.getQuantity()%></td>
			</tr>
			<tr>
				<th>商品の種類：</th>
				<td><%=goods.getCategory()%></td>
			</tr>
			<tr>
				<th>商品の状態：</th>
				<td><%=goods.getStatus()%></td>
			</tr>
			<tr>
				<th>出品日：</th>
				<td><%=goods.getExhibitDate()%></td>
			</tr>
			<tr>
				<th>出品地域：</th>
				<td><%=goods.getRegion()%></td>
			</tr>
			<tr>
				<th>商品の説明：</th>
				<td><%=goods.getGoodsMemo()%></td>
			</tr>
		</table>

		<!-- 未ログインの場合にログインページへ遷移する処理は「message.jsp」と「InsertCartServlet」でやる -->
		<a href="<%=request.getContextPath()%>/view/message.jsp">メッセージ></a> <br>
		<br>
		<form action="<%=request.getContextPath()%>/InsertCartServlet"
			method="post">
			<input type="submit" value="カートに入れる"></input>
		</form>
	</div>
	<%@include file="/common/userFooter.jsp"%>
</body>
</html>