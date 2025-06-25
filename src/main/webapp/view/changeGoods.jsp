<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList,bean.Goods,util.MyFormat"%>

<%
ArrayList<Goods> myGoodsList = (ArrayList<Goods>)request.getAttribute("myGoodsList");
//リクエストスコープに登録した書籍情報を取得
Goods goods= (Goods)request.getAttribute("goods");
//MyFormatクラスのオブジェクトを生成
MyFormat format = new MyFormat();
%>

<html>
<head>
<title>商品情報変更</title>
</head>
<body>
<%@include file="../common/userHeader.jsp"%>

<style>
.changegoods{
min-width: 300px;
	width: auto;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
}
.changegoods th{
background-color: #00a7db;

}
.changegoods td{
text-align: center;
}
.changegoods input[type="textarea"] {
	resize: none;
	width: 98%;
	height: 200px;
	vertical-align: top;
}
.changegoods input[type="text"],
.changegoods input[type="file"]{
text-align: center;
	width: 98%;
}

.changegoods select{
	text-align: center;
	width: 80%;
}
.changegoods img {
	width: 100%;
	height:100%;
	max-height: 150px;
	object-fit: cover;
}
</style>
<!-- フォーマットと地域の値があっているか、Attributeの名前 -->

<h1>出品情報変更</h1>
<hr>
<form action="<%=request.getContextPath()%>/changeGoods" name="changeGoods" method="post" enctype="multipart/form-data">
	<table class="changegoods" border="1">
		<tr>
			<th>写真</th>
			<td><img src="<%=request.getContextPath() %>/file/images/<%= goods.getImgPath() %>"
				alt="商品写真"></td>
				
			<td><input type="file" name="image" value="" accept="image/png,image/jpeg" multiple /></input>
				<input type="hidden" name="imgpath" value="<%= goods.getImgPath() %>"></input>
			</td>
		</tr>
		<br>
		<tr>
			<th>商品名</th>
			<td><%=goods.getGoodsName()%></td>
			<td><input type="text" name="goodsname" value=""></td>
		</tr>
		<tr>
			<th>価格</th>
			<td><%=format.yenFormat(goods.getPrice())%></td>
			<td><input type="text" name="price" value="" oninput="this.value=this.value.replace(/[^0-9]/g,'')"></td>
		</tr>
		<tr>
			<th>個数</th>
			<td><%=goods.getQuantity()%></td>
			<td><input type="text" name="quantity" value="" oninput="this.value=this.value.replace(/[^0-9]/g,'')"></td>
		</tr>
		<tr>
			<th>種類</th>
			<td><%=goods.getCategory()%></td>
			<td><input type="text" name="category" value=""></td>
		</tr>
		<tr>
			<th>地域</th>
			<td><%=format.regionFormat(goods.getRegion())%></td>
			<td><select name="region">
					<option value="select">選択</option>
					<option value="0">北海道</option>
					<option value="1">東北</option>
					<option value="2">関東</option>
					<option value="3">中部</option>
					<option value="4">近畿</option>
					<option value="5">中国・四国</option>
					<option value="6">九州</option>
			</select></td>
		</tr>
		<tr>
			<th>備考</th>
			<td><%=goods.getGoodsMemo()%></td>
			<td><input type="textarea" name="memo"></td>
		</tr>
		<tr>
		<input type="hidden" name="goodsid" value="<%= goods.getGoodsId() %>"></input>
			<td colspan="3"><input type="submit" value="更新"></td>
		</tr>
	</table>
</form>
<%@include file="/common/userFooter.jsp"%>
</body>
</html>