<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods"%>


<%
ArrayList<Goods> salesGoodsList = (ArrayList<Goods>)request.getAttribute("salesGoodsList");
%>

<html>
<head>
<title>売上一覧</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>

<body>
	<%@include file="/common/header.jsp"%>
	<a href="<%= request.getContextPath() %>/view/adminMenu.jsp">【管理者メニュー画面】</a>
	<h1 style="text-align: center;">売上一覧</h1>
	<hr size=5px color="black">
	
	<!-- 今後、月別・年別ソート機能追加予定 -->
	<div class="searchBox">
		<form action="#">
			年：<input type="text" name="year">
			月：<input type="text" name="month">
			<input type="submit" value="検索">
		</form>
		<form action="#">
			<input type="submit" value="全件表示">
		</form>
	</div>

	<table class="listTable">
		<tr>
			<th>購入日</th>
			<th>商品画像</th>
			<th>商品名</th>
			<th>購入者</th>
			<th>販売者</th>
			<th>価格</th>
			<th>利益</th>
		</tr>
		
		<tr>
		
	</table>
</body>
<%@include file="/common/footer.jsp"%>
</html>