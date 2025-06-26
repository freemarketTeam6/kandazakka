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
	
	<h1 style="text-align: center; color: #000000;">ユーザー一覧</h1><br>
	<hr style="text-align: center; height: 2px; background-color: black">
	<p style="margin-top: 50px"></p>
	<br>
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
		
    	<% if (  ! userList.isEmpty()){ %>
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
				<% if ( userList.get(i).getAuthority().equals("u")){ %>
				<form action="<%=request.getContextPath() %>/delete" method="get">
         			 <input type="hidden" name="userid" value="<%=userList.get(i).getUserid() %>">
					<input type="submit" value="削除"> 
				</form>
				<% } %>
			</td>
		</tr>
		<%
			}
		%>
		<% }else { %>
		<p style="font-size: 24px; text-align: center">
			<strong>登録しているユーザーがいません！</strong>
		</p>
		<% } %>

	</table>
	<p style="margin-top: 100px"></p>
	</div>
	<%@include file="/common/adminFooter.jsp"%>
</body>
</html>
