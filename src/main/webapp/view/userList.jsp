<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*, bean.User"%>

<%
ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
%>

<html>
<head>
<title>ユーザー一覧</title>
</head>
<body>
	<%@include file="/common/adminHeader.jsp"%>
	<br>
	<a href="<%= request.getContextPath() %>/view/adminMenu.jsp">【管理者メニュー画面】</a>

	<br>
	<h1 style="text-align: center; color: #000000;">ユーザー一覧</h1>
	<br>
	<hr style="text-align: center; height: 2px; background-color: black">
	<p style="margin-top: 50px"></p>

	<table style="margin: auto">
		<form action="<%=request.getContextPath()%>/userList">
			<tr>
				<td><input type="text" name="user_id" value=""></td>
				<td><input type="submit" value="検索"></td>
		</form>
		<form action="<%=request.getContextPath()%>/userList">
			<td><input type="submit" value="全件表示"></td>
		</form>
	</table>
	<p style="margin-top: 100px"></p>


	<%
		if (userList.isEmpty()) {
		%>

	<p style="font-size: 24px; text-align: center">
		<strong>会員登録をしているユーザーはいませんでした。</strong>
	</p>

	<%
		} else {
		%>

	<table style="margin: auto; text-align: center">
		<tr>
			<th style="background-color: #ffffa8; width: 200px">ID</th>
			<th style="background-color: #ffffa8; width: 200px">名前</th>
			<th style="background-color: #ffffa8; width: 200px">名前かな</th>
			<th style="background-color: #ffffa8; width: 200px">住所</th>
			<th style="background-color: #ffffa8; width: 200px">メールアドレス</th>
			<th style="background-color: #ffffa8; width: 200px">電話番号</th>
			<th style="background-color: #ffffa8; width: 200px">削除</th>
		</tr>

		<%
			for (int i = 0; i < userList.size(); i++) {
			%>

		<tr>
			<td><%= userList.get(i).getUserid() %></td>
			<td><%= userList.get(i).getName() %></td>
			<td><%= userList.get(i).getNamekana() %></td>
			<td><%= userList.get(i).getAddress() %></td>
			<td><%= userList.get(i).getEmail() %></td>
			<td><%= userList.get(i).getTell() %></td>
			<td>

				<form action="<%=request.getContextPath() %>/userList" method="get">

					<input type="submit" value="削除"> <input type="hidden"
						name="delno" value="<%=userList.get(i).getUserid() %>">
				</form>
			</td>
		</tr>

		<%
			}
		}
		%>

	</table>
	<p style="margin-top: 100px"></p>
	</div>
	<%@include file="/common/adminFooter.jsp"%>
</body>
</html>
