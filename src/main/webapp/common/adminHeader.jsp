<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.User" %>

<style>
@charset "UTF-8";*{
    margin: 0;
    padding: 0;
}

header{
    width: 100%;
    height: 110px;
    padding: 0 5%;
    box-sizing: border-box;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

nav{
    width: 50%;
}

nav ul{
    display: flex;
    list-style-type: none;
    justify-content: space-around;
}

nav ul li a{
    text-decoration: none;
    color: #000;
}
</style>
<header>
	<tr>
	<br>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/view/top.jsp">
			<img src="${pageContext.request.contextPath}/pic/kandafm.png" alt="ロゴ"border="0">
			</a>
		</div>	
		
		<form action="<%=request.getContextPath()%>/SearchServlet"style="display: inline;">
			<input id="sbox2" name="keyword" type="text" placeholder="キーワードを入力" />
			<input id="sbtn1" type="submit" value="検索" />
		</form>
		
	
		<nav>
			<ul>
				<li><a href="<%=request.getContextPath()%>/exhibitList"style="margin-right: 30px;">出品商品</a></li>
				<li><a href="<%=request.getContextPath()%>/sellerList"style="margin-right: 30px;">出品者</a></li>
				<li><a href="<%=request.getContextPath()%>/userList"style="margin-right: 30px;">ユーザー</a></li>
				<li><a href="<%=request.getContextPath()%>/salesList"style="margin-right: 30px;">売上</a></li>
				<li><a href="<%=request.getContextPath()%>/listOfInquiries"style="margin-right: 30px;">問い合わせ</a></li>
			

		<%
		//ユーザー情報取得
		User user=(User)session.getAttribute("user");
		//未ログインの場合
		if (user == null || user.getAuthority().equals("u")) {	
		%>
			<p style="font-size: 15px">未ログイン</p>
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
			</ul>
		</nav>
	<tr>	
 <br>

</header>
