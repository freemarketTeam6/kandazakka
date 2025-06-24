<%@page contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>入金完了</title>
</head>

<body>

<%@include file = "/common/header.jsp"%>

<div>

<p>入金が完了しました</p>

<%
//リクエストスコープから商品のGoodsオブジェクトを取得
Goods goods = (Goods)request.getAttribute("goods");


%>



<table>写真

<th>写真</th>
<td><img src="<%=goods.getImgPath%>" alt="商品写真"></td>

<th>商品名</th>
<td><%=goods.getGoodsName()%></td>

<th>個数</th>
<td><%=goods.getQuantity() %></td>

<th>種類</th>
<td><%=goods.getCategory() %></td>

<th>備考</th>
<td><%=goods.getGoodsMemo() %></td>

<th>価格</th>
<td><%=goods.getPrice() %></td>



</table>



商品発送までしばらくお待ちください

<form action="<%=request.getContextPath() %>/buyList" method="POST">
<input type="submit"  value="購入一覧へ戻る">
</form>


</div>

<%@include file = "/common/footer.jsp"%>







</body>
</html>