<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods,util.MyFormat"%>


<%
MyFormat myformat = new MyFormat();
%>
<html>
<head>
<title>出品商品一覧</title>
<link rel="stylesheet" href="../view/css/style.css">
</head>




<body>
	<%@include file="../common/userHeader.jsp"%>
	<h1 style="text-align: center; color: #000000;">出品一覧</h1>

	<hr size=5px color="black">

	<div style="margin-bottom: 250px">


		<table style="border: 1px; margin: auto; text-align: center">
			<tr>
				<th style="background-color: #ccff99; width: 200">商品画像</th>
				<th style="background-color: #ccff99; width: 200">商品名</th>
				<th style="background-color: #ccff99; width: 200">金額</th>
				<th style="background-color: #ccff99; width: 200">取引状況</th>
				<th style="background-color: #ccff99; width: 200">登録内容変更</th>
				<th style="background-color: #ccff99; width: 200">発送</th>
			</tr>

			<%
			//リクエストスコープから出品一覧ArrayListを取得
			ArrayList<Goods> myGoodsList = (ArrayList<Goods>) request.getAttribute("myGoodsList");

			if (myGoodsList != null) {
				for (int i = 0; i < myGoodsList.size(); i++) {
					Goods goods = (Goods) myGoodsList.get(i);
			%>

			<tr
				style="text-align:center; >
				<td ><img src="<%=goods.getImgPath()%>" size="10px"></td>
				<td><%=goods.getGoodsName()%></td>
				<td ><%=goods.getPrice()%></td>
				<td><%=myformat.statusFormat(goods.getStatus())%></td>
				<td style="text-align:center; ><a href="<%=request.getContextPath()%>/goodsDetail?goods_id=<%=goods.getGoodsId()%>&cmd=update" style="margin-right: 30px;">内容変更</a></td>
				<td style="text-align:center; >
					<a href="<%=request.getContextPath()%>/shipping?cmd=detail&goods_id=<%=goods.getGoodsId()%>" style="margin-right: 30px;">発送する</a>
				</td>
			</tr>
			</table>
			<%}
}%>
<table style="margin:auto;">
				<td><form action="<%=request.getContextPath()%>/view/mypage.jsp" method="POST">
			<input type="submit" value="マイページへ戻る"></td>
		</form>
		
		</table>



	</div>
	<%@include file="../common/userFooter.jsp"%>

</body>
</html>
