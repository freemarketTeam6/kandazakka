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
		<%User user=(User)session.getAttribute("user");%>
			<%= user.getNickname() %>
			<form action="<%=request.getContextPath() %>/LogoutServlet">
			<input type="submit" value="ログアウト">
			</form>
		
		<hr style="text-align: center; height: 3px; background-color:#ffffa8; width: 1500px">
		</div>

		<div  style="text-align: center">
			<ul>
				<a href="<%=request.getContextPath()%>/view/exhibitList.jsp"style="margin-right: 30px;">出品商品</a>
				<a href="<%=request.getContextPath()%>/view/sellerList.jsp"style="margin-right: 30px;">出品者</a>
				<a href="<%=request.getContextPath()%>/view/userList.jsp"style="margin-right: 30px;">ユーザー</a>
				<a href="<%=request.getContextPath()%>/view/salesList.jsp"style="margin-right: 30px;">売上</a>
				<a href="<%=request.getContextPath()%>/view/listOfInquiry.jsp"style="margin-right: 30px;">問い合わせ</a>
			</ul>
		</div>

		<hr style="text-align: center; height: 1px; background-color:#ffffa8; width: 1500px">
	</div>
</header>
