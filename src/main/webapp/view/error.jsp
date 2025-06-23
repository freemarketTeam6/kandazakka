<%@page contentType="text/html; charset=UTF-8"%>


<html>
<head>
<title>Error</title>
</head>

<body>

	<div>

		<%@include file="/common/userHeader.jsp"%>

		<%
String error = (String)request.getAttribute("error");
String cmd = (String)request.getAttribute("cmd");
%>

		<br> ●●エラー●● <br>
		<%=error %>
		<br>
		<br>
		<br>
		<br>


		<%	if(cmd.equals("logout")){	%>
		[<a href="<%=request.getContextPath()%>/logout">TOP画面に戻る</a>]

		<%	}else if(cmd.equals("top")){	%>
		[<a href="<%=request.getContextPath()%>/top">TOP画面に戻る</a>]

		<%	}else if(cmd.equals("list")){	%>
		[<a href="<%=request.getContextPath()%>/list">出品商品一覧に戻る</a>]

		<%	}else if(cmd.equals("mypage")){	%>
		[<a href="<%=request.getContextPath()%>/view/mypage.jsp">マイページに戻る</a>]
<%}%>

	<%@include file="/common/userFooter.jsp"%>







</body>
</html>