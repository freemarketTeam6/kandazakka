<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="bean.Goods,dao.GoodsDAO"%>

<%@page import="java.util.*,bean.Goods,util.MyFormat"%>

<%
MyFormat myFormat = new MyFormat();
%>


<html>
<head>
<title>入金確認</title>
</head>

<body>
	<div style="text-align: center">
		<%@ include file="../common/userHeader.jsp"%>
		<h1
			style="text-align: center; color: #000000; background-color: #ccff99;">入金完了</h1>
		<p style="margin-top: 100px"></p>



		<p>購入商品情報を確認し、入金してください。</p>

		<%
		//送られてきた商品IDを取得
		String goodsIdString = (String) request.getParameter("goodsId");
		int goodsId = Integer.parseInt(goodsIdString);

		//商品IDをもとに商品オブジェクトを検索
		GoodsDAO goodsDao = new GoodsDAO();
		Goods goods = goodsDao.selectGoodsByGoodsID(goodsId);
		%>



		<table style="margin: auto">
			<tr>
				<th style="background-color: #ccff99">写真</th>
				<th style="background-color: #ccff99">商品名</th>
				<th style="background-color: #ccff99">個数</th>
				<th style="background-color: #ccff99">種類</th>
				<th style="background-color: #ccff99">備考</th>
				<th style="background-color: #ccff99">価格</th>
			</tr>
			<tr>
				<td><img
					src="<%=request.getContextPath()%>/file/images/<%=goods.getImgPath()%>"
					alt="商品写真"></td>
				<td><%=goods.getGoodsName()%></td>
				<td><%=goods.getQuantity()%></td>
				<td><%=goods.getCategory()%></td>
				<td><%=goods.getGoodsMemo()%></td>
				<td><%=myFormat.moneyFormat(goods.getPrice())%></td>
			<tr>
		</table>



		<form action="<%=request.getContextPath()%>/payment" method="get">
			<input type="hidden" name="goodsId" value="<%=goodsId%>"> <input
				type="submit" value="入金する">

		</form>

<br>
		<form action="<%=request.getContextPath()%>/buyList" method="get">
			<input type="submit" value="キャンセル">
		</form>


	</div>

	<%@include file="/common/userFooter.jsp"%>







</body>
</html>