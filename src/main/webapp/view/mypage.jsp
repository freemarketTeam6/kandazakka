<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.User"%>

<%
//セッションスコープからのuser情報の取得
User checkUser = (User)session.getAttribute("user");
//userがNULL(＝未ログイン)だったらログインページに飛ばす&例外対策

if (checkUser == null) {
	checkUser = new User();
	checkUser.setAddress("");
	checkUser.setName("");
	checkUser.setEmail("");
	checkUser.setUserid("");
	checkUser.setNamekana("");
	checkUser.setNickname("");
	checkUser.setTell("");
	request.getRequestDispatcher("/view/userLogin.jsp").forward(request, response);
}


%>

<html>
<head>
<title>神田雑貨店フリマ</title>
</head>

<body>
	<%@include file= "/common/userHeader.jsp" %>

	<h1 style="text-align: center; color: #000000;background-color:#ccff99;">マイページ</h1>

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
				<th style="background-color: #ccff99; width: 100">名前</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=checkUser.getName()%></td>
			</tr>	
			<tr>	
				<th style="background-color: #ccff99; width: 100">名前(カナ)</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=checkUser.getNamekana()%></td>
			</tr>
			<tr>	
				<th style="background-color: #ccff99; width: 100">ニックネーム</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=checkUser.getNickname()%></td>
			</tr>
			<tr>	
				<th style="background-color: #ccff99; width: 100">住所</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=checkUser.getAddress()%></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 100">メールアドレス</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=checkUser.getEmail()%></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 100">電話番号</th>
				<td style="text-align:center; color:#000000; font-size:20px"><%=checkUser.getTell()%></td>
			</tr>
			
		</table>
	</div>
	
	<br>
	<div style="text-align: center">
	<form action="<%=request.getContextPath() %>/view/updateUser.jsp">
		<input type="submit" name="update" value="ユーザー情報変更"></input>
	</form>
	</div>
	<br>
	<table style="text-align:center;margin: auto; width: 450px">
		<tr>
			<td style="text-align: center; width: 10px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/view/goodsInsert.jsp">出品</a>]
			</td>
		
			<td style="text-align: center; width: 10px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/mygoodsList">出品一覧</a>]
			</td>
		
			<td style="text-align: center; width: 10px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/buyList">購入一覧</a>]
			</td>
		
			<td style="text-align: center; width: 10px; font-size: 15px;">[<a
				href="<%=request.getContextPath() %>/inquiryList">お問い合わせ</a>]
			</td>
		</tr>
	</table>
	<br>
	<%@include file= "../common/userFooter.jsp" %>
</body>
</html>
