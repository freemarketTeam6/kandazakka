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

.buyList {
	width:75%;
	margin: 20px auto;
	border-collapse:collapse;
}

.buyList tr td{
	padding: 5px;
}

.buyList #imgBox{
	height: 110px;
	width: 110px;
	'
}

.buyList #goodsName{
	width: 250px;
}

.buyList #price{
	width: 100px;
	text-align: right;
}

.buyList #quantity{
	width: 100px;
	text-align: center;
}

.buyList #category{
	width: 150px;
	text-align: center;
}

.buyList #buyDate{
	width: 150px;
	text-align: center;
}

.buyList #status{
	width: 150px;
	text-align: center;
}

.border{
	border-bottom: 1px solid #000000;
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

		<table style="margin: auto" class="buyList">
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
				if ( goodsList.get(i).getStatus().equals("1") || goodsList.get(i).getStatus().equals("2") || goodsList.get(i).getStatus().equals("3")){
			%>

			<tr class="border">
				<td id="imgBox"><img class="img" src="<%=request.getContextPath() %>/file/images/<%= goodsList.get(i).getImgPath() %>" alt="商品写真"></td>
				<td id="goodsName"><%=goodsList.get(i).getGoodsName()%></td>
				<td id="price"><%=myFormat.moneyFormat(goodsList.get(i).getPrice())%></td>
				<td id="quantity"><%=goodsList.get(i).getQuantity()%></td>
				<td id="category"><%=goodsList.get(i).getCategory()%></td>
				<td id="buyDate"><%=goodsList.get(i).getBuyDate()%></td>
				
				
				<% if ( goodsList.get(i).getStatus().equals("1")){ %>
				<td id="status">
					<form action="<%=request.getContextPath()%>/view/payment.jsp"
						method="post">
						<input type="hidden" name="goodsId" value="<%=goodsList.get(i).getGoodsId()%>">
						<input type="submit" value="入金する"></input>
					</form>
				</td>
				<% }else if ( goodsList.get(i).getStatus().equals("2")){ %>
				<td id="status">
					<p>入金済み</p>
				</td>	
				<% }else if ( goodsList.get(i).getStatus().equals("3")){ %>
				<td id="status">
					<p>発送済み</p>
				</td>	
				<% } %>
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
