<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>お問い合わせ新規作成</title>
</head>
<body style="background-color:#FFFFFF; text-align:center;">

	<h1>お問い合わせ</h1>
	
	<form action="<%=request.getContextPath()%>/newInpuiry" method="post">
		<table border="1">
			<tr>
				<th>お問い合わせカテゴリ</t>
				<td><select name="inquiry">
					<option value="select">選択</option>
					<option value="">北海道</option>
					<option value="">東北</option>
					<option value="">関東</option>
					<option value="">中部</option>
					<option value="">近畿</option>
					<option value="">中国・四国</option>
					<option value="">九州</option>
			</select></td>
			</tr>
			<tr>
				<td>お問い合わせタイトル</td>
				<td><input type="text" name="inquiry" value=""></td>
			</tr>
			<tr>
				<td>詳細記入欄</td>
				<td><textarea name="inquirydetail" value=""></textarea></td>
			</tr>
			<tr>
				<td>添付ファイル</td>
				<td><input type="file" name="inquirypath" size="30" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="sendinquiry" value="送信"></input></td>
			</tr>
		</table>
		
	</form>
</body>
</html>