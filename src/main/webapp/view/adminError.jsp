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


	</div>

	<%@include file="/common/adminFooter.jsp"%>







</body>
</html>