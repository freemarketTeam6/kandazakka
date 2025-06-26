<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods, util.MyFormat"%>
<%
//リクエストスコープからの商品データの取得
Goods goods = (Goods) request.getAttribute("goods");
//MyFormatクラスのオブジェクトを生成
MyFormat myFormat = new MyFormat();
//同じ商品を２個以上カートに入れようとしたとき用のメッセージ取得
String msg = null;
msg = (String) request.getAttribute("msg");
%>
<html>
<head>
<title>神田雑貨店フリマ</title>
</head>
<style>
.img {
	width: 100%;
	height: 100%;
	max-height: 150px;
	object-fit: contain;
}
</style>
<body>
	<%@include file="../common/userHeader.jsp"%>

	<%
	//カート内重複の場合は文言変える
	if (msg==null) {
	%>
	<h1 style="text-align: center; color: #000000; background-color: #ccff99;">カート追加完了</h1>
	<%
	} else{
	%>
	<h1 style="text-align: center; color: #000000; background-color: #ccff99;">カートに追加できません</h1>
	<%
	}
	%>

	<br>
	<br>

	<div style="margin-bottom: 50px"></div>

	<div style="text-align: center">
		<br>
		<tr>

			<%
			//カート内重複の場合は文言変える
			if (msg==null) {
			%>
			<td style="text-align: center; color: #000000; font-size: 30px"><strong>カートに追加しました。</strong></td>
			<%
			} else{
			%>
			<td style="text-align: center; color: #000000; font-size: 30px"><strong>同じ商品が既にカート内に存在します。</strong></td>
			<%
			}
			%>

		</tr>

		<p style="text-align: center">
			<img class="img" src="<%=request.getContextPath()%>/file/images/<%=goods.getImgPath()%>" alt="商品写真">
			<!-- 	ここに写真がはいるよ -->
		</p>

		<p style="margin-top: 25px"></p>

		<p style="font-size: 24px; text-align: center">
			<strong><%=goods.getGoodsName()%></strong>
		</p>

		<p style="margin-top: 25px"></p>

		<p style="font-size: 20px; text-align: center">
			<%=myFormat.moneyFormat(goods.getPrice())%>
		</p>


		<p style="text-align: center; margin-top: 50px">
			<a href="<%=request.getContextPath()%>/showCart">カート内を確認する</a>
		</p>


		<%@include file="../common/userFooter.jsp"%>
	</div>
</body>
</html>