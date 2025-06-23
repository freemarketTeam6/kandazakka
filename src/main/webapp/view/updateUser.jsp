<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="bean.User"%>

<html>
<head>
<title>updateUser</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

<style>
body {
	min-width: 800px;
}

.update {
	min-width: 800px;
	width: 90%;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
	border-spacing: 4px;
}

.thclass {
	text-align: center;
	width: fit-content;
	background-color: #cccccc;
	font-weight: bold;
}

.update td {
	text-align: center;
	width: fit-content;
}

.update span {
	display: inline-block;
}

.update td:nth-child(n)>span {
	text-align: left;
}

.update td input {
	width: 100%;
}

.update td select {
	text-align: center;
	width: 100%;
}

.update input[type="textarea"] {
	resize: none;
	width: 100%;
	height: 200px;
}

.contact input[type="text"], .contact input[type="password"], .contact input[type="email"],
	.contact input[type="tel"] {
	width: 100%;
}

.text td {
	text-align: center;
	color: #b22222;
}
</style>

</head>
<body>
<%@include file="../common/userHeader.jsp"%>
	<div class="main">


		<!-- requestUserは、一度目の入力の際に未入力の項目があった場合、
			再入力の手間を省けるよう、自動入力させるために必要	 -->

		<%
		User sessionUser = (User) session.getAttribute("user");
		User requestUser = (User) request.getAttribute("user");

		String message = (String) request.getAttribute("message");
		if (message == null) {
			message = "";
		}
		%>

		
		<h1>ユーザー情報変更</h1>
		
		<!-- inputタグの中に value = requestUser.get●●()を記述していたが、
				マイページからこのjspに飛んだ時にnullのためエラーが出る。
				6/23 14時点では、いったんvalueを削除して進めることとする -->

		<form action="<%=request.getContextPath()%>/updateUser"
			name="updatesessionUser" method="post">

			<h3><%=message%></h3>
			<table class="update">


				<tr class="text">
					<td>&nbsp;</td>
					<td>&lt;&lt;変更前情報&gt;&gt;</td>
					<td>&lt;&lt;変更後情報&gt;&gt;</td>
				</tr>

				<tr>
					<td class="thclass"><span>名前</span></td>
					<td><span><%=sessionUser.getName()%></span></td>
					<td><input type="text" name="name" id="name"
						required="required"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>名前（カナ）</span></td>
					<td><span><%=sessionUser.getNamekana()%></span></td>
					<td><input type="text" name="name_kana" id="name_kana"
						required="required"></input></td>

				</tr>
				<tr>
					<td class="thclass"><span>ニックネーム</span></td>
					<td><span><%=sessionUser.getNickname()%></span></td>
					<td><input type="text" name="nickname" id="nickname"
						required="required"></input></td
					<td></td>
				</tr>
				<tr>
					<td class="thclass"><span>ユーザーID</span></td>
					<td><span><%= sessionUser.getUserid() %></span></td>
					<td><input type="text" name="userID" id="userid"
						required="required"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>住所</span></td>
					<td><span><%= sessionUser.getAddress() %></span></td>
					<td><input type="text" name="address" id="address"
						required="required"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>電話番号</span></td>
					<td><span><%= sessionUser.getTell() %></span></td>
					<td><input type="tel" name="tell" id="tell"
						oninput="this.value=this.value.replace(/[^0-9]/g,'')"
						required="required"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>Eメール</span></td>
					<td><span><%= sessionUser.getEmail() %></span></td>
					<td><input type="email" name="email" required="required"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>メモ</span></td>
					<td>&nbsp;</td>
					<td><input type="textarea" name="memo"></td>
				</tr>
				<tr>
					<td class="thclass"><span>現在のパスワード</span></td>
					<td>&nbsp;</td>
					<td><input type="password" id="oldpass" name="oldpass"
						required="required"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>新規パスワード</span></td>
					<td>&nbsp;</td>
					<td><input type="password" id="pass" name="pass" required="required"></td>
				</tr>
				<tr>
					<td class="thclass"><span>新規パスワード（確認用）</span></td>
					<td>&nbsp;</td>
					<td><input type="password" id="checkpass" name="checkpass"
						required="required" oninput="CheckPassword(this)"></input></td>
				</tr>
				<tr>
					<td></td>
					<td colspan=2 style="text-align: center"><p id="error"></p></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td colspan=2 style="text-align: center;">
						<input type="submit" value="変更する" id="btn" style="width: 40%;">
					</td>
				</tr>

			</table>
		</form>

		<script type="text/javascript">

		function CheckPassword(confirm){
			//入力値の取得
			const input1 = pass.value;
			const input2 = checkpass.value;
			if ( input1 != input2){
				confirm.setCustomValidity("入力値が一致していません");
			}else{
				confirm.setCustomValidity("");
				}
		}
		</script>
	</div>
	<%@include file="../common/userFooter.jsp"%>
</body>
</html>