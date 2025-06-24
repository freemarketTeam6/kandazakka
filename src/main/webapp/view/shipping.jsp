<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods, bean.User, util.MyFormat"%>

<%
Goods goods = (Goods)request.getAttribute("goods");
%>

<html>
<head>
<title>商品発送画面</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>
<body>
	<%@include file="../common/userHeader.jsp"%>
	<a href="<%=request.getContextPath()%>/view/mypage.jsp">マイページへ</a>
	<h1 style="text-align: center;">発送</h1>
	<hr size=5px color="black">
	
	<p>この商品を発送しますか？</p>
	
	<table
		style="width: 200; height: 150; margin: 0 auto; border-spacing: 0 10px">
		<tr>
			<td>写真</td>
			<td><img src="<%=request.getContextPath() %>/img/<%= goods.getImgPath() %>"></td>
		<tr>
			<td style="background-color: #6666FF">商品名</td>
			<td style="background-color: aqua;"><%=goods.getGoodsName()%></td>
		</tr>
		<tr>
			<td style="background-color: #6666FF">個数</td>
			<td style="background-color: aqua;"><%=goods.getQuantity()%></td>
		</tr>
		<tr>
			<td style="background-color: #6666FF">種類</td>
			<td style="background-color: aqua;"><%= goods.getCategory() %></td>
		</tr>
		<tr>
			<td style="background-color: #6666FF">備考</td>
			<td style="background-color: aqua;"><%= goods.getGoodsMemo() %></td>
		</tr>
		<tr>
			<td style="background-color: #6666FF">価格</td>
			<td style="background-color: aqua;"><%= goods.getPrice() %></td>
		</tr>			
	</table>
	
	<form action="<%= request.getContextPath() %>/shipping">
		<input type="submit" value="発送">
		<input type="hidden" name="goodsid" value="<%= goods.getGoodsId() %>">
		<input type="hidden" name="cmd" value="shipping">
	</form>
	
	<form aciton="<%= request.getContextPath() %>/view/mypage.jsp">
		<input type="submit" value="キャンセル">
	</form>

</body>
<%@include file="../common/userFooter.jsp"%>
</html>