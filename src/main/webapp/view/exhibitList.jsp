<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*,bean.Goods,util.MyFormat"%>

<%

ArrayList<Goods> goodsList = (ArrayList<Goods>)request.getAttribute("goodsList");

MyFormat myformat = new MyFormat();
%>
<html>
<head>
<title>出品情報一覧</title>
</head>

<body>
	<%@include file="../common/adminHeader.jsp"%>

	<div style="text-align: center">
		<h1 style="text-align: center;color:#000000;">出品一覧</h1><br>
		<hr style="text-align: center; height: 3px; background-color: black; width: 1500px">
		<br>
		<table style="text-align: center; margin: auto; width: 850px">

			<tr>
				<th style="background-color: #ffffa8; width: 200px">グッズID</th>
				<th style="background-color: #ffffa8; width: 200px">出品ユーザーID</th>
				<th style="background-color: #ffffa8; width: 200px">グッズ名</th>
				<th style="background-color: #ffffa8; width: 200px">金額</th>
				<th style="background-color: #ffffa8; width: 300px">取引状況</th>
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
				<td style="text-align: center; width: 200px"><%=myformat.moneyFormat(goods.getPrice())%></td>
				<td style="text-align: center; width: 200px"><%=myformat.statusFormat(goods.getStatus())%></td>
			</tr>
			<%
				}
			}
			
			%>
		</table>
	</div>
	<%@include file="../common/adminFooter.jsp"%>
</body>
</html>
