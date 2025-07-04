<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods,util.MyFormat"%>


<%
MyFormat myformat = new MyFormat();
%>
<html>
<head>
<title>出品商品一覧</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<style>
.mygoodsList{
	width:75%;
	margin: 20px auto;
	border-collapse:collapse;
}

.mygoodsList tr th{
	height: 35px;
	font-size: 20px;
	text-align: cemter
}

.mygoodsList tr td{
	padding: 5px;
}

.mygoodsList #imgBox{
	height: 100px;
	width: 100px;
	'
}

.mygoodsList #goodsName{
	width: 250px;
}

.mygoodsList #price{
	width: 100px;
	text-align: right;
}

.mygoodsList #status{
	width: 100px;
	text-align: center;
}

.mygoodsList #change{
	width: 150px;
	text-align: center;
}

.mygoodsList #shipping{
	width: 100px;
	text-align: center;
}

.mygoodsList #changeStatus{
	width: 100px;
	text-align: center;
}

.border{
	border-bottom: 1px solid #000000;
}
</style>
</head>


<body>
	<%@include file="../common/userHeader.jsp"%>


	<h1 style="text-align: center; color: #000000;background-color:#ccff99;">出品商品一覧</h1>
	<p style="margin-top: 50px"></p>
	<div>
		<table class="mygoodsList" style="text-align: center; margin: auto">

			<tr>
				<th style="background-color: #ccff99;width: 200px">商品画像</th>
				<th style="background-color: #ccff99;width: 200px">商品名</th>
				<th style="background-color: #ccff99;width: 200px">金額</th>
				<th style="background-color: #ccff99;width: 200px">取引状況</th>
				<th style="background-color: #ccff99;width: 200px">登録内容変更</th>
				<th style="background-color: #ccff99;width: 200px">発送</th>
				<th style="background-color: #ccff99;width: 200px">出品停止</th>
			</tr>

			<%
			//リクエストスコープから出品一覧ArrayListを取得
			ArrayList<Goods> myGoodsList = (ArrayList<Goods>) request.getAttribute("myGoodsList");

			if (myGoodsList != null) {
				for (int i = 0; i < myGoodsList.size(); i++) {
					Goods goods = (Goods) myGoodsList.get(i);
			%>

			<tr class="border">
				<!-- 写真クリックすると商品詳細に飛ぶように修正 6/27 11:10 -->
				<td id="imgBox">
					<a href="<%=request.getContextPath()%>/goodsDetail?cmd=detail&goods_id=<%= goods.getGoodsId()%>">
						<img src="<%=request.getContextPath()%>/file/images/<%=goods.getImgPath()%>" style="width:200px"alt="商品写真">
					</a>	
					</td>


				<td id="goodsName"><%=goods.getGoodsName()%></td>
				<td id="price"><%=myformat.yenFormat(goods.getPrice())%></td>
				<td id="status"><%=myformat.statusFormat(goods.getStatus())%></td>
				<td id="change"><a href="<%=request.getContextPath()%>/goodsDetail?goods_id=<%=goods.getGoodsId()%>&cmd=update"
					style="margin-right: 30px;">内容変更</a></td>
				<td id="shipping">
				<% if ( goods.getStatus().equals("2")){ %>
				<a href="<%=request.getContextPath()%>/goodsDetail?cmd=shipping&goods_id=<%=goods.getGoodsId()%>"
					style="margin-right: 30px;">発送する</a>
				<% } %>		
				</td>
				
				<% if ( goods.getStatus().equals("0")){ %>
				<td id="changeStatus">
				<form action="<%=request.getContextPath()%>/mygoodsList" method="POST">
					<input type="submit" value="出品停止">
					<input type="hidden" name="param" value="cancel">
					<input type="hidden" name="goods_id" value="<%=goods.getGoodsId()%>">
				</form>
				</td>
				<% }else  if ( goods.getStatus().equals("9")){ %>
				<td id="changeStatus">
				<form action="<%=request.getContextPath()%>/mygoodsList" method="POST">
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
		<p style="margin-top: 50px"></p>
		<form action="<%=request.getContextPath()%>/view/mypage.jsp"
			method="POST" style="text-align: center">
			<input type="submit" value="マイページへ戻る">
		</form>
		<br>

	</div>
	<%@include file="../common/userFooter.jsp"%>

</body>
</html>