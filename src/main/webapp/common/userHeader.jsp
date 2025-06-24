<%@page contentType="text/html; charset=UTF-8" %>
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
			<a href="<%=request.getContextPath()%>/list">
			<img src="${pageContext.request.contextPath}/pic/kandafm.png" alt="ロゴ"border="0">
			</a>
		</div>	
		
		<form action="<%=request.getContextPath()%>/search"style="display: inline;">
			<input id="sbox2" name="keyword" type="text" placeholder="キーワードを入力" />

			<select name="region">
						<option value="">選択してください</option>
						<option value="0">北海道</option>
						<option value="1">東北</option>
						<option value="2">関東</option>
						<option value="3">中部</option>
						<option value="4">近畿</option>
						<option value="5">中国・四国</option>
						<option value="6">九州</option>
			</select>
				
			<input id="sbtn1" type="submit" value="検索" />
		</form>
	
		<nav>
			<ul>
				<li><a href="<%=request.getContextPath()%>/view/goodsInsert.jsp">
					<img src="${pageContext.request.contextPath}/pic/box.png" alt="ロゴ"border="0"></a><li>
				<li><a href="<%=request.getContextPath()%>/list">
					<img src="${pageContext.request.contextPath}/pic/top.png" alt="ロゴ"border="0"></a><li>
				<li><a href="<%=request.getContextPath()%>/showCart">
					<img src="${pageContext.request.contextPath}/pic/cart.png" alt="ロゴ"border="0"></a><li>	
				<li><a href="<%=request.getContextPath()%>/view/mypage.jsp">
					<img src="${pageContext.request.contextPath}/pic/mypage.png" alt="ロゴ"border="0"></a><li>
				
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
			</ul>
		</nav>
<br>
</header>
