<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods"%>


<%
ArrayList<User> sellerList = (ArrayList<User>)request.getAttribute("sellerList");
%>

<html>
<head>
<title>出品者一覧</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>
	<a href="<%= request.getContextPath() %>/view/adminMenu.jsp">【管理者メニュー画面】</a>
	<h1 style="text-align: center;">出品者一覧</h1>
	<hr size=5px color="black">

	<table border="1">
		<tr>
			<th>ID</th>
			<th>名前</th>
			<th>名前かな</th>
			<th>住所</th>
			<th>メールアドレス</th>
			<th>電話番号</th>
		</tr>

		<%
		if (sellerList != null) {
			for(int i= 0; i< sellerList.size().i++){
		%>
		<tr>
			<td><%= sellerList.get(i).getUserid() %></td>
			<td><%= sellerList.get(i).getName() %></td>
			<td><%= sellerList.get(i).getNamekana %></td>
			<td><%= sellerList.get(i).getAddress() %></td>
			<td><%= sellerList.get(i).getEmail() %></td>
			<td><%= sellerList.get(i).getTell() %></td>
		</tr>
		<%
		}
		}
		%>
	</table>
</body>

</html>