<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods,util.MyFormat"%>

<%

ArrayList<Goods>  = (ArrayList<Goods>) request.getAttribute("goodsList");

MyFormat myformat = new MyFormat();
%>
<html>
<head>
<title>出品情報一覧</title>
</head>

<body>
	<%@include file="../common/adminHeader.jsp"%>

	<hr
		style="text-align: center; height: 2px; background-color: black; width: 950px">
	<h1 style="text-align: center; color: #000000;">出品情報一覧</h1>
	<hr
		style="text-align: center; height: 2px; background-color: black; width: 950px">


	<div style="margin-bottom: 250pxr">

		<table style="text-align: center; margin: auto; width: 850px">

			<tr>
				<th style="background-color: #6666ff; width: 200px">グッズID</th>
				<th style="background-color: #6666ff; width: 200px">出品ユーザーID</th>
				<th style="background-color: #6666ff; width: 200px">グッズ名</th>
				<th style="background-color: #6666ff; width: 200px">金額</th>
				<th style="background-color: #6666ff; width: 300px" colspan="3">取引状況</th>
			</tr>

			<%
			
			//リストがnullじゃないとき繰り返し処理によってlistの値を取得
			if (goodsList != null) {
				for (int i = 0; i <goodsList.size(); i++) {
					Goods goods = (Goods) goodsList.get(i);
			%>

			<tr>
				<!-- DTOクラスを使用し一覧を表示 -->
				<td style="text-align: center; width: 200px"><%=goods.getGoodsId()%></td>
				<td style="text-align: center; width: 200px"><%=goods.getSelluserId()%></td>
				<td style="text-align: center; width: 200px"><%=goods.getGoodsName()%></td>
				<td style="text-align: center; width: 200px"><%=myFormat.moneyFormat.(goods.getPrice())%></td>
				<td style="text-align: center; width: 200px"><%=myFormat.statusFormat.(goods.getStatus())%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%@include file="../common/adminFooter.jsp"%>
</body>
</html>
