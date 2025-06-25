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
		<%@ include file="../common/userHeader.jsp"%>
		<p style="margin-top:100px"></p>

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
				<td><img src="<%=request.getContextPath() %>/file/images/<%= goodsList.get(i).getImgPath() %>" alt="商品写真"></td>
				<td><%=goodsList.get(i).getGoodsName()%></td>
				<td><%=myFormat.moneyFormat(goodsList.get(i).getPrice())%></td>
				<td><%=goodsList.get(i).getQuantity()%></td>
				<td><%=goodsList.get(i).getCategory()%></td>
				<td><%=goodsList.get(i).getBuyDate()%></td>
				<td>
					<form action="<%=request.getContextPath()%>/payment.jsp"
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
		<p style="margin-top:100px"></p>
		<br>
		<p style="text-align: center">		
			<a href="<%=request.getContextPath()%>/view/mypage.jsp" method="POST">マイページに戻る</a>
		</p>
	</div>
	<%@include file="../common/userFooter.jsp"%>
</body>
</html>
