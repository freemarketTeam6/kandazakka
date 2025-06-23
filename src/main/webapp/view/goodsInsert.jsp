<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="bean.Goods"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>出品</title>

<style>
body {
	min-width: 800px;
}

.insert {
	min-width: 300px;
	width: 60%;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
}

.insert th {
	background-color: #cccccc;
	width: auto;
	text-align: left;
	padding-left: 2px;
}

.insert td {
	text-align: center;
	padding-left: 2px;
	width: auto;
}

.insert td input {
	width: 100%;
}

.insert input[type="textarea"] {
	resize: none;
	width: 100%;
	height: 200px;
}
</style>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

	<header>
		<%@include file="/common/userHeader.jsp"%>
	</header>

	<header style="text-align: center">
		<h1>出品</h1>
	</header>

	<%
	Goods goods = (Goods) request.getAttribute("goods");

	String message = (String) request.getAttribute("empty");
	if (message == null) {
		message = "";
	}
	%>
	<h3><%=message%></h3>

	<form action="<%=request.getContextPath()%>/goodsInsert"
		name="goodsInsert" method="post">
		<table class="insert">


			<tr>
				<th>写真</th>
				<td><input type="file" name="image" required="required"
					accept="image/ping,image/jpeg" multiple /></td>
			</tr>
			<tr>
				<th>商品名</th>
				<td><input type="text" name="neme" required="required"
					value="<%=goods.getGoodsName()%>"></td>
			</tr>
			<tr>
				<th>価格</th>
				<td><input type="text" name="price" required="required"
					value="<%=goods.getPrice()%>"
					oninput="this.value=this.value.replace(/[^0-9]/g,'')"></td>
			</tr>
			<tr>
				<th>個数</th>
				<td><input type="text" name=" quantity" required="required"
					value="<%=goods.getQuantity()%>"
					oninput="this.value=this.value.replace(/[^0-9]/g,'')"></td>
			</tr>
			<tr>
				<th>種類</th>
				<td><input type="text" name="category" required="required"
					value="<%=goods.getCategory()%>" placeholder="食器、おもちゃ等"></input></td>
			</tr>

			<tr>
				<th>状態・商品説明</th>
				<td><input type="textarea" name="goods_memo"
					value="<%=goods.getGoodsMemo()%>"></input></td>
			</tr>
			<tr>
				<th>地域</th>
				<td><select name="region" required="required">
						<option value="0">北海道</option>
						<option value="1">東北</option>
						<option value="2">関東</option>
						<option value="3">中部</option>
						<option value="4">近畿</option>
						<option value="5">中国・四国</option>
						<option value="6">九州</option>
				</select>
				<td>
			</tr>

			<tr>
				<td></td>
				<td style="text-align: center"><span id="error">&nbsp;</span></td>
			</tr>
			<tr>
				<td colspan=2><br> <br> <input type="submit"
					value="出品する" id="btn" style="width: 40%;"></td>
			</tr>
		</table>
	</form>
	<%@include file="/common/userFooter.jsp"%>
</body>

</html>