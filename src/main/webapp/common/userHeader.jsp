<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.User" %>

<header>	
	<tr>
		<div style="text-align:center">

			<td style="text-align:center;">
			<a href="/view/top.jsp" target="_blank" >  
			<img src="${pageContext.request.contextPath}/pic/kandafm.png" alt="ロゴ"border="0">
			</a>
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
		User user=(User)session.getAttribute("user");
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

		<div  style="text-align: center">
			<ul>
				<a href="<%=request.getContextPath()%>/view/maypage"style="margin-right: 30px;">マイページ</a>
				<a href="<%=request.getContextPath()%>/showCart"style="margin-right: 30px;">カート内容</a>
				<a href="<%=request.getContextPath()%>/view/goodsInsert.jsp"style="margin-right: 30px;">出品</a>
				<a href="<%=request.getContextPath()%>/view/top.jsp"style="margin-right: 30px;">トップメニューへ</a>
			</ul>
		</div>

		<hr style="text-align: center; height: 1px; background-color:#ccff99; width: 1500px">
	</div>
</header>
