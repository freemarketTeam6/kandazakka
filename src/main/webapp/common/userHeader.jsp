<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.User" %>

<header>
	<div class="header-container">
    	<div class="logo">
			<td style="text-align:center;"><img src="img" alt="神田雑貨店フリマロゴ"></td>
		</div>	
		
		<div style="text-align:right">
		<%
		//ユーザー情報取得
		User user=(User)session.getAttribute("user");
		//未ログインの場合
		if (user == null) {	
		%>
			<form action="<%=request.getContextPath() %>/LoginServlet"method="post">
			<input type="submit" value="ログイン">
			</form>
		<%
		}else{
		%>
			<%= user.getNick_name() %>
			<form action="<%=request.getContextPath() %>/LogoutServlet">
			<input type="submit" value="ログアウト">
			</form>
		<%
		}
		%>
		<hr style="text-align: center; height: 3px; background-color:#00a1e9; width: 1500px">
		</div>

		<div  style="text-align: center">
			<ul>
				<a href="<%=request.getContextPath()%>/view/mypage.jsp"style="margin-right: 30px;">マイページ</a>
				<a href="<%=request.getContextPath()%>/view/showCart.jsp"style="margin-right: 30px;">カート内容</a>
				<a href="<%=request.getContextPath()%>/view/goodsInsert.jsp"style="margin-right: 30px;">出品</a>
			</ul>
		</div>

		<hr style="text-align: center; height: 1px; background-color:#00a1e9; width: 1500px">
	</div>
</header>
