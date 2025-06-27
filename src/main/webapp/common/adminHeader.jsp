<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="bean.User"%>

<style>
@charset "UTF-8"; 

* {
	margin: 0;
	padding: 0;
}

header {
	width: 100%;
	height: 110px;
	padding: 0 5%;
	box-sizing: border-box;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

nav {
	width: 50%;
}

nav ul {
	display: flex;
	list-style-type: none;
	justify-content: space-around;
}

nav ul li a {
	text-decoration: none;
	color: #000;
}
</style>
<header>

	<%
	//ユーザー情報取得
	User user = (User) session.getAttribute("user");
	if (user != null && user.getAuthority().equals("m")) {
	%>
	<tr>
		<br>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/view/top.jsp"> <img
				src="${pageContext.request.contextPath}/pic/kandafm.png" alt="ロゴ"
				border="0">
			</a>
		</div>




		<nav>
			<ul>
				<li><a href="<%=request.getContextPath()%>/view/adminMenu.jsp">
						<img src="${pageContext.request.contextPath}/pic/home.png"
						alt="ロゴ" border="0">
				</a>
				<li>
				<li><a href="<%=request.getContextPath()%>/exhibitList"> <img
						src="${pageContext.request.contextPath}/pic/box2.png" alt="ロゴ"
						border="0"></a>
				<li>
				<li><a href="<%=request.getContextPath()%>/sellerList"> <img
						src="${pageContext.request.contextPath}/pic/box3.png" alt="ロゴ"
						border="0"></a>
				<li>
				<li><a href="<%=request.getContextPath()%>/userList"> <img
						src="${pageContext.request.contextPath}/pic/user.png" alt="ロゴ"
						border="0"></a>
				<li>
				<li><a href="<%=request.getContextPath()%>/salesList"> <img
						src="${pageContext.request.contextPath}/pic/okane.png" alt="ロゴ"
						border="0"></a>
				<li>
				<li><a href="<%=request.getContextPath()%>/listOfInquiries">
						<img src="${pageContext.request.contextPath}/pic/mail.png"
						alt="ロゴ" border="0">
				</a>
				<li><%=user.getNickname()%>

					<form action="<%=request.getContextPath()%>/logout">
						<input type="submit" value="ログアウト">
					</form> <%
 //未ログインの場合
 } else if (user == null || user.getAuthority().equals("u")) {
 %>

					<tr>
						<br>
						<div class="logo">
							<a href="<%=request.getContextPath()%>/view/top.jsp"> <img
								src="${pageContext.request.contextPath}/pic/kandafm.png"
								alt="ロゴ" border="0">
							</a>
						</div>




						<nav>
							<ul>
								<li><img
									src="${pageContext.request.contextPath}/pic/home.png" alt="ロゴ"
									border="0"></a>
								<li>
								<li><img
									src="${pageContext.request.contextPath}/pic/box2.png" alt="ロゴ"
									border="0"></a>
								<li>
								<li><img
									src="${pageContext.request.contextPath}/pic/box3.png" alt="ロゴ"
									border="0"></a>
								<li>
								<li><img
									src="${pageContext.request.contextPath}/pic/user.png" alt="ロゴ"
									border="0"></a>
								<li>
								<li><img
									src="${pageContext.request.contextPath}/pic/okane.png" alt="ロゴ"
									border="0"></a>
								<li>
								<li><img
									src="${pageContext.request.contextPath}/pic/mail.png" alt="ロゴ"
									border="0"></a>
								<li>
									<p style="font-size: 15px; white-space:nowrap">未ログイン</p> <%
		}else{
		%> <%= user.getNickname() %>

									<form action="<%=request.getContextPath() %>/logout">
										<input type="submit" value="ログアウト">
									</form> <%
		}
		%>
								
							</ul>
						</nav>
					<tr>
						<br>
</header>
