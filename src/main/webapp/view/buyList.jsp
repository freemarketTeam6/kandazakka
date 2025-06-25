<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*, bean.Goods, util.MyFormat"%>

<%
ArrayList<Goods> goodsList = (ArrayList<Goods>) request.getAttribute("goodsList");

MyFormat myFormat = new MyFormat();
%>

<html>
<head>
<title>購入履歴</title>
</head>
	<style>
.img {
	width: 100%;
	height: 100%;
	max-height: 150px;
	object-fit: contain;
}

.showCart {
	min-width: 300px;
	width: auto;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
}
</style>

<body>
	<div style="text-align: center">
		<%@ include file="../common/userHeader.jsp"%>
		<h1 style="text-align: center; color: #000000;background-color:#ccff99;">購入履歴</h1>
		<p style="margin-top: 100px"></p>

		<%
		if (goodsList.isEmpty()) {
		%>

		<p style="font-size: 24px; text-align: center">
			<strong>商品未購入のため、購入履歴は表示できませんでした。</strong>
		</p>

		<%
		} else {
		%>

		<table style="margin: auto">
			<tr>
				<th style="background-color: #ccff99">商品画像</th>
				<th style="background-color: #ccff99">商品名</th>
				<th style="background-color: #ccff99">価格</th>
				<th style="background-color: #ccff99">数量</th>
				<th style="background-color: #ccff99">種類</th>
				<th style="background-color: #ccff99">購入日</th>
				<th style="background-color: #ccff99">入金状況ステータス</th>
			</tr>

			<%
			for (int i = 0; i < goodsList.size(); i++) {
				if ( goodsList.get(i).getStatus().equals("1")){
			%>

			<tr>
				<td><img class="img" src="<%=request.getContextPath() %>/file/images/<%= goodsList.get(i).getImgPath() %>" alt="商品写真"></td>
				<td><%=goodsList.get(i).getGoodsName()%></td>
				<td><%=myFormat.moneyFormat(goodsList.get(i).getPrice())%></td>
				<td><%=goodsList.get(i).getQuantity()%></td>
				<td><%=goodsList.get(i).getCategory()%></td>
				<td><%=goodsList.get(i).getBuyDate()%></td>
				
				<td>
					<form action="<%=request.getContextPath()%>/view/payment.jsp"
						method="post">
						<input type="hidden" name="goodsId" value="<%=goodsList.get(i).getGoodsId()%>">
						<input type="submit" value="入金する"></input>
					</form>
				</td>
			</tr>

			<%
			}
			}
		}
		%>

		</table>
		<p style="margin-top:100px"></p>
		<br>
		<p style="text-align: center">		
			<a href="<%=request.getContextPath()%>/view/mypage.jsp" method="POST">マイページに戻る</a>
		</p>
	</div>
	<%@include file="../common/userFooter.jsp"%>
</body>
</html>
