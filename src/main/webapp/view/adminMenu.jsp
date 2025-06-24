<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>管理者メニュー</title>
</head>

<body>
<%@include file= "../common/adminHeader.jsp" %>

	<h1 style="text-align: center; color: #000000;">管理者メニュー</h1>
	<br>
	<div style="margin-bottom: 250px">
		<div style="text-align: center">


			<table style="text-align: center; margin: auto; width: 850px">
				<tr>
					<td style="text-align: center; width: 80px;">[<a
						href="<%=request.getContextPath()%>/userList">ユーザー一覧</a>]
					</td>
				</tr>
				<tr>
					<td style="text-align: center; width: 80px;">[<a
						href="<%=request.getContextPath()%>/exhibitList">出品・取引情報一覧</a>]
					</td>
				</tr>
				<tr>
					<td style="text-align: center; width: 80px;">[<a
						href="<%=request.getContextPath()%>/salesList">売上一覧表示</a>]
					</td>
				</tr>
				<tr>
					<td style="text-align: center; width: 80px;">[<a
						href="<%=request.getContextPath()%>/sellerList">出品者表示</a>]
					</td>
				</tr>
				<tr>
					<td style="text-align: center; width: 80px;">[<a
						href="<%=request.getContextPath()%>/listOfInquiries">お問い合わせ一覧</a>]
					</td>
				</tr>
				<tr>
					<td style="text-align: center; width: 100px"><a
						href="<%=request.getContextPath()%>/logout">【ログアウト】</a></td>
				</tr>
			</table>
	<br>
	<%@include file="/common/adminFooter.jsp"%>
</body>
</html>
