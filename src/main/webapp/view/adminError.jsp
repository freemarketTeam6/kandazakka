<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>Error</title>
</head>

<body>

	<div>

		<%@include file="/common/adminHeader.jsp"%>

		<%
		String error = (String) request.getAttribute("error");
		String cmd = (String) request.getAttribute("cmd");
		%>

		<br> ●●エラー●● <br>
		<%=error%>
		<br> <br> <br> <br>



		<%
		if (cmd.equals("adminMenu")) {
		%>
		[<a href="<%=request.getContextPath()%>/view/adminMenu.jsp">管理者メニューに戻る</a>]
		<%
		}
		%>

		<%
		if (cmd.equals("logout")) {
		%>
		[<a href="<%=request.getContextPath()%>/view/adminLogin.jsp">管理者ログインに戻る</a>]
		<%
		}
		%>
		
		<%
		if (cmd.equals("userList")) {
		%>
		[<a href="<%=request.getContextPath()%>/userList">ユーザー一覧に戻る</a>]
		<%
		}
		%>


	</div>

	<%@include file="/common/adminFooter.jsp"%>







</body>
</html>
