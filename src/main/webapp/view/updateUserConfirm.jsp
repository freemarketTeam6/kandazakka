<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="bean.User"%>

<html>
<head>
<title>detailUser</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/style.css">

<style>
body {
	min-width: 800px;
}

.updateConfirm {
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

.updateConfirm td {
	text-align: center;
	width: fit-content;
}

.updateConfirm span {
	display: inline-block;
}

.updateConfirm td:nth-child(n)>span {
	text-align: left;
}

.text td {
	text-align: center;
	color: #b22222;
}
</style>
</head>
<body>
	<div class="main">
		<header>
			<%@include file="/common/header.jsp"%>
		</header>

		<%User user = (User)request.getAttribute("user"); %>

		<h1>ユーザー情報変更</h1>

		<table class="updateConfirm">

			<tr>
				<td class="thclass"><span>ユーザーID</span></td>
				<td><span><%=user.getUserid()%></span></td>
			</tr>
			<tr>
				<td class="thclass"><span>名前</span></td>
				<td><span><%=user.getName()%></span></td>
			</tr>
			<tr>
				<td class="thclass"><span>名前（カナ）</span></td>
				<td><span><%=user.getNamekana()%></span></td>

			</tr>
			<tr>
				<td class="thclass"><span>ニックネーム</span></td>
				<td><span><%=user.getNickname()%></span></td>
			</tr>
			<tr>
				<td class="thclass"><span>住所</span></td>
				<td><span><%=user.getAddres()%></span></td>
			</tr>
			<tr>
				<td class="thclass"><span>電話番号</span></td>
				<td><span><%=user.getTell()%></span></td>
			</tr>
			<tr>
				<td class="thclass"><span>Eメール</span></td>
				<td><span><%=user.getEmail()%></span></td>
			</tr>

			<tr>
				<td class="thclass"><span>パスワード</span></td>
				<td><span><%=user.getPassword()%></span></td>
			</tr>
			<tr>
				<td class="thclass"><span>メモ</span></td>
				<td><span><%=user.getMemo()%></span></td>
			</tr>

			<tr>
				<td class="thclass"><span>メモ</span></td>
				<td><span><%=user.getMemo()%></span></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=2 style="text-align: center;">ユーザー情報を上記の内容に変更しました</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=2 style="text-align: center;"><button type=“button” onclick="<%=request.getContextPath()%>/view/mypage.jsp">マイページへ</button></td>
			</tr>
			



		</table>

		<script type="text/javascript">

			for (var n = 1; n <= 2; n++) {
				var span = document.querySelectorAll(".updateConfirm td:nth-child("
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

		<footer>
			<%@include file="/common/footer.jsp"%>
		</footer>

	</div>

</body>
</html>