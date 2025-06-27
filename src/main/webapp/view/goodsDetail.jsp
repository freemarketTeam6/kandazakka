<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.Goods, util.MyFormat"%>

<%
Goods goods = (Goods) request.getAttribute("goods");

MyFormat myFormat = new MyFormat();
%>
<style>
.img {
	width: 100%;
	height:100%;
	max-height: 150px;
	object-fit: contain;
}

.submit{
	margin-top: 30px;
}

</style>
<html>
<head>
<title>商品詳細</title>
</head>
<body>
	<div style="text-align: center">
		<%@ include file="/common/userHeader.jsp"%>
		
		<h1 style="text-align: center; color: #000000;background-color:#ccff99;">商品詳細</h1>
		
		<p style="margin-top: 100px"></p>

		<p style="text-align: center">
			<img class="img" src="<%=request.getContextPath() %>/file/images/<%= goods.getImgPath() %>"  style="width:300" alt="商品写真">
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
		
		<!--  セッションのユーザーがnullだったら、カートに入れるボタンを押したときにログイン画面に飛ぶ -->
		<% if ( user == null ){ %>
		<div style="text-align: center" class="submit">
			<form action="<%=request.getContextPath()%>/login" method="POST">
				<input type="submit" value="カートに入れる">
				<input type="hidden" name="from" value="user">
			</form>
		</div>
		
		<div style="text-align: center" class="submit">
			<form action="<%=request.getContextPath()%>/login" method="POST">
				<input type="submit" value="メッセージ">
				<input type="hidden" name="from" value="user">
			</form>
		</div>			
		<% } else { %>
			<!-- ログインしているユーザーと出品者のユーザーが同じとき、メッセージへのリンクのみ表示 -->
			<% if ( user.getUserid().equals(goods.getSelluserId())){ %>
			
			<div style="text-align: center" class="submit">
			<form action="<%=request.getContextPath()%>/message" method="get">
				<input type="submit" value="メッセージ">
				<input type="hidden" name="goods_id" value="<%=goods.getGoodsId()%>">
				<inpu type="hidden" name="cmd" value="list">
			</form>
			</div>			
			<% } else { %>

		<div style="text-align: center" class="submit">
			<form action="<%=request.getContextPath()%>/insertCart" method="get">
				<input type="submit" value="カートに入れる">
				<input type="hidden" name="goodsId" value="<%=goods.getGoodsId()%>">
			</form>
		</div>
		
			<div style="text-align: center" class="submit">
			<form action="<%=request.getContextPath()%>/message" method="get">
				<input type="submit" value="メッセージ">
				<input type="hidden" name="goods_id" value="<%=goods.getGoodsId()%>">
				<inpu type="hidden" name="cmd" value="list">
			</form>
			</div>				
				
		<% } %>
		<% } %>

	</div>
	<p style="margin-top: 100px"></p>
	<%@include file="/common/userFooter.jsp"%>
</body>
</html>