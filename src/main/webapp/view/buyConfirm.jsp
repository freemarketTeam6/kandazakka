<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods, util.MyFormat"%>
<%
//リクエストスコープからのデータの取得
ArrayList<Goods> list = (ArrayList<Goods>) request.getAttribute("goods_List");
String error = (String) request.getAttribute("error");
//MyFormatクラスのオブジェクトを生成
MyFormat myFormat = new MyFormat();
//合計価格用の変数
int total = 0;
%>
<html>
<head>
<title>神田雑貨店フリマ</title>
</head>
<body>
	<%@include file="../common/userHeader.jsp"%>
	<table style="margin: auto; width: 850px">
		<tr>
			<td style="text-align: center; width: 508px; font-size: 24px;">購入完了</td>
			<td style="width: 80px">&nbsp;</td>
			<td style="width: 80px">&nbsp;</td>
		</tr>
	</table>

	<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
	<div style="margin-bottom: 250px">

		<div style="text-align: center">
			<br>
			<tr>

				<td style="text-align: center; color: #000000; font-size: 30px"><strong>購入が完了しました。</strong></td>

			</tr>

			<div style="text-align: center">

				<table style="margin: 0 auto">
					<br>

					<%
					if (list != null) {

						total = (int) request.getAttribute("total");

						for (int i = 0; i < list.size(); i++) {
							Goods goods = (Goods) list.get(i);
					%>

					<tr>
						<td><%=list.get(i).getImgPath()%></td>
						<td><%=list.get(i).getGoodsName()%></td>
						<td><%=myFormat.moneyFormat(list.get(i).getPrice())%></td>
					</tr>

					<%
					}
					}
					%>
				</table>

				<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
				<div style="text-align: center">
					<tr>
						<table style="margin: 0 auto">
							<th style="background-color: #00a7db; width: 100">合計</th>
							<td style="text-align: center; width: 200px"><%=myFormat.moneyFormat(total)%></td>
						</table>
					</tr>
					<br>

					<br>
					<tr>上記の商品を購入しました。
					</tr>
					<tr>出品者の発送をお待ちください。
					</tr>
					<br>

					<br>

					<table style="margin: auto; width: 850px">
						<tr>
							<td style="text-align: center; width: 80px; font-size: 15px;">[<a href="<%=request.getContextPath()%>/buyList">購入一覧</a>]
							</td>
						</tr>
					</table>

					<%@include file="../common/userFooter.jsp"%>
				</div>
</body>
</html>
