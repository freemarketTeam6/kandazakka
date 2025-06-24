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

	<hr size=5px color="black">

	<div>
		<table border="1">
			<tr>
				<th>商品画像</th>
				<th>商品名</th>
				<th>金額</th>
				<th>取引状況</th>
				<th>登録内容変更</th>
				<th>発送</th>
			</tr>

			<%
		//リクエストスコープから出品一覧ArrayListを取得
		ArrayList<Goods> myGoodsList = (ArrayList<Goods>)request.getAttribute("myGoodsList");
		
		
		if(myGoodsList!=null){
			for(int i=0;i<myGoodsList.size();i++){
				Goods goods = (Goods)myGoodsList.get(i);
				%>

			<tr>
				<td><img src="<%=goods.getImgPath()%>" size="10px"></td>
				<td><%=goods.getGoodsName() %></td>
				<td><%=goods.getPrice() %></td>
				<td><%= myformat.statusFormat(goods.getStatus()) %></td>
				<td><a href="<%=request.getContextPath()%>/goodsDetail?<%=goods.getGoodsId() %>&cmd=update" style="margin-right: 30px;">内容変更</a></td>
				<td>
					<a href="<%=request.getContextPath()%>/shipping?cmd=detail&goods_id=<%=goods.getGoodsId() %>" style="margin-right: 30px;">発送する</a>
				</td>
			</tr>
			<% 
			}
		}
		%>
		</table>
		<form action="<%=request.getContextPath()%>/view/mypage.jsp" method="POST">
			<input type="submit" value="マイページへ戻る">
		</form>


	</div>
	<%@include file="../common/userFooter.jsp"%>

</body>
</html>
