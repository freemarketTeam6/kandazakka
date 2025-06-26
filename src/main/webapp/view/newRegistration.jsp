<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>ユーザー登録</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>
<body>
	<%@include file="/common/userHeader.jsp"%>
	<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
	<h1 style="text-align: center;color:#000000;">ユーザー登録</h1>
	<hr style="text-align: center; height: 2px; background-color: black; width: 950px">
	<p style="margin-top:50px"></p>

	<div class="registration">
		<form action="<%=request.getContextPath()%>/newRegistration" method="post">
				
				<table style="margin: auto">
				<tr>
					<td id="leftCol">名前</td>
					<td id="rightCol"><input type="text" name="name" id="name" required></td>
				</tr>
				
				<tr>
					<td id="leftCol">名前（カナ）</td>
					<td id="rightCol"><input type="text" name="name_kana" id="name_kana" required></td>
				</tr>
				
				<tr>
					<td id="leftCol">ニックネーム</td>
					<td id="rightCol"><input type="text" name="nickname" id="nickname" required></td>
				</tr>
				
				<tr>
					<td id="leftCol">住所</td>
					<td id="rightCol"><input type="text" name="address" id="address" required></td>
				</tr>
				
				<tr>
					<td id="leftCol">電話番号</td>
					<td id="rightCol"><input type="text" name="tell" id="tell" required></td>
				</tr>				
								
				<tr>
					<td id="leftCol">メールアドレス</td>
					<td id="rightCol"><input type="text" name="email" id="email" required></td>
				</tr>
				
				<tr>
					<td id="leftCol">ユーザーID</td>
					<td id="rightCol"><input type="text" name="userID" id="userID" required></td>
				</tr>				
				
				<tr>
					<td id="leftCol">パスワード</td>
					<td id="rightCol"><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<td id="leftCol">パスワード（確認用）</td>
					<td id="rightCol"><input type="password" name="passwordConfirm" id="passwordConfirm" required></td>
				</tr>
				
				<tr>
					<td id="leftCol">プロフィール</td>
					<td id="rightCol"><textarea name="memo" cols="30"></textarea></td>
				</tr>	
																				
			</table>

			<br><br>
			<div class="submit">
				<p style="text-align: center">
					<input type="submit" value="登録" id="insertSubmit">
				</p>
			</div>

		</form>
		<p style="margin-top:50px"></p>
		<p style="text-align: center">
			<a href="<%= request.getContextPath() %>/list">トップ画面へ</a>
		</p>
	</div>
	<!-- 正規表現JavaScriptで追加できたら -->
	<script src="<%= request.getContextPath() %>/view/js/script.js"></script>
</body>
<%@include file="/common/userFooter.jsp"%>
</html>
