<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="bean.User"%>

<html>
<head>
<title>updateuser</title>
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
	<div class="main">




		<%
		User sessionuser = (User) session.getAttribute("user");
		User requestuser = (User) request.getAttribute("user");
		if(requestuser==null){
			requestuser= new User();
			requestuser.setAddress("");
			requestuser.setName("");
			requestuser.setEmail("");
			requestuser.setUserid("");
			requestuser.setNamekana("");
			requestuser.setNickname("");
			requestuser.setTell("");
		}

		String message = (String) request.getAttribute("message");
		if (message == null) {
			message = "";
		}
		%>


		<h1>ユーザー情報変更</h1>

		<form action="<%=request.getContextPath()%>/updateUser"
			name="updateUser" method="post">

			<h3><%=message%></h3>
			<table class="update">


				<tr class="text">
					<td>&nbsp;</td>
					<td>&lt;&lt;変更前情報&gt;&gt;</td>
					<td>&lt;&lt;変更後情報&gt;&gt;</td>
				</tr>

				<tr>
					<td class="thclass"><span>名前</span></td>
					<td><span><%=sessionuser.getName()%></span></td>
					<td><input type="text" name="name" id="name"
						required="required"value="<%=requestuser.getName()%>"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>名前（カナ）</span></td>
					<td><span><%=sessionuser.getNamekana()%></span></td>
					<td><input type="text" name="name_kana" id="name_kana"
						required="required" value="<%=requestuser.getNamekana()%>"></input></td>

				</tr>
				<tr>
					<td class="thclass"><span>ニックネーム</span></td>
					<td><span><%=sessionuser.getNickname()%></span></td>
					<td><input type="text" name="nickname" id="nickname"
						required="required" value="<%=requestuser.getNickname()%>"></input></td>
					<td></td>
				</tr>
				<tr>
					<td class="thclass"><span>ユーザーID</span></td>
					<td><span><%=sessionuser.getUserid()%></span></td>
					<td><input type="text" name="userid" id="userid"
						required="required" value="<%=requestuser.getUserid()%>"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>住所</span></td>
					<td><span><%=sessionuser.getAddress()%></span></td>
					<td><input type="text" name="address" id="address"
						required="required" value="<%=requestuser.getAddress()%>"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>電話番号</span></td>
					<td><span><%=sessionuser.getTell()%></span></td>
					<td><input type="tel" name="tell" id="tell"
						oninput="this.value=this.value.replace(/[^0-9]/g,'')"
						required="required" value="<%=requestuser.getTell()%>"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>Eメール</span></td>
					<td><span><%=sessionuser.getEmail()%></span></td>
					<td><input type="email" name="email" required="required"
						value="<%=requestuser.getEmail()%>"></input></td>
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
					<td><input type="password" id="pass" name="pass"
						required="required"></input></td>
				</tr>
				<tr>
					<td class="thclass"><span>新規パスワード（確認用）</span></td>
					<td>&nbsp;</td>
					<td><input type="password" id="checkpass" name="checkpass"
						required="required"></input></td>
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
					<td colspan=2 style="text-align: center;"><input type="submit"
						value="変更する" id="btn" style="width: 40%;" disabled></td>
				</tr>

			</table>
		</form>

		<script type="text/javascript">
			checkpass.oninput = function() {
				var pass = document.updateUser.pass.value;
				var checkpass = document.updateUser.checkpass.value;
				var element = document.getElementById("btn");
				var textbgColor = document.getElementById("checkpass");

				if (pass == "") {
					element.disabled = true;
					textbgColor.style.backgroundColor = "#ffffff";
					error.innerHTML = "";

				} else if (pass != checkpass) {
					element.disabled = true;
					textbgColor.style.backgroundColor = "#ffb3b3";
					error.innerHTML = "パスワードが一致していません";

				} else if (pass == checkpass) {
					element.disabled = false;
					textbgColor.style.backgroundColor = "#ffffff";
					error.innerHTML = "";
				}

			}

			for (var n = 1; n <= 2; n++) {
				var span = document.querySelectorAll(".update td:nth-child("
						+ n + ") > span");
				var maxw = 0;
				for (var i = 0; i < span.length; i++) {
					if (span[i].offsetWidth > maxw) {
						maxw = span[i].offsetWidth
					}
				}
				for (var i = 0; i < span.length; i++) {
					span[i].style.width = maxw + "px";
				}
			}
		</script>



	</div>



</body>
</html>