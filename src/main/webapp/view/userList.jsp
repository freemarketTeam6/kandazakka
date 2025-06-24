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
	<div style="margin:auto">
		<%@include file="/common/adminHeader.jsp"%>

		<table style="margin: auto">
			<form action="<%=request.getContextPath()%>/userList">
				<tr>
					<td><input type="text" name="user_id" value=""></td>
					<td><input type="submit"value="検索"></td>
			</form>
			<form action="<%=request.getContextPath()%>/userList">
					<td><input type="submit" value="全件表示"></td>
			</form>
		</table>
		<p style="margin-top:100px"></p>


		<%
		if (userList.isEmpty()) {
		%>

		<p style="font-size: 24px;text-align:center">
			<strong>会員登録をしているユーザーはいませんでした。</strong>
		</p>

		<%
		} else {
		%>

		<table style="margin: auto">
			<tr>
				<th>名前</th>
				<th>ユーザーID</th>
				<th>Eメール</th>
				<th>削除</th>
			</tr>

			<%
			for (int i = 0; i < userList.size(); i++) {
			%>

			<tr>
				<td><%=userList.get(i).getName()%></td>
				<td><%=userList.get(i).getUserid()%></td>
				<td><%=userList.get(i).getEmail()%></td>
				<td>
					<form action="<%=request.getContextPath() %>/userList" method="post">
						<input type="submit" value="削除">
						<input type="hidden" name="delno" value="<%=userList.get(i).getUserid() %>"
					</form>
				</td>
			</tr>

			<%
			}
		}
		%>

		</table>
	<p style="margin-top:100px"></p>
	</div>
	<%@include file="/common/adminFooter.jsp"%>
</body>
</html>
