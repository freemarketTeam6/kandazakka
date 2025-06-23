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
<body>
	<div style="text-align: center">
		<%@ include file="/common/header.jsp"%>

		<%
		if (goodsList.isEmpty()) {
		%>

		<p style="font-size: 24px">
			<strong>商品未購入のため、購入履歴は表示できませんでした。</strong>
		</p>

		<%
		} else {
		%>

		<table style="margin: auto">
			<tr>
				<th>商品画像</th>
				<th>商品名</th>
				<th>価格</th>
				<th>数量</th>
				<th>種類</th>
				<th>購入日</th>
				<th>入金状況ステータス</th>
			</tr>

			<%
			for (int i = 0; i < goodsList.size(); i++) {
			%>

			<tr>
				<td><img src="<%=goods.getImgPath()%>" alt="商品写真"></td>
				<td><%=goods.getGoodsName()%></td>
				<td><%=myFormat.moneyFormat(goods.getPrice())%></td>
				<td><%=goods.getQuantity()%></td>
				<td><%=goods.getCategory()%></td>
				<td><%=goods.getBuyDate()%></td>
				<td>
					<form action="<%=request > getContextPath()%>/payment.jsp"
						method="post">
						<input type="submit" value="入金する"></input>
					</form>
				</td>
			</tr>

			<%
			}
		}
		%>

		</table>
		<br> <a href="<%=request.getContextPath()%>>mypage.jsp">マイページに戻る</a>
	</div>
	<%@include file="/common/footer.jsp"%>
</body>
</html>