<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods, bean.User, util.MyFormat"%>

<%
Goods goods = (Goods)request.getAttribute("goods");
%>

<html>
<head>
<title>商品発送画面</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
	<%@include file="../common/userHeader.jsp"%>
	<h1 style="text-align: center;">発送</h1>
	<hr size=5px color="black">
	
	<p style="text-align: center;margin-top:50px;margin-bottom:30px"><strong>この商品を発送しますか？</strong></p>
	
	<table
		class="shipping">
		<tr>
			<td style="background-color: #ccff99">写真</td>
			<td><img src="<%=request.getContextPath() %>/file/images/<%= goods.getImgPath() %>" alt="商品写真"></td>
		<tr>
			<td style="background-color: #ccff99">商品名</td>
			<td ><%=goods.getGoodsName()%></td>
		</tr>
		<tr>
			<td style="background-color: #ccff99">個数</td>
			<td ><%=goods.getQuantity()%></td>
		</tr>
		<tr>
			<td style="background-color: #ccff99">種類</td>
			<td ><%= goods.getCategory() %></td>
		</tr>
		<tr>
			<td style="background-color: #ccff99">備考</td>
			<td><%= goods.getGoodsMemo() %></td>
		</tr>
		<tr>
			<td style="background-color: #ccff99">価格</td>
			<td ><%= goods.getPrice() %></td>
		</tr>			
	</table>
	
	<table style="margin:auto">
	<tr>
	<td>
	<br>
	<form action="<%= request.getContextPath() %>/shipping" style="text-align: center">
		<input type="submit" value="発送">
		<input type="hidden" name="goodsid" value="<%= goods.getGoodsId() %>">
		<input type="hidden" name="cmd" value="shipping">
		<br>
	</form>
	</td>
	</tr>
	
	<tr>
	<td>
	<br>
	<form action="<%= request.getContextPath() %>/mygoodsList" style="text-align: center">
		<input type="submit" value="キャンセル">
		<br>
	</form>
	</td>
	</tr>
</table>

</body>
<%@include file="../common/userFooter.jsp"%>
</html>