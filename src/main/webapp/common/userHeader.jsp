<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.User" %>

<header>	
	<tr>
		<div style="text-align:center">
			<td style="text-align:center;">
			
			<form action="<%=request.getContextPath()%>/list" method="POST">
				<input type="image" src="${pageContext.request.contextPath}/pic/kandafm.png" alt="ロゴ"border="0">
			</form>
			
			</td>
			<br>
		<form action="<%=request.getContextPath()%>/SearchServlet"style="display: inline;">
			<input id="sbox2" name="keyword" type="text" placeholder="キーワードを入力" />
			<input id="sbtn1" type="submit" value="検索" />
		</form>
		</div>
	</tr>
	
		<div style="text-align:right">
		<%
		//ユーザー情報取得
		User user = (User)session.getAttribute("user");
		//未ログインの場合
		if (user == null) {	
		%>
			<form action="<%=request.getContextPath() %>/view/userLogin.jsp" method="post">
			<input type="submit" value="ログイン">
			</form>
		<%
		}else{
		%>
			<%= user.getNickname() %>
			<form action="<%=request.getContextPath() %>/logout">
			<input type="submit" value="ログアウト">
			</form>
		<%
		}
		%>
		<hr style="text-align: center; height: 3px; background-color:#ccff99; width: 1500px">
		</div>
		
		<% if ( user == null ){ %>
		
		<% }else{ %>
		<div  style="text-align: center">
			<table>
				<tr><a href="<%=request.getContextPath()%>/view/mypage.jsp" style="margin-right: 30px;">マイページ</a></tr>
				<tr><a href="<%=request.getContextPath()%>/showCart"style="margin-right: 30px;">カート内容</a></tr>
				<tr><a href="<%=request.getContextPath()%>/view/goodsInsert.jsp" style="margin-right: 30px">出品</a></tr>
				<tr><a href="<%=request.getContextPath()%>/list">トップメニューへ</a></tr>
				
			</table>

			</ul>
		</div>
		
		<% } %>

	</div>
</header>