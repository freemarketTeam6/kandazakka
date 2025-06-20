<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.User" %>

<header>
	<div class="header-container">
    	<div class="logo">
			<td style="text-align:center;"><img src="img" alt="神田雑貨店フリマロゴ"></td>
		</div>	
		
		<div style="text-align:right">
		
			<%= user.getNick_name() %>
			<form action="<%=request.getContextPath() %>/LogoutServlet">
			<input type="submit" value="ログアウト">
			</form>
		
		<hr style="text-align: center; height: 3px; background-color:#f3981d; width: 1500px">
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

		<hr style="text-align: center; height: 1px; background-color:#f3981d; width: 1500px">
	</div>
</header>
