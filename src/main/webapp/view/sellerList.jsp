<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods,bean.User"%>


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
	<%@include file="../common/adminHeader.jsp"%>
	<a href="<%= request.getContextPath() %>/view/adminMenu.jsp">【管理者メニュー画面】</a>
	<h1 style="text-align: center;">出品者一覧</h1>
	<hr size=3px color="black">

	<table style="margin: auto; text-align: center">
		<tr>
			<th style="background-color:#ffffa8; width:200px">ID</th>
			<th style="background-color:#ffffa8; width:200px">名前</th>
			<th style="background-color:#ffffa8; width:200px">名前かな</th>
			<th style="background-color:#ffffa8; width:200px">住所</th>
			<th style="background-color:#ffffa8; width:200px">メールアドレス</th>
			<th style="background-color:#ffffa8; width:200px">電話番号</th>
		</tr>

		<%
		if (sellerList != null) {
			for(int i= 0; i< sellerList.size();i++){
		%>
		<tr>
			<td><%= sellerList.get(i).getUserid() %></td>
			<td><%= sellerList.get(i).getName() %></td>
			<td><%= sellerList.get(i).getNamekana() %></td>
			<td><%= sellerList.get(i).getAddress() %></td>
			<td><%= sellerList.get(i).getEmail() %></td>
			<td><%= sellerList.get(i).getTell() %></td>
		</tr>
		<%
		}
		}
		%>
	</table>
<%@include file="/common/adminFooter.jsp"%>
</body>

</html>
