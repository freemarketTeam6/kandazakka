<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="bean.Goods"%>

<%
//セッションスコープからのuser情報の取得
User checkUser = (User)session.getAttribute("user");

//userがNULL(＝未ログイン)だったらログインページに飛ばす
if(checkUser==null){
	request.getRequestDispatcher("/view/userLogin.jsp").forward(request, response);
}
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>出品</title>



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>


	<%@include file="/common/userHeader.jsp"%>
		<h1 style="text-align: center; color: #000000;background-color:#ccff99;">出品</h1>
	<br>
	<%

	Goods goods = (Goods)request.getAttribute("goods");
	
	String message = (String)request.getAttribute("empty");
	if(message == null){

		message = "";
	}
	%>
	<h3><%=message%></h3>



	<form action="<%=request.getContextPath() %>/goodsInsert"
		name="goodsInsert" method="post" enctype="multipart/form-data">

		<table class="goodsinsert" style="margin: auto">

			<tr>
				<th style="background-color: #ccff99; width: 100">写真</th>
				<td><input type="file" name="image" required="required"
					accept="image/png,image/jpeg" multiple /></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 100">商品名</th>

				<td><input type="text" name="name" required="required" value="">
				</td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 100">価格</th>
				<td><input type="text" name="price" required="required" value=""

					oninput="this.value=this.value.replace(/[^0-9]/g,'')"></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 100">個数</th>

				<td><input type="text" name=" quantity" required="required" value=""

					oninput="this.value=this.value.replace(/[^0-9]/g,'')"></td>
			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 100">種類</th>

				<td><input type="text" name="category" required="required" value=""
					placeholder="食器、おもちゃ等"></input></td>

			</tr>

			<tr>
				<th style="background-color: #ccff99; width: 100">状態・商品説明</th>

				<td><input type="textarea" name="goods_memo" value=""></input></td>

			</tr>
			<tr>
				<th style="background-color: #ccff99; width: 100">地域</th>
				<td><select name="region" required="required">
						<option value="0">北海道</option>
						<option value="1">東北</option>
						<option value="2">関東</option>
						<option value="3">中部</option>
						<option value="4">近畿</option>
						<option value="5">中国・四国</option>
						<option value="6">九州</option>
				</select>
				<td>
			</tr>

			<tr>
				<td></td>
				<td style="text-align: center"><span id="error">&nbsp;</span></td>
			</tr>
			</table>
			<table style="margin: auto">
			<tr>
				<td colspan=2><br> <input type="submit"
					value="出品する" id="btn" style="width: 100%;"></td>
			</tr>
			</table>
	</form>
	<%@include file="/common/userFooter.jsp"%>
</body>

</html>
