<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList, bean.Book, util.MyFormat"%>


<html>
<head>
<title>書籍管理メニュー画面</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/css/style.css">
</head>
<body>
	<%@include file="/common/userHeader.jsp"%>
	<a href="<%= request.getContextPath() %>/ListServlet">【書籍一覧】</a>
	<a href="<%= request.getContextPath() %>/view/insert.jsp">【書籍登録】</a>
	<h1 style="text-align: center;">書籍登録</h1>
	<hr size=5px color="black">

	<div class="insert">
		<form action="<%=request.getContextPath()%>/newRegistration" method="post">

				<tr>
					<td id="leftCol">名前</td>
					<td id="rightCol"><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td id="leftCol">名前（カナ）</td>
					<td id="rightCol"><input type="text" name="name_kana" id="name_kana"></td>
					<td></td>
				</tr>
				<tr>
					<td id="leftCol">ニックネーム</td>
					<td id="rightCol"><input type="text" name="price" id="insertPRICE"></td>
					<td></td>
				</tr>
				<tr>
					<td id="leftCol">画像</td>
					<td id="rightCol">
						<div class="over-text">
							<span class="select-image" id="fileSelectMessage">Not Selected</span>
						</div>
					</td>
				</tr>
			</table>

			<div class="submit">
				<input type="submit" value="登録" id="insertSubmit">
			</div>

		</form>
	</div>
	<script src="<%= request.getContextPath() %>/view/js/jquery-3.7.1.js"></script>
	<script src="<%= request.getContextPath() %>/view/js/script.js"></script>
</body>
<%@include file="/common/userFooter.jsp"%>
</html>