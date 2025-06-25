<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>お問い合わせ新規作成</title>
	<style>
	.Form{
		margin-top: 20px;
	}
	
		.Form table{
			width:40%;
			margin: 0 auto;
		}
		
		.Form table th{
			text-align: left;
			height: 40px;
		}
		
		.Form table t{
			
		}
		
.Form-Item-Label-Required {
  border-radius: 6px;
  margin-right: 8px;
  padding:5px;
  width: 48px;
  display: inline-block;
  text-align: center;
  background: #5bc8ac;
  color: #fff;
  font-size: 14px;
}

.Form-Item-Input {
  border: 1px solid #ddd;
  border-radius: 6px;
  margin-bottom: 5px;
  height: 48px;
  flex: 1;
  width: 100%;
  max-width: 410px;
  background: #eaedf2;
  font-size: 18px;
}

.Form-Item-Textarea {
  border: 1px solid #ddd;
  border-radius: 6px;
  height: 216px;
  width: 100%;
  background: #eaedf2;
  font-size: 18px;
}

.Form-Btn {
  border-radius: 6px;
  margin-top: 32px;
  margin-left: auto;
  margin-right: auto;
  padding-top: 20px;
  padding-bottom: 20px;
  width: 280px;
  display: block;
  letter-spacing: 0.05em;
  background: #5bc8ac;
  color: #fff;
  font-weight: bold;
  font-size: 20px;
}
	</style>
</head>
<body style="background-color:#FFFFFF; text-align:center;">


<%@include file="../common/userHeader.jsp"%>
	<h1 style="text-align: center; color: #000000;background-color:#ccff99;">お問い合わせ</h1>
	
<div class="Form">
	<form action="<%=request.getContextPath()%>/newInquiry" method="POST" enctype="multipart/form-data">
		<table>
		<div class="Form-item">
			<tr>
				<th><span class="Form-Item-Label-Required">必須</span>お問い合わせカテゴリ</th>
				<td>
				<select name="category">
					<option value="select" disabled>選択</option>
					<option value="0">取引に関する問題</option>
					<option value="1">出品に関する質問</option>
					<option value="2">商品に関する質問</option>
					<option value="3">購入に関する質問</option>
					<option value="4">配送に関する問題</option>
					<option value="5">アカウントに関する問題</option>
					<option value="6">支払い・返金について</option>
					<option value="7">違反報告・安全に関する問題</option>
					<option value="8">アプリの不具合・バグ報告</option>
					<option value="9">その他</option>
				</select>
				</td>
			</tr>
		</div>
		
		<div>
			<tr>
				<th><span class="Form-Item-Label-Required">必須</span>お問い合わせタイトル</th>
				<td><input type="text" name="title" class="Form-Item-Input" required></td>
			</tr>
		</div>	
			<tr>
				<th><span class="Form-Item-Label-Required">必須</span>詳細記入欄</th>
				<td><textarea name="contents" class="Form-Item-Textarea"></textarea></td>
			</tr>
			<tr>
				<th>添付ファイル</th>
				<td><input type="file" name="file_path" size="30" accept="image/png,image/jpeg" multiple /></td>
			</tr>
		</table>
		
		<input type="submit" name="sendinquiry" value="送信" class="Form-btn">
		
	</form>
</div>

	<%@include file="../common/userFooter.jsp"%>
</body>
</html>