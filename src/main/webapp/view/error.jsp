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

		<div style="text-align:center">

		<br> ●●エラー●● <br><br>
		<%=error %>
		<br>
		<br>
		<br>
		<br>


		<%	if(cmd.equals("logout")){	%>
		[<a href="<%=request.getContextPath()%>/logout">TOP画面に戻る</a>]

		<%	}else if(cmd.equals("top")){	%>
		[<a href="<%=request.getContextPath()%>/list">TOP画面に戻る</a>]

		<%	}else if(cmd.equals("list")){	%>
		[<a href="<%=request.getContextPath()%>/mygoodsList">出品商品一覧に戻る</a>]

		<%	}else if(cmd.equals("mypage")){	%>
		[<a href="<%=request.getContextPath()%>/view/mypage.jsp">マイページに戻る</a>]
		
		<%	}else if(cmd.equals("login")){	%>
		[<a href="<%=request.getContextPath()%>/view/userLogin.jsp">ログイン画面に戻る</a>]
		
		<%	}else if(cmd.equals("newRegistration")){	%>
		[<a href="<%=request.getContextPath()%>/view/newRegistration.jsp">新規登録画面に戻る</a>]
		
		
		</div>
		
<%}%>

	<%@include file="/common/userFooter.jsp"%>







</body>
</html>
