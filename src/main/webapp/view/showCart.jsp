<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods,util.MyFormat"%>

<%
//リクエストスコープに登録したグッズ情報を取得
ArrayList<Goods> orderList = (ArrayList<Goods>) session.getAttribute("orderList");

//価格表示用のフォーマット
MyFormat myformat = new MyFormat();

// 合計価格用の変数
int total = (int) request.getAttribute("total");
%>

<%@include file="/common/userHeader.jsp"%>

<hr
	style="text-align: center; height: 2px; background-color: black; width: 950px">
<h1 style="text-align: center; color: #000000;">カート内容</h1>
<hr
	style="text-align: center; height: 2px; background-color: black; width: 950px">
<p style="margin-top: 100px"></p>

<div style="margin-bottom: 250px">
	<div style="text-align: center">

		<html>
<head>
<title>カート内容</title>
</head>
<body>


	<table style="border: 1px; margin: auto; text-align: center">
		<tr>
			<th style="background-color: #ccff99; width: 200">商品画像</th>
			<th style="background-color: #ccff99; width: 200">グッズID</th>
			<th style="background-color: #ccff99; width: 200">出品者ID</th>
			<th style="background-color: #ccff99; width: 200">商品名</th>
			<th style="background-color: #ccff99; width: 200">金額</th>
			<th style="background-color: #ccff99; width: 200">個数</th>
			<th style="background-color: #ccff99; width: 200">カートから削除</th>
		</tr>


		<%
		if (orderList != null) {
			for (int i = 0; i < orderList.size(); i++) {
		%>

		<tr>

			<td><%=orderList.get(i).getImgPath()%></td>
			<td><%=orderList.get(i).getGoodsId()%></a></td>

			<td><%=orderList.get(i).getSelluserId()%></td>
			<td><%=orderList.get(i).getGoodsName()%></td>
			<td><%=myformat.moneyFormat(orderList.get(i).getPrice())%></td>
			<td><%=orderList.get(i).getQuantity()%></td>
			<td><a
				href="<%=request.getContextPath()%>/showCart?delno=<%=i%>">削除</a></td>


		</tr>

		<%
		}
		}
		%>
	</table>

	<p style="margin-top: 50px"></p>

	<table style="border: 1px; margin: auto; text-align: center">
		<tr>
			<th
				style="background-color: #ccff99; text-align: center; width: 200px">合計</th>

			<td><%=total%></td>
		</tr>
	</table>

	<p style="margin-top: 50px"></p>
	
	<form class="showCart-form"
		action="<%=request.getContextPath()%>/view/buyConfirm.jsp"
		method="get">
		<input type="submit" value="購入">
	</form>

	<p style="margin-top: 100px"></p>
	<%@include file="/common/userFooter.jsp"%>
</body>
		</html>