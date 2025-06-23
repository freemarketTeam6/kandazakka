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
	<div style="text-align: center">
		<%@ include file="/common/header.jsp"%>

		<p style="margin: auto">
		<form action="<%=request.getContextPath()%>/userList" method="post">
			<input style="text" name="user_id" value="">
			<input style="submit"value="検索">
		</form>
		<form action="<%=request.getContextPath()%>/userList" method="post">
			<input style="submit" value="全件表示">
		</form>
		</p>

		<%
		if (userList.isEmpty()) {
		%>

		<p style="font-size: 24px">
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
				<td><%=user.get(i).getName()%></td>
				<td><%=user.get(i).getUserid()%></td>
				<td><%=goods.get(i).getEmail()%></td>
				<td>
					<form action="<%=request.getContextPath() %>/userList" method="post">
						<input style="submit" value="削除">
						<input style="hidden" name="delno" value="<%=user.get(i).getUserid() %>"
					</form>
				</td>
			</tr>

			<%
			}
		}
		%>

		</table>
	</div>
	<%@include file="/common/footer.jsp"%>
</body>
</html>