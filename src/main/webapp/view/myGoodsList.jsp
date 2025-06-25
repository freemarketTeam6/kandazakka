<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods,util.MyFormat"%>


<%
MyFormat myformat = new MyFormat();
%>
<html>
<head>
<title>出品商品一覧</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>


<body>
	<%@include file="../common/userHeader.jsp"%>


	<h1 style="text-align: center; color: #000000;background-color:#ccff99;">出品商品一覧</h1>
	<p style="margin-top: 50px"></p>
	<div>
		<table class="mygoodsList" border="1" style="margin: auto">

			<tr>
				<th style="background-color: #ccff99">商品画像</th>
				<th style="background-color: #ccff99">商品名</th>
				<th style="background-color: #ccff99">金額</th>
				<th style="background-color: #ccff99">取引状況</th>
				<th style="background-color: #ccff99">登録内容変更</th>
				<th style="background-color: #ccff99">発送</th>
				<th style="background-color: #ccff99">出品停止</th>
			</tr>

			<%
			//リクエストスコープから出品一覧ArrayListを取得
			ArrayList<Goods> myGoodsList = (ArrayList<Goods>) request.getAttribute("myGoodsList");

			if (myGoodsList != null) {
				for (int i = 0; i < myGoodsList.size(); i++) {
					Goods goods = (Goods) myGoodsList.get(i);
			%>

			<tr>

				<td><img
					src="<%=request.getContextPath()%>/file/images/<%=goods.getImgPath()%>"
					size="10px" width="200" alt="商品写真"></td>

				<td><%=goods.getGoodsName()%></td>
				<td><%=myformat.yenFormat(goods.getPrice())%></td>
				<td><%=myformat.statusFormat(goods.getStatus())%></td>
				<td><a
					href="<%=request.getContextPath()%>/goodsDetail?goods_id=<%=goods.getGoodsId()%>&cmd=update"
					style="margin-right: 30px;">内容変更</a></td>
				<td>
				<% if ( goods.getStatus().equals("0")){ %>
				<a href="<%=request.getContextPath()%>/goodsDetail?cmd=shipping&goods_id=<%=goods.getGoodsId()%>"
					style="margin-right: 30px;">発送する</a>
				<% } %>		
				</td>
				
				<% if ( goods.getStatus().equals("0")){ %>
				<td>
				<form action="<%=request.getContextPath()%>/mygoodsList">
					<input type="submit" value="出品停止">
					<input type="hidden" name="param" value="cancel">
					<input type="hidden" name="goods_id" value="<%=goods.getGoodsId()%>">
				</form>
				</td>
				<% } else if ( goods.getStatus().equals("9")){%>
				<td>
				<form action="<%=request.getContextPath()%>/mygoodsList">
					<input type="submit" value="出品再開">
					<input type="hidden" name="param" value="restart">
					<input type="hidden" name="goods_id" value="<%=goods.getGoodsId()%>">
				</form>
				</td>
				<% } %>		
			</tr>
			<%
			}
			}
			%>
		</table>
		<form action="<%=request.getContextPath()%>/view/mypage.jsp"
			method="POST" style="text-align: center">
			<input type="submit" value="マイページへ戻る">
		</form>
		<br>

	</div>
	<%@include file="../common/userFooter.jsp"%>

</body>
</html>
