<%@page contentType="text/html; charset=UTF-8"%>


<html>
<head>
<title>書籍管理メニュー画面</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>
<body>
	<%@include file="/common/header.jsp"%>
	<a href="<%= request.getContextPath() %>/top">トップ画面へ</a>
	<h1 style="text-align: center;">ユーザー登録</h1>
	<hr size=5px color="black">

	<div class="registration">
		<form action="<%=request.getContextPath()%>/newRegistration" method="post">
				
				<tr>
					<td id="leftCol">名前</td>
					<td id="rightCol"><input type="text" name="name" id="name"></td>
				</tr>
				
				<tr>
					<td id="leftCol">名前（カナ）</td>
					<td id="rightCol"><input type="text" name="name_kana" id="name_kana"></td>
				</tr>
				
				<tr>
					<td id="leftCol">ニックネーム</td>
					<td id="rightCol"><input type="text" name="nickname" id="nickname"></td>
				</tr>
				
				<tr>
					<td id="leftCol">住所</td>
					<td id="rightCol"><input type="text" name="address" id="address"></td>
				</tr>
				
				<tr>
					<td id="leftCol">電話番号</td>
					<td id="rightCol"><input type="text" name="tell" id="tell"></td>
				</tr>				
								
				<tr>
					<td id="leftCol">メールアドレス</td>
					<td id="rightCol"><input type="text" name="email" id="email"></td>
				</tr>
				
				<tr>
					<td id="leftCol">ユーザーID</td>
					<td id="rightCol"><input type="text" name="userID" id="userID"></td>
				</tr>				
				
				<tr>
					<td id="leftCol">パスワード</td>
					<td id="rightCol"><input type="password" name="password" id="password"></td>
				</tr>
				<tr>
					<td id="leftCol">パスワード（確認用）</td>
					<td id="rightCol"><input type="password" name="passwordConfirm" id="passwordConfirm"></td>
				</tr>
				
				<tr>
					<td id="leftCol">プロフィール</td>
					<td id="rightCol"><textarea name="memo" cols="30"></textarea></td>
				</tr>	
																				
			</table>

			<div class="submit">
				<input type="submit" value="登録" id="insertSubmit">
			</div>

		</form>
	</div>
	<!-- 正規表現JavaScriptで追加できたら -->
	<script src="<%= request.getContextPath() %>/view/js/script.js"></script>
</body>
<%@include file="/common/footer.jsp"%>
</html>