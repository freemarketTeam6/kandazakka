<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.User"%>

<%
//リクエストスコープからのデータの取得
ArrayList<User> list = (ArrayList<User>) request.getAttribute("user_list");
String error = (String) request.getAttribute("error");
%>

<html>
<head>
<title>神田雑貨店フリマ</title>
</head>

<body>
	<%@include file= "../common/header.jsp" %>

<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
	<h1 style="text-align: center;color:#000000;">マイページ</h1>
<hr style="text-align: center; height: 2px; background-color: black; width: 950px">

	<table style="margin:20px auto; border: solid 0px; cellpadding:4px; border-spacing:4px; width:540px;">		
		<tr>
			<td style="text-align:center; color:#000000; font-size:24px"><strong>登録情報</strong></td>
		</tr>
	</table>

	<div style="margin-bottom: 250px">
	<div style="text-align: center">	
		
		<table style="margin: auto">
		<br>
			<tr>	
				<th style="background-color: #00a7db; width: 100">名前</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=user.getName()%></td>
			</tr>	
			<tr>	
				<th style="background-color: #00a7db; width: 100">名前(カナ)</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=user.getName_kana()%></td>
			</tr>
			<tr>	
				<th style="background-color: #00a7db; width: 100">ニックネーム</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=user.getNick_name()%></td>
			</tr>
			<tr>	
				<th style="background-color: #00a7db; width: 100">住所</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=user.getAddress()%></td>
			</tr>
			<tr>
				<th style="background-color: #00a7db; width: 100">メールアドレス</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=user.getEmail()%></td>
			</tr>
			<tr>
				<th style="background-color: #00a7db; width: 100">電話番号</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=user.getTell()%></td>
			</tr>
			
		</table>
	</div>
	
	<br>
	<div style="text-align: center">
	<form>
		<input type="submit" name="update" value="ユーザー情報変更"></input>
	</form>
	</div>
	
	<table style="text-align:center;margin: auto; width: 850px">
		<tr>
			<td style="text-align: center; width: 80px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/view/goodsInsert.jsp">出品</a>]
			</td>
		</tr>
		<tr>
			<td style="text-align: center; width: 80px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/view/mygoodsList.jsp">出品一覧</a>]
			</td>
		</tr>
		<tr>
			<td style="text-align: center; width: 80px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/view/buyList.jsp">購入一覧</a>]
			</td>
		</tr>
		<tr>
			<td style="text-align: center; width: 80px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/view/newInquiry.jsp">お問い合わせ</a>]
			</td>
		</tr>
	</table>
	
	<%@include file= "../common/footer.jsp" %>
</body>
</html>