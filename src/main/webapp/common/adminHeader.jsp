<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.User" %>

<header>
	<tr>
		<div style="text-align:center">
			<td style="text-align:center;"><img src="${pageContext.request.contextPath}/pic/kandafm.png" alt="ロゴ"></td>
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
			<p style="font-size: 24px">未ログイン</p>
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
		
		<hr style="text-align: center; height: 3px; background-color:#ffffa8; width: 1500px">
		</div>

		<div  style="text-align: center">
			<ul>
				<a href="<%=request.getContextPath()%>/exhibitList"style="margin-right: 30px;">出品商品</a>
				<a href="<%=request.getContextPath()%>/sellerList"style="margin-right: 30px;">出品者</a>
				<a href="<%=request.getContextPath()%>/userList"style="margin-right: 30px;">ユーザー</a>
				<a href="<%=request.getContextPath()%>/salesList"style="margin-right: 30px;">売上</a>
				<a href="<%=request.getContextPath()%>/listOfInquiries"style="margin-right: 30px;">問い合わせ</a>
			</ul>
		</div>

		<hr style="text-align: center; height: 1px; background-color:#ffffa8; width: 1500px">
	</div>
</header>
