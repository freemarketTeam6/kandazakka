<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods,util.MyFormat"%>

<%
//リクエストスコープに登録したグッズ情報を取得
ArrayList<Goods> orderList = (ArrayList<Goods>) session.getAttribute("orderList");

//価格表示用のフォーマット
MyFormat myformat = new MyFormat();

//合計金額表示用変数total
int total = 0;
%>

<%@include file="/common/userHeader.jsp"%>

<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
<h1 style="text-align: center; color: #000000;">カート内容</h1>

<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
<p style="margin-top: 100px"></p>


<div style="margin-bottom: 250px">
	<div style="text-align: center">

		<html>
<head>
<title>カート内容</title>
</head>
<body>



	<%
	if (orderList.size() != 0) {
	%>

	<table style="border: 1px;">
		<tr>
			<th style="background-color: #00a7db; width: 80">商品画像</th>
			<th style="background-color: #00a7db; width: 80">グッズID</th>
			<th style="background-color: #00a7db; width: 80">出品者ID</th>
			<th style="background-color: #00a7db; width: 80">商品名</th>
			<th style="background-color: #00a7db; width: 80">金額</th>
			<th style="background-color: #00a7db; width: 80">個数</th>
			<th style="background-color: #00a7db; width: 80">カートから削除</th>
		</tr>


		<%
		for (int i = 0; i < orderList.size(); i++) {
			total += orderList.get(i).getPrice();
		%>

		<tr>

			<td><img src="<%=request.getContextPath()%>/file/images/<%=orderList.get(i).getImgPath()%>" alt="商品写真"></td>
			<td><%=orderList.get(i).getGoodsId()%></a></td>

			<td><%=orderList.get(i).getSelluserId()%></td>
			<td><%=orderList.get(i).getGoodsName()%></td>
			<td><%=myformat.moneyFormat(orderList.get(i).getPrice())%></td>
			<td><%=orderList.get(i).getQuantity()%></td>

			<td><a href="<%=request.getContextPath()%>/showCart?delno=<%=i%>">削除</a></td>
		</tr>


		<%
		}
		%>

		<tr>
			<th style="background-color: #00a7db; text-align: center; width: 200px">合計</th>
			<td><%=myformat.moneyFormat(total)%></td>
		</tr>

	</table>

	<form class="showCart-form" action="<%=request.getContextPath()%>/buyConfirm">
		<input type="submit" value="購入">
	</form>

	<tr>
		<th style="background-color: #00a7db; text-align: center; width: 200px">合計</th>
		<td><%=myformat.moneyFormat(total)%></td>
	</tr>

	<%
	} else {
	%>

	<div padding:200px>
		<strong style="margin: auto; padding:">カート内は空です。</strong>
	</div>
	<%
	}
	%>




	<p style="margin-top: 100px"></p>
	<%@include file="/common/userFooter.jsp"%>
</body>
		</html>