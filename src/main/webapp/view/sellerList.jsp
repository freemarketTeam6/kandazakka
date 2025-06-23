<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods"%>


<%
ArrayList<Goods> salesGoodsList = (ArrayList<Goods>)request.getAttribute("salesGoodsList");
%>

<html>
<head>
<title>出品者一覧</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>

<body>
	<a href="<%= request.getContextPath() %>/view/adminMenu.jsp">【管理者メニュー画面】</a>
	<h1 style="text-align: center;">出品者一覧</h1>
	<hr size=5px color="black">

	<table border="1">
		<tr>
			<th>名前</th>
			<th>商品名</th>
			<th>価格</th>
			<th>メールアドレス</th>
			<th>電話番号</th>
			<th></th>
			<th></th>
		</tr>
		
		<tr>
		
	</table>
</body>

</html>