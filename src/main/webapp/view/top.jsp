<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Goods, bean.User, util.MyFormat"%>


<%
ArrayList<Goods> goodsList = (ArrayList<Goods>)request.getAttribute("goodsList");
User user = (User)session.getAttribute("user");
%>

<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>トップ画面</title>
  <style>
    body {
      margin: 0;
      font-family: sans-serif;
    }

    header {
      display: flex;
      justify-content: center; /* 全体中央寄せ */
      align-items: center;
      padding: 10px;
      border-bottom: 1px solid #000;
      gap: 300px; /* ← 間隔を広げた */
    }

    .search-box {
      display: flex;
      align-items: center;
    }

    .search-box input[type="text"] {
      padding: 5px;
    }

    .search-box button {
      margin-left: 5px;
      padding: 5px 10px;
    }

    .login-btn input {
      padding: 5px 10px;
    }
    
    table{
    	text-align: center;
    	width:100%;
    }
    .item{
    	margin:auto;
    	width:80%;
    	border-spacing: 10px;
    }
    .item td{
    	text-align:center;
    }
  </style>
</head>
<body>

  <header>
  	<form action="/view/top.jsp">
  		<div>神田雑貨店フリマ</div>
  	</form>
    
    <form action="<%= request.getContextPath() %>/search">
      <div class="search-box">
      	<input type="text" placeholder="検索">
      	<button>検索</button>
      </div>
    </form>
    
    <form action="<%= request.getContextPath() %>/view/userLogin.jsp">
    	<div class="login-btn">
       		<input type="submit" value="ログイン">
    	</div>
    </form>
    
  </header>

	<table>
	<tr>
		<td><a href="<%= request.getContextPath() %>/view/mypage.jsp">マイページ</a></td>
		<td><a href="<%= request.getContextPath() %>/showCart">カート内容</a></td>
		<td><a href="<%= request.getContextPath() %>/goodsInsert">出品</a></td>
		<td><a href="<%= request.getContextPath() %>/adminLogin">管理者ページ</a></td>
	</tr>
	</table>
	
	<hr>
	
	<div>
	<% 
	 if (goodsList != null && !goodsList.isEmpty()) {
		 for ( int i = 0; i < goodsList.size(); i++){ %>
	 }
		<div style="display: inline-block;">
		<!-- 画像のパスは今後変更予定 -->
			<img src="<%= goodsList.get(i).getImgPath() %>" alt="写真" width="200" height="200">
			<%=  goodsList.get(i).getPrice()%>円
		</div>		
	<% if ( i % 5 == 0 ){%>
			<br>
		<% } %>
		<% } %>
		<% } %>
	</div>

</body>
</html>