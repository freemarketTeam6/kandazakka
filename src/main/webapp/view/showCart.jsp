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




<h1 style="text-align: center; color: #000000;background-color:#ccff99;">カート内容</h1>
<br>

<p style="margin-top: 100px"></p>


<div style="margin-bottom: 250px">
	<div style="text-align: center">

		<html>
<head>
<title>カート内容</title>
</head>
<body>

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

	<%
	if (orderList.size() != 0) {
	%>

	<table class="showCart" style="border: 1px;text-align:center">
		<tr>
			<th style="background-color: #00a7db; width: 80">商品画像</th>
<!-- 			<th style="background-color: #00a7db; width: 80">グッズID</th> -->
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

			<td><img class="img"
				src="<%=request.getContextPath()%>/file/images/<%=orderList.get(i).getImgPath()%>"
				alt="商品写真"></td>
			<td><%=orderList.get(i).getGoodsId()%></a></td>

<%-- 			<td><%=orderList.get(i).getSelluserId()%></td> --%>
			<td><%=orderList.get(i).getGoodsName()%></td>
			<td><%=myformat.moneyFormat(orderList.get(i).getPrice())%></td>
			<td><%=orderList.get(i).getQuantity()%></td>

			<td><a
				href="<%=request.getContextPath()%>/showCart?delno=<%=i%>">削除</a></td>
		</tr>


		<%
		}
		%>

		<tr>
			<th
				style="background-color: #00a7db; text-align: center; width: 200px">合計</th>
			<td><%=myformat.moneyFormat(total)%></td>
		</tr>

	</table>


<br><br><br>

	<form class="showCart-form"
		action="<%=request.getContextPath()%>/buyConfirm">

		<input type="submit" value="購入">
	</form>

<!-- 	<tr> -->
<!-- 		<th colspan="3" -->
<!-- 			style="background-color: #00a7db; text-align: center; width: 200px">合計</th> -->
<%-- 		<td colspan="4"><%=myformat.moneyFormat(total)%></td> --%>
<!-- 	</tr> -->

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