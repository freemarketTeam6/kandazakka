<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods, bean.User, util.MyFormat"%>

<%
Goods goods = (Goods)request.getAttribute("goods");
%>

<html>
<head>
<title>発送完了</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>
<body>
	<%@include file="../common/userHeader.jsp"%>
	<a href="<%=request.getContextPath()%>/view/mypage.jsp">マイページへ</a>
	<h1 style="text-align: center;">発送完了</h1>
	<hr size=5px color="black">
	
	<p>商品の発送が完了しました</p>
	
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
	
	<form aciton="<%= request.getContextPath() %>/view/mypage.jsp">
		<input type="submit" value="出品一覧に戻る">
	</form>

</body>
<%@include file="../common/userFooter.jsp"%>
</html>